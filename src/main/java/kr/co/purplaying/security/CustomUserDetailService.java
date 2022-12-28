package kr.co.purplaying.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.UserDto;
import okhttp3.Request;

public class CustomUserDetailService implements UserDetailsService{

  @Autowired
  private UserDao userDao;
  
  @Override
  public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
    UserDto userDto;
    try {
      userDto = userDao.getUserById(user_id);
      if(userDto == null) {
        throw new UsernameNotFoundException("user_id " + user_id + " not found");
       }
       System.out.println("**************Found user***************");
       System.out.println("id : " + userDto.getUser_id());
       System.out.println("id : " + userDto.getUser_profile());
       
       return userDto;
       
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return null;
    }
   
  }
 
}
