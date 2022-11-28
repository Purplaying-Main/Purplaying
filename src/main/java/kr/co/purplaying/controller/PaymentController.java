package kr.co.purplaying.controller;

import java.util.Date;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.RewardDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.PaymentService;
import kr.co.purplaying.service.ProjectService;
import kr.co.purplaying.service.RewardService;
import kr.co.purplaying.service.SettingService;

@Controller
public class PaymentController {
  @Autowired
  ProjectService projectService;

  @Autowired
  RewardService rewardService;

  @Autowired
  SettingService settingService;

  @Autowired
  PaymentDao paymentDao;
  
  @Autowired
  PaymentService paymentService;
  
  @Autowired
  ProjectDao projectDao;
  @Autowired
  UserDao userDao;
  
  @RequestMapping("/payment/{prdt_id}")
  @GetMapping("/payment/{prdt_id}")
  public String payment(@PathVariable("prdt_id") Integer prdt_id, HttpServletRequest request, HttpSession session,
      Model m) {
    // 로그인 하지 않는 경우 펀딩하기 클릭시 로그인 요구
    if (!loginCheck(request))
      return "redirect:/user/login?toURL=/payment/{prdt_id}";

    try {
      String user_id = (String) session.getAttribute("user_id");
      UserDto userDto = settingService.setUser(user_id);
      System.out.println(userDto.toString());
      m.addAttribute(userDto);

      ProjectDto projectDto = projectService.readPayment(prdt_id);
      m.addAttribute("projectDto", projectDto);
      System.out.println(projectDto);


      RewardDto rewardDto = rewardService.readPayment(prdt_id);
      m.addAttribute("rewardDto", rewardDto);
      System.out.println(rewardDto);

    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/user/login";
    }
    return "payment";
  }


  @PostMapping("/paymentCompleted/{prdt_id}")
  public String paymentCompleted(Integer pay_no, Date pay_time, PaymentDto paymentDto, String delivery_reciever,String delivery_phone,int delivery_postcode,String delivery_address,String delivery_addressdetail,String delivery_memo,@PathVariable("prdt_id") Integer prdt_id,
     HttpSession session, Model m) {
    try {
      
        String user_id = (String)session.getAttribute("user_id");
        UserDto userDto = settingService.setUser(user_id);
        m.addAttribute("userDto",userDto);
        
        ProjectDto projectDto = projectService.readPayment(prdt_id);
        m.addAttribute("projectDto",projectDto);
        System.out.println(projectDto);      
        
        RewardDto rewardDto = rewardService.readPayment(prdt_id);
        m.addAttribute("rewardDto",rewardDto);
        System.out.println(rewardDto);
        
        paymentDto.setUser_no(userDto.getUser_no());
        
        System.out.println(paymentDto);
        m.addAttribute("delivery_reciever",delivery_reciever);
        m.addAttribute("delivery_reciever",delivery_reciever);
        m.addAttribute("delivery_phone",delivery_phone);
        m.addAttribute("delivery_postcode",delivery_postcode);
        m.addAttribute("delivery_address",delivery_address);
        m.addAttribute("delivery_addressdetail", delivery_addressdetail);
        m.addAttribute("delivery_memo",delivery_memo);
      
        paymentService.wrtie(paymentDto);
        projectDao.plusBuyerCnt(prdt_id);  

        Map map = new HashMap();
        map.put("user_no", userDto.getUser_no());
        map.put("prdt_id", prdt_id);
        List<PaymentDto> pay = paymentDao.paymentCompleted(map);
        m.addAttribute("pay",pay);
      
        return "paymentCompleted";

    } catch (Exception e) {
      e.printStackTrace();
      return "/";
    }
    

    
  }
  
  
  private boolean loginCheck(HttpServletRequest request) {
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false); // false는 session이 없어도 새로 생성하지 않음. 반환값 null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id") != null;
  }
  
  @RequestMapping("/paymentCompleted/{pay_no}")
  @GetMapping("/paymentCompleted/{pay_no}")
  public String paymentCompleted(HttpServletRequest request, @PathVariable("pay_no") Integer pay_no, Model m,Integer prdt_id,HttpSession session, PaymentDto paymentDto) {
    try {
      String user_id = (String)session.getAttribute("user_id");
      UserDto userDto = settingService.setUser(user_id);
      m.addAttribute("userDto",userDto);
      String path = request.getServletPath();
      String[] num = path.toString().split("paymentCompleted/");
      pay_no = Integer.parseInt(num[1]);
      paymentDto = paymentDao.getPaymentInfo(pay_no);
      m.addAttribute("paymentDto",paymentDto);
      
      prdt_id = paymentDao.getPaymentInfo(pay_no).getPrdt_id();
      ProjectDto projectDto = projectService.readPayment(prdt_id);
      m.addAttribute("projectDto",projectDto);
          
      
      RewardDto rewardDto = rewardService.readPayment(prdt_id);
      m.addAttribute("rewardDto",rewardDto);
      System.out.println(userDto);
      System.out.println(paymentDto);
      System.out.println(projectDto);  
      System.out.println(rewardDto);
      
      return "paymentCompletedView";
      
    } catch (Exception e) {
      e.printStackTrace();
      return "mypage";
    }
    
  }
}
