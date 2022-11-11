package kr.co.purplaying.controller;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.UserDto;

@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    UserDao userDao;
  
    @GetMapping("/login")
    public String loginForm() {
        return "signIn";
    }
    
    @PostMapping("/login")
    public String login(String user_id, String user_pwd, boolean rememberId,String toURL ,HttpServletRequest request, HttpServletResponse response) throws Exception {
                
        //1. id와 pw를 확인
        if(!loginCheck(user_id, user_pwd)) {
            //2-1. 일치하지 않으면, loginForm으로 이동     
            String msg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");
            return "redirect:/user/login?msg="+msg;
        }
        
        if(rememberId == true) {
            //2-2-1. 쿠키를 생성
            //2-2-2. 응답 헤더에 저장
            makeCookie(response, user_id);
        }
        else {
            //2-3-1. 쿠키를 삭제
            //2-3-2. 응답 헤더에 저장
            deleteCookie(response, user_id);
        }
        
        //3. 세션 객체 얻어오기.
        HttpSession session =  request.getSession();
        //세션 객체에 id를 저장
        session.setAttribute("user_id", user_id);
        System.out.println(session.getAttribute(toURL));
        
        //4. toUrl이 있을시에는 toUrl로 이동
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
                
        //일치하면 로그인 후 화면 (홈화면)으로 이동      
        return "redirect:"+toURL;
        
        
    }
    
    public static void makeCookie(HttpServletResponse response, String user_id) {
        Cookie cookieid = new Cookie("user_id", user_id); 
        response.addCookie(cookieid);       
    }
    public static void deleteCookie(HttpServletResponse response, String user_id) {
        Cookie cookieid = new Cookie("user_id", user_id); 
        cookieid.setMaxAge(0);
        response.addCookie(cookieid);   
    }
    
  
    private boolean loginCheck(String user_id, String user_pwd) throws Exception {
      // TODO Auto-generated method stub
      UserDto userDto = userDao.selectUser(user_id);
      if(userDto==null) {
          System.out.println("userDto==null");
          return false;
      }
      
      return userDto.getUser_pwd().equals(user_pwd);
  }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    //
    
    
    @GetMapping("signup")
    public String SignUp() {
      return "signup";
    }
    @PostMapping("/signup")
    public String signup(String user_id, String user_pwd, String chk_user_pwd, String user_name,String user_phone,String toURL ,HttpServletRequest request) throws Exception {
      //1. id와 pw를 확인
      if(!PwdCheck(user_pwd, chk_user_pwd)) {
          //2-1. 일치하지 않으면, loginForm으로 이동     
          String msg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");
          return "redirect:/user?msg="+msg;
      }
      HttpSession session =  request.getSession();
      
      
      //4. toUrl이 있을시에는 toUrl로 이동
      toURL = toURL==null || toURL.equals("") ? "/" : toURL;
              
      //일치하면 로그인 후 화면 (홈화면)으로 이동      
      return "redirect:"+toURL;
    }
    
    private boolean PwdCheck(String user_pwd, String chk_user_pwd) {
     
      return user_pwd.equals(chk_user_pwd);
  }
  
}
