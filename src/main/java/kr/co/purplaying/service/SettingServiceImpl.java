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
  return userDao.selectUser(user_id);
  }

  @Override
  public int modifyNickName(UserDto userDto) throws Exception {
    return userDao.updateNickName(userDto);
  }

  @Override
  public SettingDto showSetting(int user_no) throws Exception {
    return settingDao.selectSetting(user_no);
  }

  @Override
  public int modifyIntro(SettingDto settingDto) throws Exception {
    return settingDao.updateIntro(settingDto);
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
    return userDao.updateUserPwd(userDto);
  }

  @Override
  public int addressAdd(AddressDto addressDto) throws Exception {
    return addressDao.insert(addressDto);
  }

  @Override
  public List<AddressDto> getList(int user_no) throws Exception {
    return addressDao.selectAll(user_no);
  }

  @Override
  public int modifyAddress(AddressDto addressDto) throws Exception {
    return addressDao.update(addressDto);
  }

  @Override
  public int insertcheckbox(int user_no,boolean agree_marketing) throws Exception {
    return settingDao.insertcheckbox(user_no,agree_marketing);
  }

  @Override
  public SettingDto selectUserCheck(int user_no) throws Exception {
    return settingDao.selectUserCheck(user_no);
  }

  @Override
  public int removeAddress(Integer address_id) throws Exception {
    return addressDao.deleteAddress(address_id);
  }

  @Override
  public int modifyPhone(UserDto userDto) throws Exception {
    return userDao.updateUserPhone(userDto);
  }


  @Override
  public int modifyAlarm(SettingDto settingDto) throws Exception {
  return settingDao.updateAlarm(settingDto);
  }
  

  @Override
  public List<SettingDto> getAgreeList(int user_no) throws Exception {
    return settingDao.selectAll(user_no);
  }

  @Override
  public int addressCnt(int user_no) {
    return addressDao.CntAddress(user_no);
  }
}