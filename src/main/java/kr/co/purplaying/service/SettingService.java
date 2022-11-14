package kr.co.purplaying.service;

import kr.co.heart.domain.BoardDto;
import kr.co.purplaying.domain.UserDto;

public interface SettingService {

  UserDto setUser(String user_id) throws Exception;
  int modifyName(UserDto userDto) throws Exception;
  
}
