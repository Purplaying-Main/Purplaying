                               package kr.co.purplaying.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.purplaying.dao.LeaveDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.MemberDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.SettingService;
import kr.co.purplaying.service.UserService;

@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    UserDao userDao;
    
    @Autowired
    UserService userService;
    
    @Autowired
    SettingService settingService;

    @Autowired(required=true)
    LeaveDao leaveDao;
    
    @Autowired
    private JavaMailSender mailSender;
  
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
    
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/";
//    }
    
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
    
    @PostMapping("/sendMail")
    @ResponseBody
    public void sendMailTest(@RequestBody UserDto userDto) throws Exception{ 
        System.out.println(userDto);
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        userDto.setUser_pwd(String.valueOf(checkNum));
        System.out.println(userDto);
        if(userDao.updateUserPwd(userDto)!=1)
        {
          System.out.println("비밀번호 변경오류");
          return ;
        }
        
        String subject = "퍼플레잉 비밀번호찾기";
        String content = "임시 비밀번호 : " + checkNum ;
        String from = "purplayingcorp@gmail.com";
        String to = userDto.getUser_id();
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText("<h2>"+content+ "</h2>", true);
            // true는 html을 사용하겠다는 의미입니다.
            
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
    }
    
    @PostMapping("/findaccount")
    @ResponseBody
    public String findAccount(@RequestBody UserDto userDto){
      System.out.println("phone : "+userDto.getUser_phone()+"name:"+userDto.getUser_name());
      try {
        int count =userDao.findUserData(userDto);
        System.out.println(count);
        if(count!=0) {
          return userDao.findUserId(userDto);
        }
        else {
          return null;
        }
      } catch (Exception e) {
        e.printStackTrace();
        return null;
      }
      
    }
    /*
    @PostMapping("/login")
    public String login(String user_id, String user_pwd, boolean rememberId,String toURL
                        ,HttpServletRequest request, HttpServletResponse response) throws Exception {
                
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
        
        UserDto userDto = userDao.selectUser(user_id);
        
        System.out.println("포인트 : "+userDto);
        
        
        //3. 세션 객체 얻어오기.
        HttpSession session = request.getSession(true);
        //세션 객체에 id를 저장
        
//        ArrayList<String> list = null;
//        list.add(user_id);
//        list.add(String.valueOf(userDto.getUser_role()));
        
        session.setAttribute("user_id", user_id);
        session.setAttribute("user_role", userDto.getUser_role());
        session.setAttribute("UserDto", userDto);
        System.out.println(userDto);
               
        System.out.println("user_role :"+session.getAttribute("user_role"));
        System.out.println("user_id :"+session.getAttribute("user_id"));
        
        //4. toUrl이 있을시에는 toUrl로 이동
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
                
        //일치하면 로그인 후 화면 (홈화면)으로 이동      
        return "redirect:"+toURL;
        

    }*/
        
    @ResponseBody
    @PostMapping("/signup")
    public void signup2(@RequestBody MemberDto memberDto, Model m ,HttpServletRequest request) throws Exception {
      System.out.println(memberDto);
      System.out.println("user_id"+memberDto.getUser_id());
      if(userService.signUpUser(memberDto.getUser_id(),memberDto.getUser_pwd(),memberDto.getUser_name(),memberDto.getUser_nickname(),memberDto.getUser_phone())!=1) {
        System.out.println("실패");
      }
      UserDto user = userDao.searchUser_no(memberDto.getUser_id());
      System.out.println(user.getUser_no());
      
      if(userDao.userCheck(user.getUser_no(),memberDto.isAgree_age(),
                           memberDto.isAgree_terms(),memberDto.isAgree_inform(),
                           memberDto.isAgree_inform_third(),memberDto.isAgree_marketing())!=1) {
        System.out.println("성공");
      }
      System.out.println("marketing"+memberDto.isAgree_marketing());
      if(settingService.insertcheckbox(user.getUser_no(),memberDto.isAgree_marketing())!=1) {
        System.out.println("마케팅 insert 실패");
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
      session.invalidate();
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
      
      System.out.println(userDto);
      if(userDto==null) {
          System.out.println("userDto==null");
          return false;
      }
      
      return userDto.getUser_pwd().equals(user_pwd);
  }
    
    
    private boolean PwdCheck(String user_pwd, String chk_user_pwd) {
     
      return user_pwd.equals(chk_user_pwd);
  }
  
}
