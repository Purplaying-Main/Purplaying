package kr.co.purplaying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.UserDto;

@Service
public class SettingServiceImpl implements SettingService {
  

  @Autowired
  UserDao userdao;
 
  @Override
  public UserDto setUser(String user_id) throws Exception {
    // TODO Auto-generated method stub
  return userdao.selectUser(user_id);
  }

}
