package kr.co.purplaying.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.domain.AddressDto;
import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.SettingDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.SettingService;


@Controller
public class SettingController {

  @Autowired
  SettingService settingService;
  
  @RequestMapping(value="/setting", method=RequestMethod.GET)
  public String list(Model m, HttpSession session) {
    
    String id = (String)session.getAttribute("user_id");
    System.out.println(id);
    
    try {
      
      UserDto userDto = settingService.setUser(id);
      System.out.println(userDto.toString());
      m.addAttribute(userDto);

      Integer userNo = (Integer)userDto.getUser_no();
      System.out.println("userno = " + userNo);
      
      AddressDto addressDto = settingService.chooseAddress(userNo);
      m.addAttribute(addressDto);
      
      SettingDto settingDto = settingService.showSetting(userNo);
      m.addAttribute(settingDto);
      
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "setting";         //로그인 한 상태, 게시판 목록 화면으로 이동
  }
  
  @RequestMapping(value="/ModifyName", method=RequestMethod.POST)
  public String ModifyName(UserDto userDto, RedirectAttributes rattr, Model m, HttpSession session) {
    
    String id = (String)session.getAttribute("user_id");
    userDto.setUser_id(id);
    
    try {
      if(settingService.modifyName(userDto) != 1)
          throw new Exception("Modify failed");
      
        rattr.addFlashAttribute("msg", "MOD_OK");
        return "redirect:/setting";
      } catch(Exception e) {
        e.printStackTrace();
        m.addAttribute(userDto);
        m.addAttribute("msg", "MOD_ERR");
        return "setting";         // 수정등록하려던 내용을 보여줌
      }
    
  }
  
}
