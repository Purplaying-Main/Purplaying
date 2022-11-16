package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.UserDto;

public interface UserDao {

	UserDto selectUser(String user_id) throws Exception;
	int deleteAll() throws Exception ;
	int count() throws Exception;
	int insertUser(UserDto userDto) throws Exception;
	int updateName(UserDto userDto) throws Exception;
	
}