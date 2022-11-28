package kr.co.purplaying.service;

import java.util.Map;

import kr.co.purplaying.domain.AddressDto;
import kr.co.purplaying.domain.SettingDto;
import kr.co.purplaying.domain.UserDto;

public interface SettingService {

  UserDto setUser(String user_id) throws Exception;
  Map<String, Object> showSetting(String user_id) throws Exception;
  int modifyName(UserDto userDto) throws Exception;
  int modifyIntro(Map<String, Object> map) throws Exception;
  Map<String, Object> chooseAddress(String user_id) throws Exception;   // address_id로 출력 확인후 변경
  int modifyProfile(Map<String, Object> map) throws Exception;
  
}
