package kr.co.purplaying.dao;

import kr.co.purplaying.domain.UserDto;

public interface UserDao {

	UserDto selectUser(String user_id);
	void deleteAll() throws Exception;
	int insertUser(UserDto user);
	int updateUser(UserDto user);

}