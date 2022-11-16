package kr.co.purplaying.dao;

import kr.co.purplaying.domain.UserDto;

public interface UserDao {

	UserDto selectUser(String user_id) throws Exception;
	UserDto selectUserbyId(int user_no) throws Exception;


}