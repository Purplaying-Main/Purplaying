package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AddressDto;
import kr.co.purplaying.domain.SettingDto;
import kr.co.purplaying.domain.UserDto;

public interface SettingService {

  UserDto setUser(String user_id) throws Exception;
  Map<String, Object> showSetting(String user_id) throws Exception;
  int modifyName(UserDto userDto) throws Exception;
  int modifyIntro(Map<String, Object> map) throws Exception;
  AddressDto chooseAddress(Integer address_id) throws Exception;   // address_id로 출력 확인후 변경
  int modifyProfile(Map<String, Object> map) throws Exception;
  int modifyPwd(UserDto userDto) throws Exception;
  
  int addressAdd(AddressDto addressDto) throws Exception;
  List<AddressDto> getList(int user_no) throws Exception;
  int modifyAddress(AddressDto addressDto) throws Exception;
  int removeAddress(Integer address_id) throws Exception;
  int insertcheckbox(int user_no, boolean agree_marketing) throws Exception;
  SettingDto selectUserCheck(int user_no) throws Exception;
  int modifyPhone(UserDto userDto) throws Exception;
  
}
