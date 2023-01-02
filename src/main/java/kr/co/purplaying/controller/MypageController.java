package kr.co.purplaying.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.AlarmDto;
import kr.co.purplaying.domain.LikeDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.AlarmService;
import kr.co.purplaying.service.LikeService;
import kr.co.purplaying.service.ProjectService;

@Controller
public class MypageController {
  
  @Autowired
  ProjectService projectService;
  
  @Autowired
  UserDao userDao;
  
  @Autowired
  ProjectDao projectDao;
  
  @Autowired
  PaymentDao paymentDao;

  @Autowired
  LikeService likeService;
   
  @Autowired
  AlarmService alarmService;
  
  @GetMapping("/mypage")
  public String list(@RequestParam(defaultValue = "1") Integer page,
                     @RequestParam(defaultValue = "10") Integer pageSize,
                     Model m,
                     HttpServletRequest request, Authentication authentication,
                     ProjectDto projectDto, PaymentDto paymentDto) {
    
    UserDto udt = (UserDto) authentication.getPrincipal();
    if (!loginCheck(udt.getUser_id()))
        return "redirect:/user/login?toURL="+request.getRequestURL();
      
      try {
       //session.user_id 와 작성자 비교.
        String user_id = udt.getUser_id();
        m.addAttribute("user_id",user_id);
        
      
      int totalCnt = projectService.getCount();
      m.addAttribute("totalCnt", totalCnt);
      
      PageResolver pageResolver = new PageResolver(totalCnt, page, pageSize);
      if(page < 0 || page > pageResolver.getTotalCnt())
          page = 1;
      if(pageSize < 0 || page > 50)
          pageSize = 10;
      
      Map map = new HashMap();
      map.put("offset", (page-1)*pageSize);
      map.put("pageSize", pageSize);
      map.put("user_id", user_id);
      
      List<LikeDto> list_like_project = likeService.selectByUserId(user_id);
      List<ProjectDto> list_like = new ArrayList<ProjectDto>();

//      System.out.println("list_like"+list_like_project);
      for(int i = 0; i<list_like_project.size(); i++) {
        list_like.add(projectService.selectProjectlikelist(list_like_project.get(i).getPrdt_id()));
      }
//      System.out.println("list_like: "+list_like);
      m.addAttribute("list_like",list_like);   
        
      List<ProjectDto> list = projectService.getPage(map);
      
     
      m.addAttribute("list", list);
//      
//      System.out.println("list : "+ list);
      m.addAttribute("pr", pageResolver);
      
      m.addAttribute("page", page);
      m.addAttribute("pageSize", pageSize);
      
      /*후원 중인 펀딩 부분*/
      //1.유저 번호(FK)를 이용하여 해당 유저번호에 해당하는 펀딩 결제내역을 가져옴
      int user_no = userDao.selectUser(user_id).getUser_no();
      List<PaymentDto> userFunding = paymentDao.userFunding(user_no);
      
      //2.해당 펀딩에 해당하는 정보를 어레이리스트에 담음 (*두 테이블에서 int와 string이 섞여있어 어레이리스트를 이용하였음)
      ArrayList<String> userF = new ArrayList<String>();
      for(int i=0; i<userFunding.size(); i++) {
        userF.add(String.valueOf(userFunding.get(i).getPay_no()));
        ProjectDto pi = projectDao.select(userFunding.get(i).getPrdt_id());
        userF.add(String.valueOf(pi.getPrdt_id()));
        userF.add(pi.getPrdt_thumbnail());
        userF.add(pi.getPrdt_name());
        userF.add(pi.getPrdt_desc());
        userF.add(String.valueOf(pi.getPrdt_comingday()));
        userF.add(String.valueOf(pi.getPrdt_dday()));
        userF.add(String.valueOf(pi.getPrdt_percent()));
      }

      m.addAttribute("userF",userF);
      
//    알림 목록 불러오기
      List<AlarmDto> list_alarm = alarmService.selectPage(map);
//      System.out.println("list_alarm : "+list_alarm);
      m.addAttribute("list_alarm", list_alarm);

      AlarmDto alarmDto = list_alarm.get(0);
      System.out.println("alarmDto : "+alarmDto);
      m.addAttribute("alarmDto", alarmDto);

      } catch (Exception e) {
        e.printStackTrace();
      }
      return "mypage";                         // 로그인 한 상태, 게시판 목록 화면으로 이동
  }
  
//알림 확인 누르면 조회수 1증가. new 뱃지 삭제됨
  @PatchMapping("/alarm/read/{alarm_no}")
  public String read(@PathVariable Integer alarm_no, Model m, Authentication authentication) {

    try {
      UserDto udt = (UserDto) authentication.getPrincipal();
      String user_id = udt.getUser_id();

          if (user_id != null )
            m.addAttribute(user_id);

          AlarmDto alarmDto = alarmService.read(alarm_no);
          m.addAttribute(alarmDto);

      } catch (Exception e) {
          e.printStackTrace();
          return "mypage";
      }
      return "mypage";
  }
  
  /*창작 중인 펀딩 관리 화면*/
  @GetMapping("/mypage/fundingmanage/{prdt_id}")
  public String fundingManage(HttpServletRequest request,RedirectAttributes rattr,Authentication authentication,Model m,
      @PathVariable("prdt_id") Integer prdt_id, PaymentDto paymentDto,ProjectDto projectDto) {

    try {
      //1.펀딩번호에 해당하는 펀딩 정보
      projectDto.setPrdt_id(prdt_id);
      ProjectDto proj_dto = projectDao.select(prdt_id);
      
      UserDto udt = (UserDto) authentication.getPrincipal();
      
      //2.프로젝트 창작자 != 유저 아이디인경우 alert 띄우고 마이페이지로 리턴
      if(!udt.getUser_id().equals(proj_dto.getWriter())) {
        rattr.addFlashAttribute("msg", "no_authorization");
        return "redirect:/mypage";  
      }
      
      //3.프로젝트 창작자 = 유저 아아디인 경우
      else {
      m.addAttribute("proj_dto",proj_dto);
      m.addAttribute("prdt_id",prdt_id);
      
      //4-1 테이블용 map
      Map mapT = new HashMap(); 
      mapT.put("prdt_id", prdt_id);
      List<PaymentDto> list_pay = paymentDao.fundingManageForWeek(mapT);
      m.addAttribute("list_pay",list_pay);

      //4-2 일별 모금액을 map에 저장 => 스크립트를 통해 차트로 보여줌
      Map mapC = new HashMap(); 
      mapC.put("prdt_id", prdt_id);
      List<PaymentDto> list_payC = paymentDao.fundingManageForChart(mapC);
      Map<Integer, Integer> dayNtotal = new HashMap<Integer, Integer>();
      for(int i = 0; i<list_payC.size(); i++) {
        dayNtotal.put(list_payC.get(i).getDay(),list_payC.get(i).getDaySum());
      }
       m.addAttribute("dayNtotal",dayNtotal);
        
             
      return "fundingManage";
      }
    } 
    catch (Exception e) {
     e.printStackTrace();
     return "mypage";
    }
    
   
  }

  private boolean loginCheck(String string) {
    // 1. 세션을 얻어서
    return string != null || string != ""; 
       
  }
  
  
}
