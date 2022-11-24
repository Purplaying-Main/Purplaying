package kr.co.purplaying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.UserDto;
@Service
public class UserServiceImpl implements UserService {

  @Autowired
  UserDao userDao;
  
  @Override
  public UserDto readPayment(String user_name) throws Exception {
    UserDto userDto = userDao.getPaymentUserInfo(user_name);
    return userDto;
  }

}
