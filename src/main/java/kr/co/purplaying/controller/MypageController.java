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
import org.springframework.web.bind.annotation.ResponseBody;
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
       //session.user_id ??? ????????? ??????.
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
        
      List<ProjectDto> list = projectDao.getMyFunding(user_id);
      
     
      m.addAttribute("list", list);
//      
//      System.out.println("list : "+ list);
      m.addAttribute("pr", pageResolver);
      
      m.addAttribute("page", page);
      m.addAttribute("pageSize", pageSize);
      
      /*?????? ?????? ?????? ??????*/
      //1.?????? ??????(FK)??? ???????????? ?????? ??????????????? ???????????? ?????? ??????????????? ?????????
      int user_no = userDao.selectUser(user_id).getUser_no();
      List<PaymentDto> userFunding = paymentDao.userFunding(user_no);
      
      //2.?????? ????????? ???????????? ????????? ????????????????????? ?????? (*??? ??????????????? int??? string??? ???????????? ????????????????????? ???????????????)
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
      
//    ?????? ?????? ????????????
      List<AlarmDto> list_alarm = alarmService.selectPage(map);
//      System.out.println("list_alarm : "+list_alarm);
      m.addAttribute("list_alarm", list_alarm);
        
        // ?????? ?????? ?????? ???
        if (list_alarm.size() != 0) {
          AlarmDto alarmDto = list_alarm.get(0);
          System.out.println("alarmDto : "+alarmDto);
          m.addAttribute("alarmDto", alarmDto);
        }
      

      } catch (Exception e) {
        e.printStackTrace();
      }
      return "mypage";                         // ????????? ??? ??????, ????????? ?????? ???????????? ??????
  }
  
//?????? ?????? ????????? ????????? 1??????. new ?????? ?????????
  @PatchMapping("/alarm/read/{alarm_no}")
  @ResponseBody
  public String read(@PathVariable Integer alarm_no, Model m, Authentication authentication) {

    try {
        UserDto udt = (UserDto) authentication.getPrincipal();
        String user_id = udt.getUser_id();
        System.out.println("user_id: "+user_id);
        if (user_id != null ) {
          m.addAttribute(user_id);
        }
        
        AlarmDto alarmDto = alarmService.read(alarm_no);
        m.addAttribute(alarmDto);
        System.out.println("alarmDto: "+alarmDto);

      } catch (Exception e) {
          e.printStackTrace();
          return "mypage";
      }
      return "mypage";
  }
  
  /*?????? ?????? ?????? ?????? ??????*/
  @GetMapping("/mypage/fundingmanage/{prdt_id}")
  public String fundingManage(HttpServletRequest request,RedirectAttributes rattr,Authentication authentication,Model m,
      @PathVariable("prdt_id") Integer prdt_id, PaymentDto paymentDto,ProjectDto projectDto) {

    try {
      //1.??????????????? ???????????? ?????? ??????
      projectDto.setPrdt_id(prdt_id);
      ProjectDto proj_dto = projectDao.select(prdt_id);
      
      UserDto udt = (UserDto) authentication.getPrincipal();
      
      //2.???????????? ????????? != ?????? ?????????????????? alert ????????? ?????????????????? ??????
      if(!udt.getUser_id().equals(proj_dto.getWriter())) {
        rattr.addFlashAttribute("msg", "no_authorization");
        return "redirect:/mypage";  
      }
      
      //3.???????????? ????????? = ?????? ???????????? ??????
      else {
      m.addAttribute("proj_dto",proj_dto);
      m.addAttribute("prdt_id",prdt_id);
      
      //4-1 ???????????? map
      Map mapT = new HashMap(); 
      mapT.put("prdt_id", prdt_id);
      List<PaymentDto> list_pay = paymentDao.fundingManageForWeek(mapT);
      m.addAttribute("list_pay",list_pay);

      //4-2 ?????? ???????????? map??? ?????? => ??????????????? ?????? ????????? ?????????
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
    // 1. ????????? ?????????
    return string != null || string != ""; 
       
  }
  
  
}
