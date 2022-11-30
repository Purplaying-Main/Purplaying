package kr.co.purplaying.controller;

import java.util.List;
import java.util.Map;

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

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.AddressDto;
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
    
    try {
      
      UserDto userDto = settingService.setUser(id);
      m.addAttribute(userDto);
      
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
    
    try {
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
      List<AddressDto> addresslist = null;
      System.out.println("리스트함수 호출");
      
      try {
        addresslist = settingService.getList(user_no);
          
          System.out.println("list = " + addresslist);
          return new ResponseEntity<List<AddressDto>>(addresslist, HttpStatus.OK);       //200
          
      } catch (Exception e) {
          e.printStackTrace();
          return new ResponseEntity<List<AddressDto>>(HttpStatus.BAD_REQUEST);    //400
      }
      
  }
}