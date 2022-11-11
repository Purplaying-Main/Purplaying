package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.heart.domain.BoardDto;
import kr.co.purplaying.domain.UserDto;

public interface UserDao {

	UserDto selectUser(String user_id) throws Exception;
	int deleteAll() throws Exception ;
	int count() throws Exception;
	int insertUser(UserDto dto) throws Exception;
	int updatename(UserDto dto) throws Exception;
}