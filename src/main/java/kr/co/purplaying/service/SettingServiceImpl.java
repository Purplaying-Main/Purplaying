package kr.co.purplaying.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.AddressDao;
import kr.co.purplaying.dao.SettingDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.UserDto;

@Service
public class SettingServiceImpl implements SettingService {
  
  UserDao userDao;
  AddressDao addressDao;
  SettingDao settingDao;
  
  @Autowired
  public SettingServiceImpl(UserDao userDao, AddressDao addressDao, SettingDao settingDao) {
    //super();
    this.userDao = userDao;
    this.addressDao = addressDao;
    this.settingDao = settingDao;
  }

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

  @Override
  public Map<String, Object> showSetting(String user_id) throws Exception {
    // TODO Auto-generated method stub
    return settingDao.selectSettingJoinUser(user_id);
  }

  @Override
  public int modifyIntro(Map<String, Object> map) throws Exception {
    // TODO Auto-generated method stub
    return settingDao.updateIntro(map);
  }

  @Override
  public Map<String, Object> chooseAddress(String user_id) throws Exception {
    System.out.println(user_id);
    return addressDao.selectAddress(user_id);
  }

  @Override
  public int modifyProfile(Map<String, Object> map) throws Exception {
    return userDao.modifyProfile(map);
  }

}