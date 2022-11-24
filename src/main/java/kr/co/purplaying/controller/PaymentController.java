package kr.co.purplaying.controller;

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

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.RewardDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.ProjectService;
import kr.co.purplaying.service.RewardService;
import kr.co.purplaying.service.UserService;

@Controller
public class PaymentController {
  @Autowired
  ProjectService projectService;
  
  @Autowired
  RewardService rewardService;
  

  
  @RequestMapping("/payment/{prdt_id}")
  @GetMapping("/payment/{prdt_id}")
  public String payment(@PathVariable("prdt_id") Integer prdt_id,HttpServletRequest request,HttpSession session, Model m) {
    //로그인 하지 않는 경우 펀딩하기 클릭시 로그인 요구
    if(!loginCheck(request))
      return "redirect:/user/login?toURL=/payment/{prdt_id}";
    
    try {
      String user_id = (String)session.getAttribute("user_id");
      m.addAttribute("user_id",user_id);
      System.out.println(user_id);
      
      ProjectDto projectDto = projectService.readPayment(prdt_id);
      m.addAttribute("projectDto",projectDto);
      System.out.println(projectDto);
      RewardDto rewardDto = rewardService.readPayment(prdt_id);
      m.addAttribute("rewardDto",rewardDto);
      System.out.println(rewardDto);
 
      
      
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/user/login";
    }
    return "payment";
  }

  private boolean loginCheck(HttpServletRequest request) {
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false);        // false는 session이 없어도 새로 생성하지 않음. 반환값  null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id") != null;
  }
 }
