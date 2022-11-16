package kr.co.purplaying.service;

import kr.co.purplaying.domain.AddressDto;
import kr.co.purplaying.domain.SettingDto;
import kr.co.purplaying.domain.UserDto;

public interface SettingService {

  UserDto setUser(String user_id) throws Exception;
  SettingDto showSetting(Integer user_no) throws Exception;
  int modifyName(UserDto userDto) throws Exception;
  int modifyIntro(SettingDto settingDto) throws Exception;
  AddressDto chooseAddress(Integer user_no) throws Exception;   // address_id로 출력 확인후 변경
  
}
