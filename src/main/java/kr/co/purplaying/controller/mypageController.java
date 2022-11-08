package kr.co.purplaying.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mypageController {

  @RequestMapping("/mypage")
  public String mypage(HttpServletRequest request) {
    
    if(!loginCheck(request)) {
      return "redirect:/login/login?toURL=" + request.getRequestURL();
    }
    
    try {
      
    } catch(Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  private boolean loginCheck(HttpServletRequest request) {
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false);        // false는 session이 없어도 새로 생성하지 않음. 반환값  null
    
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("id") != null;
  }
}
