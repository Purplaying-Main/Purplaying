package kr.co.purplaying.controller;


import java.util.ArrayList;
import java.util.Arrays;
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
  
  
  @GetMapping("/payment/{prdt_id}")
  public String payment(@PathVariable("prdt_id") Integer prdt_id, HttpServletRequest request, HttpSession session,
      Model m, RewardDto rewardDto) {
    // 로그인 하지 않는 경우 펀딩하기 클릭시 로그인 요구
    if (!loginCheck(request))
      return "redirect:/user/login?toURL=/payment/{prdt_id}";

    try {
      String user_id = (String) session.getAttribute("user_id");
      UserDto userDto = settingService.setUser(user_id);
      m.addAttribute(userDto);
      
      ProjectDto projectDto = projectService.readPayment(prdt_id);
      m.addAttribute("projectDto", projectDto);
  
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
       
       m.addAttribute("reward", reward);

      return "payment";
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/user/login";
    }
  }


  @PostMapping("/paymentCompleted/{prdt_id}")
  public String paymentCompleted(@PathVariable Integer prdt_id,
     HttpSession session, Model m, String rewardid, String rewardcnt, String pay_total, PaymentDto paymentDto) {
    try {

        String[] rd_id = rewardid.split(",");
        String[] rd_cnt = rewardcnt.split(",");
        
        //유저정보
        String user_id = (String)session.getAttribute("user_id");
        UserDto userDto = settingService.setUser(user_id);
        m.addAttribute("userDto",userDto);
        
        //펀딩 정보
        ProjectDto projectDto = projectService.readPayment(prdt_id);
        paymentDto.setUser_no(userDto.getUser_no());
        paymentDto.setPay_total(Integer.parseInt(pay_total));
        m.addAttribute("pay_total",Integer.parseInt(pay_total));
        
        //펀딩 후원자수, 후원금액 증가
        projectDao.plusBuyerCnt(prdt_id);  
        projectDao.plusBuyerPrice(prdt_id,paymentDto.getPay_total(),projectDto.getPrdt_currenttotal());
        m.addAttribute("projectDto",projectDto); 
        
        paymentDto.setReward_id(rd_id);
        paymentDto.setReward_user_cnt(rd_cnt);

        //결제 insert
        paymentService.write(paymentDto);

        //결제 고유화
        Map map_p = new HashMap();
        map_p.put("user_no", userDto.getUser_no());
        map_p.put("prdt_id", prdt_id);
        map_p.put("pay_total", Integer.parseInt(pay_total));
        map_p.put("reward_id", rd_id);
        map_p.put("delivery_postcode", paymentDto.getDelivery_postcode());
        
        //결제정보 가져오기
        List<PaymentDto> pay_user = paymentDao.paymentCompleted(map_p);
        pay_user.get(0).setReward_id(rd_id);
        pay_user.get(0).setReward_user_cnt(rd_cnt);

        m.addAttribute("pay_user",pay_user);
        
        //유저선택리워드
        int[] reid = new int[pay_user.get(0).getReward_id().length];
        for(int i = 0; i<pay_user.get(0).getReward_id().length; i++) {
          reid[i] = Integer.parseInt(pay_user.get(0).getReward_id()[i]);
        }
       List<RewardDto> reward_user = rewardDao.selectReward(prdt_id);
       ArrayList<String> reward_pay = new ArrayList<>();
       for(int i = 0; i < reid.length; i++) {
         for(int j = 0; j<reward_user.size(); j++) {
           if(reid[i] == reward_user.get(j).getRow_number()) {
             reward_pay.add(String.valueOf(reward_user.get(j).getRow_number()));
             reward_pay.add(reward_user.get(j).getReward_name());
             reward_pay.add(String.valueOf(pay_user.get(0).getReward_user_cnt()[i]));
             reward_pay.add(String.valueOf(reward_user.get(j).getReward_price()));
           }
           else {
             continue;
           }
         }
       }
       
       m.addAttribute("reward_pay",reward_pay);
       
        return "paymentCompleted";

    } catch (Exception e) {
      e.printStackTrace();
      return "/";
    }
    
    
  }
 
  
  /* 구매한 펀딩 정보를 가져오는 맵핑*/
  @GetMapping("/paymentCompleted/{pay_no}")
  public String paymentCompleted(HttpServletRequest request, @PathVariable("pay_no") Integer pay_no, Model m,Integer prdt_id,HttpSession session) {
    try {
      //유저정보
      String user_id = (String)session.getAttribute("user_id");
      UserDto userDto = settingService.setUser(user_id);
      m.addAttribute("userDto",userDto);
      
      String path = request.getServletPath();
      String[] num = path.toString().split("paymentCompleted/");
      
      //결제정보
      pay_no = Integer.parseInt(num[1]);
      List<PaymentDto> paymentDto = paymentDao.paynoinfo(pay_no);
      m.addAttribute("paymentDto",paymentDto);
      
      //펀딩정보
      prdt_id = paymentDto.get(0).getPrdt_id();
      ProjectDto projectDto = projectService.readPayment(prdt_id);
      m.addAttribute("projectDto",projectDto);
      
      Map pn = new HashMap();
      pn.put("pay_no", Integer.parseInt(num[1]));
      
      List<PaymentDto> paymentDto_r = paymentDao.paynoreinfo(pn);
      System.out.println(paymentDto_r);

      String[] rd_id = paymentDto_r.get(0).getReward_id_s().split(",");
      String[] rd_cnt = paymentDto_r.get(0).getReward_user_cnt_s().split(",");
      
      //유저선택리워드
      System.out.println(rd_id);
      System.out.println(rd_cnt);
      
      paymentDto_r.get(0).getReward_id_s().length();
      System.out.println();
      
      List<RewardDto> reward_user = rewardDao.selectReward(prdt_id);
      ArrayList<String> reward_pay = new ArrayList<>();
      for(int i = 0; i < rd_id.length; i++) {
        for(int j = 0; j<reward_user.size(); j++) {
          if(Integer.parseInt(rd_id[i]) == reward_user.get(j).getRow_number()) {
            reward_pay.add(String.valueOf(reward_user.get(j).getRow_number()));
            reward_pay.add(reward_user.get(j).getReward_name());
            reward_pay.add(rd_cnt[i]);
            reward_pay.add(String.valueOf(reward_user.get(j).getReward_price()));
          }
          else {
            continue;
          }
        }
      }
      
      m.addAttribute("reward_pay",reward_pay);
     
      return "paymentCompletedView";
      
    } catch (Exception e) {
      e.printStackTrace();
      return "mypage";
    }
    
  }
  
  private boolean loginCheck(HttpServletRequest request) {
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false); // false는 session이 없어도 새로 생성하지 않음. 반환값 null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id") != null;
  }
}
