package kr.co.purplaying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.AddressDao;
import kr.co.purplaying.dao.SettingDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.AddressDto;
import kr.co.purplaying.domain.SettingDto;
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
  public SettingDto showSetting(Integer user_no) throws Exception {
    // TODO Auto-generated method stub
    return settingDao.selectSetting(user_no);
  }

  @Override
  public int modifyIntro(SettingDto settingDto) throws Exception {
    // TODO Auto-generated method stub
    return settingDao.update(settingDto);
  }

  @Override                     // address_id로 출력 확인후 변경
  public AddressDto chooseAddress(Integer user_no) throws Exception {
    // TODO Auto-generated method stub
    return addressDao.selectAddress(user_no);
  }

}
