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
import kr.co.purplaying.domain.User;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    UserDao userDao;
    
    private Object toURL;

    @GetMapping("/login")
    public String loginForm() {
        return "signIn";
    }
    
    @PostMapping("/login")
    public String login(String id, String pwd, boolean rememberId, String toURL,
                    HttpServletRequest request, HttpServletResponse response) throws Exception {
        
//      System.out.println("id="+id);
//      System.out.println("pwd="+pwd);
//      System.out.println("rememberId="+rememberId);
        
        //1. id와 pw를 확인
        if(!loginCheck(id, pwd)) {
            //2-1. 일치하지 않으면, loginForm으로 이동     
            String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");
            return "redirect:/login?msg="+msg;
        }   
        
        //2-2. 일치하면 로그인 후 화면 (홈화면)으로 이동
        
        //2-2-1. 쿠키를 생성
        //2-2-2. 응답헤더에 저장
        //2-3-1. 쿠키를 삭제
        //2-3-2. 응답헤더에 저장
        if (rememberId) {
            Cookie cookie = new Cookie("id", id);
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        
        //3. 세션
        //   객체 얻어오기
        HttpSession session = request.getSession();
        // 세션 객체에 id를 저장
        session.setAttribute("id", id);
        
        //4.뷰이동
        toURL = toURL == null || toURL.equals("") ? "/" : toURL; 
        
        return "redirect:" + toURL;
    }

    private boolean loginCheck(String id, String pwd) {

        User user = userDao.selectUser(id);
        if(user == null) return false;
        return user.getPwd().equals(pwd);
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 세션을 종료
        session.invalidate();
        // 홈으로 이동
        return "redirect:/" ;
    }
    
}












