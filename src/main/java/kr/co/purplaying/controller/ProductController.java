package kr.co.purplaying.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.dao.RewardDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.RewardDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.domain.UpdateDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.CommunityService;
import kr.co.purplaying.service.LikeService;
import kr.co.purplaying.service.ProjectService;
import kr.co.purplaying.service.ReplyService;
import kr.co.purplaying.service.RewardService;

@Controller
@RequestMapping("/project")
public class ProductController {
  
  @Autowired
  ProjectService projectService;
  
  @Autowired
  RewardDao rewardDao;
  
  @Autowired
  PaymentDao paymentDao;
  
  
  @Autowired
  RewardService rewardService;
  
  @Autowired
  ReplyService replyService;
  
  @Autowired
  UserDao userDao;
  
  @Autowired
  CommunityService communityService;
  
  
  @Autowired
  LikeService likeService;
  
  //????????????
  @GetMapping("/view/{prdt_id}")
  public String view(@PathVariable Integer prdt_id,
                                      Model m,
                                      Authentication authentication) {
        try {
          UserDto udt = (UserDto) authentication.getPrincipal();
          String user_id = udt.getUser_id();
          m.addAttribute("user_id",user_id);
          
          ProjectDto projectDto = projectService.read(prdt_id);
          m.addAttribute(projectDto);
          System.out.println(projectDto);
          
          List<RewardDto> list = rewardService.selectReward(prdt_id);
          
          System.out.println(list);    
          m.addAttribute("dto",list);
          
          String writer = projectDto.getWriter();
          m.addAttribute(writer);
          
      
      } catch (Exception e) {
          e.printStackTrace();
          return "redirect:/mypage";
      }
      
      return "projectDetail";
  }
 
  /*?????? ?????? ????????? (????????? ?????? ????????????)*/
  @GetMapping("/{prdt_id}")
  public String viewproduct(@PathVariable Integer prdt_id, Model m, Authentication authentication) {

        try {
          //1.?????? ?????? ????????????
          ProjectDto projectDto = projectService.read(prdt_id);
          m.addAttribute(projectDto);
          
          //2.?????????,???????????? ?????? ????????????
          List<RewardDto> list = rewardService.selectReward(prdt_id);
          List<UpdateDto> list_update = projectService.selectUpdate(prdt_id);
          UserDto userDto = userDao.selectUser(projectDto.getWriter());
          m.addAttribute(userDto);
          
          
          SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
          for(int i = 0; i<list_update.size(); i++) {
            list_update.get(i).setUpdate_regdate_string(list_update.get(i).getUpdate_regdate());
          }
          
          //3.???????????? ??????
          if(authentication != null) {
           UserDto udt = (UserDto) authentication.getPrincipal();          
           String user_id = (String)udt.getUser_id();
           UserDto cuser = userDao.selectUser(user_id);
           m.addAttribute("cuser", cuser);
           
           //3-1.???????????? ?????? ??????
           if(paymentDao.alreadyBuy(prdt_id, cuser.getUser_no()) == null) {             
             m.addAttribute("alreadyBuy", false );
           }
           else {m.addAttribute("alreadyBuy", true );}

          if(user_id!=null) {
            boolean likecheck = false;
            List<Integer> Likelist = likeService.selectLikelist(user_id);
            System.out.println(Likelist);
         
       
            m.addAttribute("Likelist",Likelist);
            
          }
          }
          
          m.addAttribute("list_update",list_update);     
          m.addAttribute("dto",list);
          //m.addAttribute("list_community", list_community);
          //m.addAttribute("list_reply", list_reply);
   
          String writer = projectDto.getWriter();
          m.addAttribute(writer);
          
      
      } catch (Exception e) {
          e.printStackTrace();
          
      }
      
      return "projectDetail";
  }
  
  
  
    /*????????? ????????????*/
    @ResponseBody
    @PostMapping("/reward_category")
    public ResponseEntity<List<RewardDto>> rewardOption(@RequestBody RewardDto rewardDto){
    try {

    List<RewardDto> list = rewardDao.rewardCategory(rewardDto.getPrdt_id(),rewardDto.getReward_category());
    
     return new ResponseEntity<List<RewardDto>>(list, HttpStatus.OK);
    
    } catch (Exception e) {   
        e.printStackTrace();
        return new ResponseEntity<List<RewardDto>>(HttpStatus.BAD_REQUEST);
      }
    
    }
   
  
  
  @GetMapping("/calculate/{prdt_goal}")
  public @ResponseBody String[] calculate(@PathVariable Integer prdt_goal) {
      System.out.println(prdt_goal);
      
      return calculatePrice(prdt_goal);
  }
  
  @GetMapping("/calDate/{openDate}/{endDate}")//{year}{month}{day}
  public @ResponseBody int calDate(@PathVariable String openDate, @PathVariable String endDate ) {
 
      // date1, date2 ??? ????????? parse()??? ?????? Date????????? ??????.
      return calculateDate(openDate,endDate);
  }
  
  
  //????????? ????????? ???????????? ????????? 
  @DeleteMapping("/remove/{prdt_id}")
  public ResponseEntity<String> remove(@PathVariable Integer prdt_id, HttpSession session ,Authentication authentication) {
      UserDto user = (UserDto) authentication.getPrincipal();
      String writer = user.getUser_id();
      
      try {
          int removeResult = projectService.remove(prdt_id, writer);
          
          if(removeResult != 1) 
              throw new Exception("Delete Failed");
          
          return new ResponseEntity<>(HttpStatus.OK);
      } catch (Exception e) {
          e.printStackTrace();
          return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
      }
  }
  
  @PostMapping("/write")
  public String write(ProjectDto projectDto, Model m, 
                      RedirectAttributes rattr, Authentication authentication, HttpServletRequest request) {
    
    UserDto udt = (UserDto) authentication.getPrincipal();
          
      String writer = udt.getUser_id();
      projectDto.setWriter(writer);
      projectDto.setUser_id(writer);
      System.out.println("projectDto : "+projectDto);
      try {
          if(projectService.write(projectDto) != 1)
            throw new Exception("write failed");
          rattr.addFlashAttribute("msg", "WRT_OK");
          m.addAttribute("mode", "new");
          
          projectDto = projectService.readRecently(writer);
          projectDto.setPrdt_id(projectDto.getPrdt_id());
          System.out.println(projectDto);
          
          UpdateDto updateDto = new UpdateDto();
          updateDto.setPrdt_id(projectDto.getPrdt_id());
          updateDto.setUser_id(writer);
          updateDto.setUpdate_title("???????????? ??????");
          updateDto.setUpdate_desc("??????????????????");
          
          String[] result_price = calculatePrice(projectDto.getPrdt_goal());
          
          //????????????
          SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
          String openDate =format.format(projectDto.getPrdt_opendate());
          String endDate =format.format(projectDto.getPrdt_enddate());
          
          //????????? ??????
          final Calendar cal = Calendar.getInstance();
          cal.setTime(projectDto.getPrdt_enddate());
          cal.add(Calendar.DATE,1);
          String finishDate = format.format(cal.getTime());
          
          m.addAttribute(projectDto);
          m.addAttribute("finishDate",finishDate);
          m.addAttribute("result_price", result_price);
          m.addAttribute("calDate",calculateDate(openDate,endDate));
          m.addAttribute("openDate", openDate);
          m.addAttribute("endDate", endDate);
          
          if(projectService.insertUpdate(updateDto)!=1) {
            throw new Exception("InsertUpdate ERR");
          }

          return "projectRegisterPage";
      } catch (Exception e) {
          e.printStackTrace();
          m.addAttribute("mode", "new");                  //????????? ??????
          m.addAttribute("projectDto", projectDto);           //??????????????? ????????? ???????????? ???
          m.addAttribute("msg", "WRT_ERR");
          return "projectRegisterIntro";
      } 
  }
  
  @GetMapping("/write")
  public String write(Model m) {
      m.addAttribute("mode", "new");
      
      return "projectRegisterIntro";         // board.jsp ????????? ????????? ??????. ????????? ??????????????? mode=new
  }
   
  @PatchMapping("/modify/{prdt_id}")
  public ResponseEntity<List<ProjectDto>> modify(@PathVariable Integer prdt_id,
                                       @RequestBody ProjectDto projectDto, 
                                       HttpSession session, Authentication authentication){
    
      List<ProjectDto> list = null;
      
      UserDto user = (UserDto)authentication.getPrincipal();
      String writer = user.getUser_id();
      projectDto.setWriter(writer);
      projectDto.setPrdt_id(prdt_id);
      
      try {
        list = projectService.getList(prdt_id);
        
        if(projectService.modify(projectDto) != 1)
          throw new Exception("Modify failed");
        
        return new ResponseEntity<List<ProjectDto>>(list, HttpStatus.OK);
      } catch (Exception e) {
        e.printStackTrace();
        return new ResponseEntity<List<ProjectDto>>(HttpStatus.BAD_REQUEST);
      }
  }
  
  
  @GetMapping("/modify/{prdt_id}")
  public String modify(@PathVariable Integer prdt_id, Model m, SearchItem sc, HttpSession session,Authentication authentication) {
    try {
          UserDto user = (UserDto) authentication.getPrincipal();
          String user_id = user.getUser_id();
          m.addAttribute(user_id);
          
          ProjectDto projectDto = projectService.read(prdt_id);
          
          //?????? ??????
          String[] result_price = calculatePrice(projectDto.getPrdt_goal());
          
          //????????????
          SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
          String openDate =format.format(projectDto.getPrdt_opendate());
          String endDate =format.format(projectDto.getPrdt_enddate());
          
          //????????? ??????
          final Calendar cal = Calendar.getInstance();
          cal.setTime(projectDto.getPrdt_enddate());
          cal.add(Calendar.DATE,1);
          String finishDate = format.format(cal.getTime());
          
          m.addAttribute("finishDate",finishDate);
          m.addAttribute("result_price", result_price);
          m.addAttribute("calDate",calculateDate(openDate,endDate));
          m.addAttribute("openDate", openDate);
          m.addAttribute("endDate", endDate);
          m.addAttribute(projectDto);
          
          List<RewardDto> list = rewardService.selectReward(prdt_id);
          
          System.out.println(list);    
          m.addAttribute("dto",list);
          
          String writer = projectDto.getWriter();
          m.addAttribute(writer);
  
      } catch (Exception e) {
          e.printStackTrace();
    //    ???????????? -> ???????????? ????????????
          return "mypage";
      }
  
    return "projectRegisterPage";
  }
  
  @PostMapping("/writeUpdate")
  @ResponseBody
  public List<UpdateDto> writeUpdate(@RequestBody UpdateDto updateDto, HttpSession session, Authentication authentication) {
    UserDto user = (UserDto) authentication.getPrincipal();
    updateDto.setUser_id(user.getUser_id());
    System.out.println(updateDto);
   
    try {
      projectService.insertUpdate(updateDto);
      List<UpdateDto> list_update = projectService.selectUpdate(updateDto.getPrdt_id());
      return list_update;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
  
  private String[] calculatePrice(int prdt_goal) {
    int agencies_commission = (prdt_goal/100*3)+(prdt_goal/100*3/100*10);
    int platform_commission = (prdt_goal/100*5)+(prdt_goal/100*5/100*10);
    int result = prdt_goal - (agencies_commission+platform_commission);
    String[] result_price = {String.valueOf(result),String.valueOf(agencies_commission+platform_commission),String.valueOf(agencies_commission),String.valueOf(platform_commission)};
    System.out.println(platform_commission);
    return result_price;
  }
  private int calculateDate(String openDate , String endDate) {
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    try {
      Date StartDate = format.parse(openDate);
      Date finishDate = format.parse(endDate);
      
      long calDate = finishDate.getTime() - StartDate.getTime(); 
      long calDateDays = calDate / (24*60*60*1000); 

      calDateDays = Math.abs(calDateDays);
      
      System.out.println(calDateDays+"???");
      return (int)calDateDays;
    } catch (ParseException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return 0;
    }
  }
  
}
