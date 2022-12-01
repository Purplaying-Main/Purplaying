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

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.AddressDto;
import kr.co.purplaying.domain.SettingDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.SettingService;


@Controller
public class SettingController {

  @Autowired
  SettingService settingService;
  
  @Autowired
  UserDao userDao;
  
  
  @RequestMapping(value="/setting", method=RequestMethod.GET)
  public String list(Model m, HttpSession session) {
    
    String id = (String)session.getAttribute("user_id");
    System.out.println(id);
    
    try {
     
      UserDto userDto = settingService.setUser(id);
      session.putValue("userDto",userDto);
      
      SettingDto settingDto = settingService.selectUserCheck(userDto.getUser_no());
      m.addAttribute("settingDto",settingDto);
      
      Map<String, Object> settingMap = settingService.showSetting(id);
      m.addAttribute("settingMap", settingMap);
      
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
  
  
  @RequestMapping(value="/setting/name/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyName(@PathVariable int user_no, @RequestBody UserDto userDto , HttpSession session) {
    String id = (String)session.getAttribute("user_id");
    userDto.setUser_id(id);
    
    System.out.println("id = " + id+ "userDto = " + userDto);
    
    try {
        if(settingService.modifyName(userDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
    }
  }
  
  @RequestMapping(value="/setting/intro/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyIntro(@PathVariable int user_no, @RequestBody Map<String, Object> map , HttpSession session) {
    map.put("user_no", user_no);
    
    try {
        if(settingService.modifyIntro(map) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
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
  
  @ResponseBody
  @RequestMapping(value="/setting/address/{user_no}", method = RequestMethod.POST)
  public ResponseEntity<String> addAddress(@PathVariable int user_no, @RequestBody AddressDto addressDto , HttpSession session) {
    addressDto.setUser_no(user_no);
    
    try {
        if(settingService.addressAdd(addressDto) != 1)
            throw new Exception("add address failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
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
  public ResponseEntity<AddressDto> modifyAddress(@RequestBody AddressDto addressDto , HttpSession session) {
    try {
      if(settingService.modifyAddress(addressDto) != 1)
          throw new Exception("Update failed");
      return new ResponseEntity<AddressDto>(HttpStatus.OK);
    }catch(Exception e) {
      e.printStackTrace();
      return new ResponseEntity<AddressDto>(HttpStatus.BAD_REQUEST);
    }
  }
  
}