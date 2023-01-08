package kr.co.purplaying.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.UserDto;


@Controller
@RequestMapping("/iamport")
public class iamportController {
  
  @Autowired
  UserDao userDao;
  
  private IamportClient api;
  
  
  
  public iamportController() {
    this.api = new IamportClient("6336385321887266","sfxLwNUP9K9B4ZsJlHxWmKWyzGGin0hVI6zPJWyMWNskJtoiAHWgoHAibv7d5oLtJO6wNrgfBUakB2D3");
  }

  @ResponseBody
  @PostMapping("/verifyIamport/{imp_uid}")
  public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{   
      System.out.println("결제 UID : "+imp_uid);
      System.out.println(imp_uid);
    return api.paymentByImpUid(imp_uid);
  }
  
  @ResponseBody
  @PostMapping("/insertpoint/{paid_amount}")
  public int pointInsert(Model model, HttpSession session, @PathVariable int paid_amount, Authentication authentication) {
    System.out.println("결제 포인트 : "+paid_amount);
    
    UserDto userDto = (UserDto) authentication.getPrincipal();

    userDto.setUser_point(userDto.getUser_point()+paid_amount);
    System.out.println("user 포인트정보 : "+userDto);
    try {
      if(userDao.updatePoint(userDto)!=1) {
        return 0;
      }
      UserDto returnuserDto = userDao.selectUser(userDto.getUser_id());
      setUserSecurity(userDto);
      return returnuserDto.getUser_point();
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return 0;
    }
    
  }
 
  public void setUserSecurity(UserDto userDto) {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    List<GrantedAuthority> updatedAuthorities = new ArrayList<>(auth.getAuthorities());
    updatedAuthorities.add(new SimpleGrantedAuthority(String.valueOf(userDto.getUser_point()))); //add your role here [e.g., new SimpleGrantedAuthority("ROLE_NEW_ROLE")]
    Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(), updatedAuthorities);
    SecurityContextHolder.getContext().setAuthentication(newAuth);
  }
}