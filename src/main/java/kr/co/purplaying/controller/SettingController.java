package kr.co.purplaying.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
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
  public String list(Model m, HttpSession session, Authentication authentication) {
    
    UserDto dto = (UserDto) authentication.getPrincipal();
    
    try {
      String id = dto.getUser_id();
      // 유저 정보에서 유저 번호를 얻음
      int user_no = dto.getUser_no();
      
      //point용 유저정보
      UserDto pointUserDto = userDao.selectUser(id);
      // 모델에 point 정보 저장
      m.addAttribute("pointUserDto",pointUserDto);
      
      // 세션에 있는 유저 아이디를 통해 유저 셋팅 정보를 불러옴
      SettingDto settingDto = settingService.selectUserCheck(user_no);
      // 유저 번호와 셋팅 정보를 모델에 저장
      m.addAttribute("user_no",user_no);
      m.addAttribute("settingDto",settingDto);
      
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
  
  // 프로필 이미지 수정
  @SuppressWarnings("deprecation")
  @RequestMapping(value="/setting/profile/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyProfile(@PathVariable int user_no, @RequestBody Map<String, Object> map , HttpSession session, Authentication authentication) {
    //map에 유저 번호를 할당함
    map.put("user_no", user_no);
    UserDto dto = (UserDto) authentication.getPrincipal();
    String id = dto.getUser_id();
    
    try {
      //프로필 변경시 유저정보(userDto) 세션에 저장
      UserDto userDto = settingService.setUser(id);
      session.putValue("userDto", userDto);
        
        // 프로필 사진 수정이 되지 않았으면 오류를 반환
        if(settingService.modifyProfile(map) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
    }
  }
  
  // 이름 수정 시작
  @ResponseBody
  @RequestMapping(value="/setting/stmodnname", method = RequestMethod.POST)
  public UserDto stmodNname(@RequestBody UserDto userDto, Authentication authentication) {
    // 세션에 있는 유저 아이디를 가져와 id에 할당
    userDto = (UserDto) authentication.getPrincipal();
    String id = userDto.getUser_id();
    
    try {
      // 유저 아이디를 통해 유저 정보를 불러옴
      UserDto dto = settingService.setUser(id);
      return dto;
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return null;
    }
    
  }
  
  // 이름 수정 완료
  @RequestMapping(value="/setting/nname/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyNname(@PathVariable int user_no, @RequestBody UserDto userDto, Authentication authentication) {
    UserDto dto = (UserDto) authentication.getPrincipal();
    String id = dto.getUser_id();
    userDto.setUser_id(id);
    
    try {
        // 닉네임 수정이 이루어지지 않았으면 오류를 반환한다.
        if(settingService.modifyNickName(userDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
    }
  }
  
  // 소개글 수정 시작
  @ResponseBody
  @RequestMapping(value="/setting/stmodintro/{user_no}", method = RequestMethod.POST)
  public SettingDto stmodIntro(@PathVariable int user_no, @RequestBody SettingDto settingDto) {
    
    try {
      // 소개글 수정 시작시 유저 번호를 통해 셋팅 정보를 불러온다.
      settingDto = settingService.showSetting(user_no);
      return settingDto;
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return null;
    }
    
  }
  
  // 소개글 수정 완료
  @RequestMapping(value="/setting/intro/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<SettingDto> modifyIntro(@PathVariable int user_no, @RequestBody SettingDto settingDto) {
    // 수정할 소개글이 담겨있는 객체에 유저 번호를 할당함
    settingDto.setUser_no(user_no);
    
    try {
        // 소개글 수정이 이루어지지 않았으면 오류를 반환한다.
        if(settingService.modifyIntro(settingDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<SettingDto>(HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<SettingDto>(HttpStatus.BAD_REQUEST);
    }
  }
  
  // 비밀번호 수정 완료
  @RequestMapping(value="/setting/pwd/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyPwd(@PathVariable int user_no, @RequestBody UserDto userDto, Authentication authentication) {
    UserDto dto = (UserDto) authentication.getPrincipal();
    String id = dto.getUser_id();
    userDto.setUser_id(id);
    
    try {
        // 비밀번호 수정이 이루어지지 않았으면 오류를 반환한다.
        if(settingService.modifyPwd(userDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
    }
  }
  
  // 연락처 수정 완료
  @RequestMapping(value="/setting/phone/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyPhone(@PathVariable int user_no, @RequestBody UserDto userDto, Authentication authentication) {
    userDto.setUser_no(user_no);
    
    try {
        // 비밀번호 수정이 이루어지지 않았으면 오류를 반환한다.
        if(settingService.modifyPhone(userDto) != 1)
            throw new Exception("Update failed");
        return new ResponseEntity<String>("MOD_OK",HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR",HttpStatus.BAD_REQUEST);
    }
  }
  
  // 배송지 추가 시작
  @ResponseBody
  @RequestMapping(value="/setting/stregaddress/{user_no}", method = RequestMethod.POST)
  public int addressCnt(@PathVariable int user_no) {
    // 유저 번호를 통해 유저가 등록한 주소 갯수를 가져옴
    int Cnt = settingService.addressCnt(user_no);
    
    return Cnt;
    
  }
  
  // 배송지 추가 완료
  @ResponseBody
  @RequestMapping(value="/setting/address/{user_no}", method = RequestMethod.POST)
  public List<AddressDto> addAddress(@PathVariable int user_no, @RequestBody AddressDto addressDto, Authentication authentication) {
    // 주소지 정보를 담은 객체에 유저 번호를 할당함
    addressDto.setUser_no(user_no);
    
    try {
        // 배송지 추가가 이루어지지 않았으면 오류 반환
        if(settingService.addressAdd(addressDto) != 1)
            throw new Exception("add address failed");
        
        // 유저 번호를 통해 유저가 등록한 배송지의 목록을 불러옴
        List<AddressDto> addressList = settingService.getList(user_no);

        return addressList;
    }catch(Exception e) {
        e.printStackTrace();
        return null;
    }
  }
  
  // 유저가 등록한 배송지를 불러옴
  @ResponseBody
  @RequestMapping(value="/setting/addresslist/{user_no}", method = RequestMethod.POST)
  public ResponseEntity<List<AddressDto>> list(@PathVariable int user_no) {
      // 리스트 변수 선언
      List<AddressDto> list = null;
      
      try {
        // 유저 번호를 통해 얻은 배송지 리스트를 list 변수에 할당
        list = settingService.getList(user_no);

        return new ResponseEntity<List<AddressDto>>(list, HttpStatus.OK);       //200
          
      } catch (Exception e) {
          e.printStackTrace();
          return new ResponseEntity<List<AddressDto>>(HttpStatus.BAD_REQUEST);    //400
      }
      
  }
  
  // 배송지 수정 시작
  @ResponseBody
  @RequestMapping(value="/setting/stmodaddress", method = RequestMethod.POST)
  public AddressDto stmodaddress(@RequestBody AddressDto addressDto) {
    try {
      // 배송지 번호를 통해 수정할 배송지의 정보를 불러옴
      AddressDto dto = settingService.chooseAddress(addressDto.getAddress_id());
      return dto;
    }catch (Exception e) {
      e.printStackTrace();
      return null;
    }
    
  }
  
  // 배송지 수정 완료
  @RequestMapping(value="/setting/endmodaddress", method = RequestMethod.PATCH)
  public ResponseEntity<List<AddressDto>> modifyAddress(@RequestBody AddressDto addressDto , Authentication authentication) {
    List<AddressDto> list = null;
    UserDto userDto = (UserDto) authentication.getPrincipal();
    String id = userDto.getUser_id();
    try {
      // 유저 아이디를 통해 유저 정보를 불러오고 유저 번호를 얻음
      UserDto dto = settingService.setUser(id);
      int user_no = dto.getUser_no();
      
      // 배송지 수정이 이루어지지 않았으면 오류 반환
      if(settingService.modifyAddress(addressDto) != 1)
          throw new Exception("Update failed");
      
      // 유저 번호를 통해 배송지 목록을 얻음
      list = settingService.getList(user_no);
      
      return new ResponseEntity<List<AddressDto>>(list, HttpStatus.OK);
    }catch(Exception e) {
      e.printStackTrace();
      return new ResponseEntity<List<AddressDto>>(HttpStatus.BAD_REQUEST);
    }
  }
  
  // 배송지 삭제
  @ResponseBody
  @RequestMapping(value="/setting/deladdress/{address_id}", method = RequestMethod.DELETE)
  public ResponseEntity<List<AddressDto>> remove(@PathVariable Integer address_id, Authentication authentication) {
    List<AddressDto> list = null;
    
    UserDto userDto = (UserDto) authentication.getPrincipal();
    String id = userDto.getUser_id();
    
    
    try {
          // 유저 아이디를 통해 유저 정보를 불러오고 유저 번호를 얻음
          UserDto dto = settingService.setUser(id);
          int user_no = (int)dto.getUser_no();
    
          // 배송지 삭제가 이루어지지 않으면 오류 반환
          if(settingService.removeAddress(address_id) != 1) 
              throw new Exception("Delete Failed");
          // 유저 넘버를 통해 배송지 목록을 불러옴
          list = settingService.getList(user_no);
          
          return new ResponseEntity<List<AddressDto>>(list, HttpStatus.OK);       //200
          
      } catch (Exception e) {
          e.printStackTrace();
          return new ResponseEntity<List<AddressDto>>(HttpStatus.BAD_REQUEST);
      }
  }
  
  // 알림 수신여부 수정
  @RequestMapping(value="/setting/alarm/{user_no}", method = RequestMethod.PATCH)
  public ResponseEntity<String> modifyAlarm(@PathVariable int user_no, @RequestBody SettingDto settingDto , HttpSession session, Authentication authentication, Model m) {
    try {
      
      // 모델에 유저 번호를 할당함
      m.addAttribute("user_no",user_no);
      // 유저 번호를 통해 셋팅값을 불러옴
      settingDto.setUser_no(user_no);
      
//        List<SettingDto> agreeList = settingService.getAgreeList(user_no);
//        System.out.println("agreeList : "+agreeList);
      
      // 수신여부의 값이 수정되자 않았으면 오류를 반환함
      if(settingDao.updateAlarm(settingDto) != 1)
          throw new Exception("Update failed");
      return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
    }catch(Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
    }
  }
  
}