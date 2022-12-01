package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

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
  public AddressDto chooseAddress(Integer address_id) throws Exception {
    System.out.println(address_id);
    return addressDao.selectAddress(address_id);
  }

  @Override
  public int modifyProfile(Map<String, Object> map) throws Exception {
    return userDao.modifyProfile(map);
  }

  @Override
  public int modifyPwd(UserDto userDto) throws Exception {
    // TODO Auto-generated method stub
    return userDao.updateUserPwd(userDto);
  }

  @Override
  public int addressAdd(AddressDto addressDto) throws Exception {
    // TODO Auto-generated method stub
    return addressDao.insert(addressDto);
  }

  @Override
  public List<AddressDto> getList(int user_no) throws Exception {
    // TODO Auto-generated method stub
    return addressDao.selectAll(user_no);
  }

  @Override
  public int modifyAddress(AddressDto addressDto) throws Exception {
    // TODO Auto-generated method stub
    return addressDao.update(addressDto);
  }

  @Override
  public int insertcheckbox(int user_no,boolean agree_marketing) throws Exception {
    return settingDao.insertcheckbox(user_no,agree_marketing);
  }

  @Override
  public SettingDto selectUserCheck(int user_no) throws Exception {
    // TODO Auto-generated method stub
    return settingDao.selectUserCheck(user_no);
  }

}