package kr.co.purplaying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.UserDto;

@Service
public class SettingServiceImpl implements SettingService {
  

  @Autowired
  UserDao userDao;
 
  @Override
  public UserDto setUser(String user_id) throws Exception {
    // TODO Auto-generated method stub
  return userDao.selectUser(user_id);
  }

  @Override
  public int modifyName(UserDto userDto) throws Exception {
    // TODO Auto-generated method stub
    return userDao.updateName(userDto);
  }

}
