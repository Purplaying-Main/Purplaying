package kr.co.purplaying.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.dao.RewardDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.AddressDto;
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
  UserDao userDao;
  @Autowired
  SettingService settingService;
  
  @Autowired
  ProjectDao projectDao;
  @Autowired
  ProjectService projectService;

  @Autowired
  RewardDao rewardDao;
  @Autowired
  RewardService rewardService;

  @Autowired
  PaymentDao paymentDao;
  @Autowired
  PaymentService paymentService;
  
  @Autowired
  SettingService settingservice;
  
  /*결제화면*/
  @GetMapping("/payment/{prdt_id}")
  public String payment(@PathVariable("prdt_id") Integer prdt_id, HttpServletRequest request, HttpSession session,
      Model m, RewardDto rewardDto) {
    
    // 1. 로그인 하지 않는 경우 펀딩하기 클릭시 로그인 요구
    if (!loginCheck(request))
      return "redirect:/user/login?toURL=/project/{prdt_id}";

    // 2. 로그인 성공시 펀딩결제 진행
    try {
      
      //3.해당 유저 정보
      String user_id = (String) session.getAttribute("user_id");
      UserDto userDto = settingService.setUser(user_id);
      m.addAttribute(userDto);
      
      //4.해당 펀딩 정보
      ProjectDto projectDto = projectService.readPayment(prdt_id);
      m.addAttribute("projectDto", projectDto);
  
      //5.유저가 펀딩 페이지에서 선택한 리워드를 배열에 담고(JSP) 이를 다시 짝을 맞춰 배열로 저장(JAVA)
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

  /*결제완료화면*/
  @PostMapping("/paymentCompleted/{prdt_id}") //아직 결제가 이뤄지지 않았기 때문에 상품 번호로 맵핑
  public String paymentCompleted(@PathVariable Integer prdt_id,
     HttpSession session, Model m, String rewardid, String rewardcnt, String pay_total, PaymentDto paymentDto) {
    
    try {

        //1.해당 유저 정보
        String user_id = (String)session.getAttribute("user_id");
        UserDto userDto = settingService.setUser(user_id);
        m.addAttribute("userDto",userDto);
        
        //2.해당 펀딩 정보
        ProjectDto projectDto = projectService.readPayment(prdt_id);
        paymentDto.setUser_no(userDto.getUser_no());
        paymentDto.setPay_total(Integer.parseInt(pay_total));
        m.addAttribute("pay_total",Integer.parseInt(pay_total));
        
        //3.결제화면에서 선택된 리워드를 배열형태로 받아와 하나씩 쪼갬
        String[] rd_id = rewardid.split(",");
        String[] rd_cnt = rewardcnt.split(",");
        paymentDto.setReward_id(rd_id);
        paymentDto.setReward_user_cnt(rd_cnt);

        //4.펀딩 후원자수, 후원금액 증가 & 리워드 수량, 유저 포인트 감소
        
        List<RewardDto> rewardInfo = rewardDao.selectReward(prdt_id);
        
        for (int i = 0; i < rd_id.length; i++) {
          for (int j = 0; j < rewardInfo.size(); j++) {
            if (Integer.parseInt(rd_id[i]) == rewardInfo.get(j).getRow_number()) {
              rewardDao.calRewardStock(prdt_id, rewardInfo.get(j).getReward_id(), rewardInfo.get(j).getReward_stock(), Integer.parseInt(rd_cnt[i]));
            }
            else {
              continue;
            }
          }
          
        }
        
        projectDao.plusBuyerCnt(prdt_id);  
        projectDao.plusBuyerPrice(prdt_id,paymentDto.getPay_total(),projectDto.getPrdt_currenttotal());
        m.addAttribute("projectDto",projectDto);
        userDao.updatePoint(userDto.getUser_no(), userDto.getUser_point()-Integer.parseInt(pay_total));
        
        //5.결제정보 insert (이때 리워드는 DB에 배열로 저장)
        paymentService.write(paymentDto);
        
        //6.완료한 결제내역을 보여주기 위해 고유 조건(유저번호,펀딩번호,총금액,리워드번호,우편번호)을 넣어줌
        Map map_p = new HashMap();
        map_p.put("user_no", userDto.getUser_no());
        map_p.put("prdt_id", prdt_id);
        map_p.put("pay_total", Integer.parseInt(pay_total));
        map_p.put("reward_id", rd_id);
        map_p.put("delivery_postcode", paymentDto.getDelivery_postcode());
        
        //7.고유 조건과 일치하는 결제,유저,펀딩정보 가져오기
        List<PaymentDto> pay_user = paymentDao.paymentCompleted(map_p);
        
        //8.유저가 선택한 리워드의 정보를 담아줌
        pay_user.get(0).setReward_id(rd_id);
        pay_user.get(0).setReward_user_cnt(rd_cnt);
        m.addAttribute("pay_user",pay_user);
        
        //9.유저가 선택한 리워드와 해당 펀딩의 리워드 목록 중 id가 일치하는 리워드를 찾아 어레이리스트로 저장
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
             continue; //리워드 id가 일치하지 않는 경우 생략하고 계속 진행
           }
         }
       }
       
       m.addAttribute("reward_pay",reward_pay);

        return "paymentCompleted";

    } 
    catch (Exception e) {
        e.printStackTrace();
     return "/{prdt_id}";
    }
    
    
  }
 
  
  /*마이페이지-결제내역상세보기 클릭시 화면*/
  @GetMapping("/paymentCompleted/{pay_no}") //결제가 이뤄졌으므로 결제 번호로 맵핑
  public String paymentCompleted(@PathVariable("pay_no") Integer pay_no, HttpServletRequest request, HttpSession session, Model m,Integer prdt_id) {
    try {
      //1.해당 유저 정보
      String user_id = (String)session.getAttribute("user_id");
      UserDto userDto = settingService.setUser(user_id);
      m.addAttribute("userDto",userDto);
      
      //2.url로 넘어온 결제 번호를 자름
      String path = request.getServletPath();
      String[] num = path.toString().split("paymentCompleted/");
      
      //3.결제 번호에 따른 결제 정보 가져옴
      pay_no = Integer.parseInt(num[1]);
      List<PaymentDto> paymentDto = paymentDao.paynoinfo(pay_no);
      m.addAttribute("paymentDto",paymentDto);
      
      //4.상품번호(FK)를 통해 해당 펀딩 정보를 가져옴
      prdt_id = paymentDto.get(0).getPrdt_id();
      ProjectDto projectDto = projectService.readPayment(prdt_id);
      m.addAttribute("projectDto",projectDto);
      System.out.println(projectDto);
      
      //5.DB에 저장된 리워드(배열)을 String형태로 가져옴
      Map pn = new HashMap();
      pn.put("pay_no", Integer.parseInt(num[1]));
      
      List<PaymentDto> paymentDto_r = paymentDao.paynoreinfo(pn);

      //6.(,)를 기준으로 각 리워드를 자르고 배열로 저장
      String[] rd_id = paymentDto_r.get(0).getReward_id_s().split(",");
      String[] rd_cnt = paymentDto_r.get(0).getReward_user_cnt_s().split(",");
      
      //7. 유저가 선택한 리워드와 해당 펀딩의 리워드 목록 중 id가 일치하는 리워드를 찾아 어레이리스트로 저장
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
            continue; //리워드 id가 일치하지 않는 경우 생략하고 계속 진행
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
  
  /*로그인 validation*/
  private boolean loginCheck(HttpServletRequest request) {
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false); // false는 session이 없어도 새로 생성하지 않음. 반환값 null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id") != null;
  }
  
  @ResponseBody
  @RequestMapping(value="/payment/addresslist/{user_no}", method = RequestMethod.POST)
  public ResponseEntity<List<AddressDto>> list(@PathVariable int user_no) {     
      List<AddressDto> list = null;
      System.out.println("리스트함수 호출");
      
      try {
        list = settingService.getList(user_no);
          
        System.out.println("list = " + list);
        return new ResponseEntity<List<AddressDto>>(list, HttpStatus.OK);       //200
          
      } catch (Exception e) {
          e.printStackTrace();
          return new ResponseEntity<List<AddressDto>>(HttpStatus.BAD_REQUEST);    //400
      }
      
  }
}
