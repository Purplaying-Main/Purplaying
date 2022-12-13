package kr.co.purplaying.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.LikeDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
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
  
  @GetMapping("/mypage")
  public String list(@RequestParam(defaultValue = "1") Integer page,
                     @RequestParam(defaultValue = "10") Integer pageSize,
                     Model m,
                     HttpServletRequest request, HttpSession session,
                     ProjectDto projectDto, PaymentDto paymentDto) {
    
      if(!loginCheck(request))
        return "redirect:/user/login?toURL="+request.getRequestURL();
      
      try {
       //session.user_id 와 작성자 비교.
        String user_id = (String)session.getAttribute("user_id");
        m.addAttribute(user_id);
        
      
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
      
      //후원한 펀딩 보여주는 부분
      int user_no = userDao.getPaymentUserInfo(user_id).getUser_no();
      System.out.println("user_no : "+user_no);
      List<ProjectDto> myfunding = projectDao.myfunding(userDao.getPaymentUserInfo(user_id).getUser_no());
      System.out.println("myfunding : "+myfunding);
      myfunding.get(0).setUser_no(user_no);
      int prdt_id = myfunding.get(0).getPrdt_id();
      System.out.println(paymentDao.pay_no(user_no, prdt_id));
      //myfunding.get(0).setPay_no();
      List<PaymentDto> pay_no = paymentDao.pay_no(user_no, prdt_id);
      myfunding.get(0).setPay_no(pay_no.get(0).getPay_no());
      System.out.println(myfunding);
      m.addAttribute("myfunding", myfunding);
      
      
      } catch (Exception e) {
      e.printStackTrace();
      }
      return "mypage";                         // 로그인 한 상태, 게시판 목록 화면으로 이동
  }
  
 //펀딩관리페이지 맵핑
  @GetMapping("/mypage/fundingmanage/{prdt_id}")
  public String fundingManage(HttpServletRequest request,HttpSession session,Model m,@PathVariable("prdt_id") Integer prdt_id, PaymentDto paymentDto) {
    try {
      System.out.println(prdt_id);
      m.addAttribute("prdt_id",prdt_id);
      Map map = new HashMap(); 
      map.put("prdt_id", prdt_id);
      List<PaymentDto> list_pay = paymentDao.fundingManage(map);
      System.out.println(list_pay);
      m.addAttribute("list_pay",list_pay);
      return "fundingManage";
      
    } catch (Exception e) {
     e.printStackTrace();
     return "mypage";
    }
    
   
  }

  private boolean loginCheck(HttpServletRequest request) {
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false);        // false는 session이 없어도 새로 생성하지 않음. 반환값  null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id") != null;
  }
  
  
}
