package kr.co.purplaying.service;

import kr.co.purplaying.domain.UserDto;

public interface UserService {

  int signUpUser(String user_id, String user_pwd, String user_name,String user_nickname, String user_phone) throws Exception;

  int updateUserPwd(UserDto userDto) throws Exception;



}
