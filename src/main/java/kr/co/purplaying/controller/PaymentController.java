package kr.co.purplaying.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.dao.RewardDao;
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
  
  @Autowired
  RewardDao rewardDao;
  

  @RequestMapping("/payment/{prdt_id}")
  @GetMapping("/payment/{prdt_id}")
  //@PostMapping("/payment/{prdt_id}")
  public String payment(@PathVariable("prdt_id") Integer prdt_id, HttpServletRequest request, HttpSession session,
      Model m, RewardDto rewardDto) {
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
  
       String[] arr = request.getParameterValues("no");
       String[] arr2 = request.getParameterValues("reward_cnt");
       
       int[] no_arr = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();
       String[] nm_arr = request.getParameterValues("nm");
       int[] cnt_arr = Arrays.stream(arr2).mapToInt(Integer::parseInt).toArray();
       String[] pr_arr = request.getParameterValues("pr");
       
       ArrayList<String> reward = new ArrayList<String>();
       for(int i=0;i<no_arr.length;i++) {
         reward.add(String.valueOf(no_arr[i]));
         reward.add(nm_arr[i]);
         reward.add(String.valueOf(cnt_arr[i]));
         reward.add(pr_arr[i]);
       }
       System.out.println(reward);
       
       m.addAttribute("reward", reward);

      return "payment";
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/user/login";
    }
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
  
  /* 구매한 펀딩 정보를 가져오는 맵핑*/
  @RequestMapping("/paymentCompleted/{pay_no}")
  @GetMapping("/paymentCompleted/{pay_no}")
  public String paymentCompleted(HttpServletRequest request, @PathVariable("pay_no") Integer pay_no, Model m,Integer prdt_id,HttpSession session) {
    try {
      String user_id = (String)session.getAttribute("user_id");
      UserDto userDto = settingService.setUser(user_id);
      m.addAttribute("userDto",userDto);
      
      String path = request.getServletPath();
      String[] num = path.toString().split("paymentCompleted/");
      //pay_no을 넣어 정보를 불러옴
      pay_no = Integer.parseInt(num[1]);
      System.out.println(pay_no);
      PaymentDto paymentDto = paymentService.setPay_no(pay_no);
      System.out.println(paymentDto);
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
