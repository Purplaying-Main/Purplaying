package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

  // 유저 정보 출력
  @Override
  public UserDto setUser(String user_id) throws Exception {
  return userDao.selectUser(user_id);
  }

  // 닉네임 수정
  @Override
  public int modifyNickName(UserDto userDto) throws Exception {
    return userDao.updateNickName(userDto);
  }

  // 유저 셋팅 정보 출력
  @Override
  public SettingDto showSetting(int user_no) throws Exception {
    return settingDao.selectSetting(user_no);
  }

  // 유저 소개글 수정
  @Override
  public int modifyIntro(SettingDto settingDto) throws Exception {
    return settingDao.updateIntro(settingDto);
  }

  // 배송지 선택
  @Override
  public AddressDto chooseAddress(Integer address_id) throws Exception {
    System.out.println(address_id);
    return addressDao.selectAddress(address_id);
  }

  // 유저 프로필 이미지 수정
  @Override
  public int modifyProfile(Map<String, Object> map) throws Exception {
    return userDao.modifyProfile(map);
  }

  // 비밀번호 수정
  @Override
  public int modifyPwd(UserDto userDto) throws Exception {
    return userDao.updateUserPwd(userDto);
  }

  // 배송지 추가
  @Override
  public int addressAdd(AddressDto addressDto) throws Exception {
    // 배송지 정보에서 유저 정보를 가져옴
    int user_no = addressDto.getUser_no();
    
    // 추가할 배송지가 기본 배송지이면 유저의 기존 배송지들을 일반 배송지로 변경
    if (addressDto.isDefault_address() == true)
      addressDao.DefaultT2F(user_no);
      
    return addressDao.insert(addressDto);
  }

  // 배송지 목록 출력
  @Override
  public List<AddressDto> getList(int user_no) throws Exception {
    return addressDao.selectAll(user_no);
  }

  // 배송지 수정
  @Override
  public int modifyAddress(AddressDto addressDto) throws Exception {
    // 배송지 정보에서 유저 번호를 가져옴
    int user_no = addressDto.getUser_no();
    
    // 수정할 배송지가 기본 배송지이면 유저의 기존 배송지들을 일반 배송지로 변경
    if (addressDto.isDefault_address() == true)
      addressDao.DefaultT2F(user_no);
      
    return addressDao.update(addressDto);
  }

  // 회원가입시 마케팅 활용 동의 여부 추가
  @Override
  public int insertcheckbox(int user_no,boolean agree_marketing) throws Exception {
    return settingDao.insertcheckbox(user_no,agree_marketing);
  }

  // 유저의 셋팅 정보 불러옴
  @Override
  public SettingDto selectUserCheck(int user_no) throws Exception {
    return settingDao.selectUserCheck(user_no);
  }

  // 배송지 삭제
  @Override
  public int removeAddress(Integer address_id) throws Exception {
    return addressDao.deleteAddress(address_id);
  }

  // 연락처 수정
  @Override
  public int modifyPhone(UserDto userDto) throws Exception {
    return userDao.updateUserPhone(userDto);
  }

  // 알림 수신여부 수정
  @Override
  public int modifyAlarm(SettingDto settingDto) throws Exception {
  return settingDao.updateAlarm(settingDto);
  }
  
  // 알림 수신여부 리스트 출력
  @Override
  public List<SettingDto> getAgreeList(int user_no) throws Exception {
    return settingDao.selectAll(user_no);
  }

  // 배송지 갯수 출력
  @Override
  public int addressCnt(int user_no) {
    return addressDao.CntAddress(user_no);
  }
}