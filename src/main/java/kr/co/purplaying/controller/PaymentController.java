package kr.co.purplaying.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
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
  @PostMapping("/payment/{prdt_id}")
  public String payment(@PathVariable("prdt_id") Integer prdt_id, HttpServletRequest request,
      Model m, RewardDto rewardDto,Authentication authentication ) {
    
    UserDto udt = (UserDto) authentication.getPrincipal();
   
    // 2. 로그인 성공시 펀딩결제 진행
    try {
      
      //3.해당 유저 정보
      String user_id = udt.getUser_id();
      UserDto userDto = settingService.setUser(user_id);
      m.addAttribute(userDto);
      
      //4.해당 펀딩 정보
      ProjectDto projectDto = projectService.readPayment(prdt_id);
      m.addAttribute("projectDto", projectDto);
  
      //5.JSP에서 파라미터로 넘어온 리워드 정보를 배열에 저장
       String[] arr = request.getParameterValues("no");
       String[] arr2 = request.getParameterValues("reward_cnt");
       
       int[] no_arr = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray(); //리워드번호
       String[] nm_arr = request.getParameterValues("nm"); //리워드이름
       int[] cnt_arr = Arrays.stream(arr2).mapToInt(Integer::parseInt).toArray(); //리워드수량
       String[] pr_arr = request.getParameterValues("pr"); //리워드가격
       
       //6.선택한 리워드를 바탕으로 어레이리스트 구성
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
      public String paymentCompleted(@PathVariable Integer prdt_id,Authentication authentication, Model m, String rewardid, String rewardcnt, String
      pay_total, PaymentDto paymentDto, HttpServletRequest request, HttpServletResponse response) {
      
      try {
      UserDto udt = (UserDto) authentication.getPrincipal();
      //1.해당 유저 정보
      String user_id = udt.getUser_id();
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
      
      m.addAttribute("projectDto",projectDto);
      
      //4.쿠키를 생성하여 Double submit 방지
      Cookie[] cookies = request.getCookies();
      Cookie prdtCookie = null;
      
      //4-1.최초 생성된 쿠키와 일치하는 쿠키가 존재하는지 확인
      if(cookies!=null && cookies.length>0) {
        for(int i=0;i<cookies.length;i++) {
          if(cookies[i].getName().equals("cookie"+prdt_id+userDto.getUser_no())) {
            prdtCookie = cookies[i];
          }
        }
      }
      
      //5. 쿠키가 없을 경우(최초 submit) 쿠키 생성
      if(prdtCookie == null) {
        Cookie newcookie = new Cookie("cookie"+prdt_id+userDto.getUser_no(), "prdt_id+user_no");
        response.addCookie(newcookie);
        
        //5-1. 유저가 선택한 리워드 id를 상품의 리워드 id와 비교하여 일치할 경우 수량 감소
        List<RewardDto> rewardInfo = rewardDao.selectReward(prdt_id);
        
        for (int i = 0; i < rd_id.length; i++) {
          for (int j = 0; j < rewardInfo.size(); j++) {
            if (Integer.parseInt(rd_id[i]) == rewardInfo.get(j).getRow_number()) {
              rewardDao.calRewardStock(prdt_id, rewardInfo.get(j).getReward_id(),
                  rewardInfo.get(j).getReward_stock(), Integer.parseInt(rd_cnt[i]));
            }
            else {
              continue;
            }
          }
        }
        
        //6. 후원자수,후원금액 증가,유저포인트감소 후 결정보 insert(이때 리워드는 DB에 배열로 저장됨)
        paymentService.payment(projectDto, userDto, paymentDto);
        
      }
      

      //7.완료한 결제내역을 보여주기 위해 고유 조건(유저번호,펀딩번호,총금액,리워드번호,우편번호)을 넣어줌
      Map map_p = new HashMap();
      map_p.put("user_no", userDto.getUser_no());
      map_p.put("prdt_id", prdt_id);
      map_p.put("pay_total", Integer.parseInt(pay_total));
      map_p.put("reward_id", rd_id);
      map_p.put("delivery_postcode", paymentDto.getDelivery_postcode());
      
      //8.고유 조건과 일치하는 결제,유저,펀딩정보 가져오기
      List<PaymentDto> pay_user = paymentDao.paymentCompleted(map_p);
      
      //9.유저가 선택한 리워드의 정보를 담아줌
      pay_user.get(0).setReward_id(rd_id);
      pay_user.get(0).setReward_user_cnt(rd_cnt);
      m.addAttribute("pay_user",pay_user);
      
      //10.유저가 선택한 리워드와 해당 펀딩의 리워드 목록 중 id가 일치하는 리워드를 찾아 어레이리스트로 저장
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
      return "redirect:/mypage";
      }
  }
 
  
  /*마이페이지-결제내역상세보기 클릭시 화면*/
  @GetMapping("/paymentCompleted/{pay_no}") //결제가 이뤄졌으므로 결제 번호로 맵핑
  public String paymentCompleted(@PathVariable("pay_no") Integer pay_no, HttpServletRequest request,Authentication authentication
, Model m,Integer prdt_id) {
    try {
      //1.해당 유저 정보
      UserDto udt = (UserDto) authentication.getPrincipal();
      String user_id = udt.getUser_id();
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
  
  /*결제취소*/
  @PostMapping("/paymentCancel")
  public String paymentCancel(int pay_no, HttpServletResponse response, HttpServletRequest request) {
      try {
      List<PaymentDto> list = paymentDao.paynoinfo(pay_no);
      int user_no = list.get(0).getUser_no();
      int prdt_id = list.get(0).getPrdt_id();
      int pay_total = list.get(0).getPay_total();
      
      
      Map pn = new HashMap();
      pn.put("pay_no", pay_no);
      
      List<PaymentDto> list_r = paymentDao.paynoreinfo(pn);

      String[] rd_id = list_r.get(0).getReward_id_s().split(",");
      String[] rd_cnt = list_r.get(0).getReward_user_cnt_s().split(",");

      Cookie[] cookies = request.getCookies();
      Cookie cancelCookie = null;
      
      if(cookies!=null && cookies.length>0) {
        for(int i=0;i<cookies.length;i++) {
          if(cookies[i].getName().equals("cookie"+pay_no)){
            cancelCookie = cookies[i];
          }
        }
      }
      
      if(cancelCookie == null) {
        Cookie newcookie = new Cookie("cookie"+pay_no,"pay_no");
        response.addCookie(newcookie);
        
        List<RewardDto> rewardInfo = rewardDao.selectReward(prdt_id);
        
        for (int i = 0; i < rd_id.length; i++) {
          for (int j = 0; j < rewardInfo.size(); j++) {
            if (Integer.parseInt(rd_id[i]) == rewardInfo.get(j).getRow_number()) {
              rewardDao.renewReward(prdt_id, rewardInfo.get(j).getReward_id(),
                  rewardInfo.get(j).getReward_stock(), Integer.parseInt(rd_cnt[i]));
            }
            else {
              continue;
            }
          }
        }
               
        paymentService.paymentCancel(pay_no, pay_total,prdt_id,user_no);
        }
      }
      catch (Exception e) {
        
      }
      return "redirect:/mypage";
      
  }
  
  
  /*로그인 validation*/
  private boolean loginCheck(String string) {
    // 1. 세션을 얻어서
    return string != null || string != ""; 
       
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
  
  @ResponseBody
  @RequestMapping(value="/payment/selectadd", method = RequestMethod.POST)
  public AddressDto stmodaddress(@RequestBody AddressDto addressDto) {
    System.out.println("수정 전 addressDto = " + addressDto);
    try {
      AddressDto dto = settingService.chooseAddress(addressDto.getAddress_id());
      return dto;
    }catch (Exception e) {
      e.printStackTrace();
      return null;
    }
    
  }
}
