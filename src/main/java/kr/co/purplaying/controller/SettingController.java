package kr.co.purplaying.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.purplaying.dao.SettingDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.AddressDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SettingDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.SettingService;


@Controller
public class SettingController {

  @Autowired
  SettingService settingService;
  
  @Autowired
  UserDao userDao;
  
  @Autowired
  SettingDao settingDao;
  
  
  @RequestMapping(value="/setting", method=RequestMethod.GET)
  public String list(Model m, HttpSession session) {
    
    String id = (String)session.getAttribute("user_id");
    System.out.println(id);
    
    try {
     
      UserDto userDto = settingService.setUser(id);
      session.putValue("userDto",userDto);
      System.out.println("userDto: "+userDto);
      int user_no = userDto.getUser_no();
      System.out.println("user_no: "+user_no);
      
      //point용 유저정보
      String user_id = (String) session.getAttribute("user_id");
      UserDto pointUserDto = userDao.selectUser(user_id);
      System.out.println(pointUserDto);
      
      m.addAttribute("pointUserDto",pointUserDto);
      
      SettingDto settingDto = settingService.selectUserCheck(user_no);
      m.addAttribute("user_no",user_no);
      m.addAttribute("settingDto",settingDto);
      
      System.out.println("settingDto: "+settingDto);
      
//      if(id!=null) {
//        Boolean msg_agree = settingDto.isMsg_agree();
//        Boolean update_agree = settingDto.isUpdate_agree();
//        Boolean favor_agree = settingDto.isFavor_agree();
//        Boolean marketing_agree = settingDto.isMarketing_agree();
//       
//        m.addAttribute("msg_agree",msg_agree);
//        m.addAttribute("update_agree",update_agree);
//        m.addAttribute("favor_agree",favor_agree);
//        m.addAttribute("marketing_agree",marketing_agree);
//
//      }
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "setting";         //로그인 한 상태, 게시판 목록 화면으로 이동
  }
  
  @RequestMapping(value="/setting/profile/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyProfile(@PathVariable int user_no, @RequestBody Map<String, Object> map , HttpSession session) {
    map.put("user_no", user_no);
    String id = (String)session.getAttribute("user_id");
    
    try {
//    프로필 변경시 유저정보(userDto) 세션에 저장
      UserDto userDto = settingService.setUser(id);
      session.putValue("userDto", userDto);
      
        if(settingService.modifyProfile(map) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
    }
  }
  
  @ResponseBody
  @RequestMapping(value="/setting/stmodnname", method = RequestMethod.POST)
  public UserDto stmodNname(@RequestBody UserDto userDto, HttpSession session) {
    String id = (String)session.getAttribute("user_id");
    
    try {
      UserDto dto = settingService.setUser(id);
      return dto;
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return null;
    }
    
  }
  
  @RequestMapping(value="/setting/nname/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyNname(@PathVariable int user_no, @RequestBody UserDto userDto , HttpSession session) {
    String id = (String)session.getAttribute("user_id");
    userDto.setUser_id(id);
    
    System.out.println("id = " + id+ "userDto = " + userDto);
    
    try {
        if(settingService.modifyNickName(userDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
    }
  }
  
  @ResponseBody
  @RequestMapping(value="/setting/stmodintro/{user_no}", method = RequestMethod.POST)
  public SettingDto stmodIntro(@PathVariable int user_no, @RequestBody SettingDto settingDto, HttpSession session) {
    
    try {
      settingDto = settingService.showSetting(user_no);
      return settingDto;
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return null;
    }
    
  }
  
  @RequestMapping(value="/setting/intro/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<SettingDto> modifyIntro(@PathVariable int user_no, @RequestBody SettingDto settingDto , HttpSession session) {
    settingDto.setUser_no(user_no);
    
    try {
        if(settingService.modifyIntro(settingDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<SettingDto>(HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<SettingDto>(HttpStatus.BAD_REQUEST);
    }
  }
  
  @RequestMapping(value="/setting/pwd/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyPwd(@PathVariable int user_no, @RequestBody UserDto userDto , HttpSession session) {
    String id = (String)session.getAttribute("user_id");
    userDto.setUser_id(id);
    
    try {
        if(settingService.modifyPwd(userDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
    }
  }
  
  @RequestMapping(value="/setting/phone/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyPhone(@PathVariable int user_no, @RequestBody UserDto userDto , HttpSession session) {
    userDto.setUser_no(user_no);
    
    try {
        if(settingService.modifyPhone(userDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
    }
  }
  
  @ResponseBody
  @RequestMapping(value="/setting/stregaddress/{user_no}", method = RequestMethod.POST)
  public int addressCnt(@PathVariable int user_no) {
    System.out.println("user_no : " + user_no);
    int Cnt = settingService.addressCnt(user_no);
    
    System.out.println("Cnt : " + Cnt);
    
    return Cnt;
    
  }
  
  @ResponseBody
  @RequestMapping(value="/setting/address/{user_no}", method = RequestMethod.POST)
  public List<AddressDto> addAddress(@PathVariable int user_no, @RequestBody AddressDto addressDto , HttpSession session) {
    addressDto.setUser_no(user_no);
    
    try {
        if(settingService.addressAdd(addressDto) != 1)
            throw new Exception("add address failed");
        
        List<AddressDto> addressList = settingService.getList(user_no);
        System.out.println("addressList " + addressList);
        return addressList;
    }catch(Exception e) {
        e.printStackTrace();
        return null;
    }
  }
  
  @ResponseBody
  @RequestMapping(value="/setting/addresslist/{user_no}", method = RequestMethod.POST)
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
  @RequestMapping(value="/setting/stmodaddress", method = RequestMethod.POST)
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
  
  @RequestMapping(value="/setting/endmodaddress", method = RequestMethod.PATCH)
  public ResponseEntity<List<AddressDto>> modifyAddress(@RequestBody AddressDto addressDto , HttpSession session) {
    List<AddressDto> list = null;
    String id = (String)session.getAttribute("user_id");
    try {
      UserDto dto = settingService.setUser(id);
      int user_no = dto.getUser_no();
      
      if(settingService.modifyAddress(addressDto) != 1)
          throw new Exception("Update failed");
      
      list = settingService.getList(user_no);
      
      System.out.println("list = " + list);
      return new ResponseEntity<List<AddressDto>>(list, HttpStatus.OK);
    }catch(Exception e) {
      e.printStackTrace();
      return new ResponseEntity<List<AddressDto>>(HttpStatus.BAD_REQUEST);
    }
  }
  
  @ResponseBody
  @RequestMapping(value="/setting/deladdress/{address_id}", method = RequestMethod.DELETE)
  public ResponseEntity<List<AddressDto>> remove(@PathVariable Integer address_id, HttpSession session) {
    List<AddressDto> list = null;
    System.out.println(address_id + "삭제 호출");
    String id = (String)session.getAttribute("user_id");
    
    
    try {
          UserDto dto = settingService.setUser(id);
          int user_no = (int)dto.getUser_no();
    
          if(settingService.removeAddress(address_id) != 1) 
              throw new Exception("Delete Failed");
          
          list = settingService.getList(user_no);
          
          System.out.println("list = " + list);
          return new ResponseEntity<List<AddressDto>>(list, HttpStatus.OK);       //200
          
      } catch (Exception e) {
          e.printStackTrace();
          return new ResponseEntity<List<AddressDto>>(HttpStatus.BAD_REQUEST);
      }
  }
  
  
  @RequestMapping(value="/setting/alarm/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyAlarm(@PathVariable int user_no, @RequestBody SettingDto settingDto , HttpSession session, Model m) {
    System.out.println("불러온값"+settingDto);
    try {
      m.addAttribute("user_no",user_no);
      settingDto.setUser_no(user_no);
      
//        List<SettingDto> agreeList = settingService.getAgreeList(user_no);
//        System.out.println("agreeList : "+agreeList);
       
        if(settingDao.updateAlarm(settingDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
    }
  }
  
}