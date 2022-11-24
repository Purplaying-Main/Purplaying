package kr.co.purplaying.service;

import java.util.Map;

import kr.co.purplaying.domain.UserDto;

public interface UserService {
  UserDto readPayment(String user_name) throws Exception;
}
