package kr.co.purplaying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.UserDto;

@Service
public class UserServiceImpl implements UserService{
  
  @Autowired
  private UserDao userDao;
  
  @Autowired
  private BCryptPasswordEncoder bcryptPasswordEncoder;
  
  @Override
  public int signUpUser(String user_id, String user_pwd, String user_name, String user_nickname, String user_phone) throws Exception {
    UserDto userInfo = new UserDto();
  
    userInfo.setUser_id(user_id);
    userInfo.setUser_pwd(user_pwd);
    userInfo.setUser_name(user_name);
    userInfo.setUser_nickname(user_nickname);
    userInfo.setUser_phone(user_phone);
    
    System.out.println("Befor Encoder : " + userInfo.getUser_pwd());
    String endcodedPassword = bcryptPasswordEncoder.encode(userInfo.getUser_pwd());
    System.out.println("After Encoder : " + endcodedPassword);
    System.out.println("Resister User Info : " + userInfo);
    
    userInfo.setUser_pwd(endcodedPassword);

    return userDao.signUpUser(userInfo);
  }

}
