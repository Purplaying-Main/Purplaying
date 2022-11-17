package kr.co.purplaying.controller;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.purplaying.dao.LeaveDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.MemberDto;
import kr.co.purplaying.domain.UserDto;

@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    UserDao userDao;
    
    @Autowired(required=true)
    LeaveDao leaveDao;
  
    //GetMapping////////////////////////////////////////////////////////////////////////////////////
    @GetMapping("iamport")
    public String iamport() {
      return "iamport";
    }
    @GetMapping("/login")
    public String loginForm() {
        return "signIn";
    }
    @GetMapping("mypage")
    public String MyPage() {
      return "mypage";
    }
    
    @GetMapping("leave")
    public String Leave() {
      return "leave";
    }
    @GetMapping("setting")
    public String Setting() {
      return "setting";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    //@RequestMapping(value="signuppost", method = RequestMethod.POST)
    @GetMapping("signup")
    public String SignUppost() {
      return "signup";
    }
    
    @GetMapping("findaccount")
    public String Findaccount() {
      return "findAccount";
    }
    
    //PostMapping////////////////////////////////////////////////////////////////////////////////////
    @PostMapping("/login")
    public String login(String user_id, String user_pwd, boolean rememberId,String toURL ,HttpServletRequest request, HttpServletResponse response) throws Exception {
                
        //1. id와 pw를 확인
        if(!loginCheck(user_id, user_pwd)) {
            //2-1. 일치하지 않으면, loginForm으로 이동     
            String msg = URLEncoder.encode("Id와 Password가 일치하지 않습니다.", "utf-8");
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
        
    @ResponseBody
    @PostMapping("/signup")
    public void signup2(@RequestBody MemberDto memberDto ,HttpServletRequest request) throws Exception {
      System.out.println("user_id"+memberDto.getUser_id());
      if(userDao.signUpUser(memberDto.getUser_id(),memberDto.getUser_pwd(),memberDto.getUser_name(),memberDto.getUser_phone())!=1) {
        System.out.println("실패");
      }
      UserDto user = userDao.searchUser_no(memberDto.getUser_id());
      System.out.println(user.getUser_no());
      
      if(userDao.userCheck(user.getUser_no(),memberDto.isAgree_age(),
                           memberDto.isAgree_terms(),memberDto.isAgree_inform(),
                           memberDto.isAgree_inform_third(),memberDto.isAgree_marketing())!=1) {
        System.out.println("성공");
      }
   }
    
    @PostMapping("/leave")
    public String leave(int leave_category , String leave_reason, String user_pwd, HttpServletRequest request) throws Exception {
      
      HttpSession session = request.getSession();
      UserDto user = userDao.selectUser((String)session.getAttribute("user_id"));
      System.out.println(user);
      
      System.out.println(user.getUser_no());
      System.out.println(leave_category);
      System.out.println(leave_reason);
      
      if(leaveDao.insertLeaveReason(user.getUser_no(), leave_category, leave_reason)!=1) {
        System.out.println("성공");
      }
      if(user.getUser_pwd().equals(user_pwd)) {
        if(userDao.updateUserActivate(user.getUser_no())!=1) {
          System.out.println("탈퇴성공");
        }
      }
      return "redirect:/";
    }
    
    //아이디 중복체크///////////////////////////////////////////////////////////////////////
    @ResponseBody       
    @PostMapping("/chkuserid")
    public UserDto chkuserid(@RequestBody UserDto userDto) {
      UserDto user;
      try {
        user = userDao.selectUser(userDto.getUser_id());
        user.setUser_id("");
        return user;
      } catch (Exception e) {
        return userDto;
      }
    }
    
 
    //일반 메서드////////////////////////////////////////////////////////////////////////////////////
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
    //////////////////////////////////////////////////////////////////////////////////////
}
