package kr.co.purplaying.dao;

import kr.co.purplaying.domain.UserDto;

public interface UserDao {

	UserDto selectUser(String user_id) throws Exception;
	int deleteAll() throws Exception ;
	int count() throws Exception;
	int insertUser(UserDto dto) throws Exception;
    int signUpUser(String user_id, String user_pwd, String user_name, String user_phone) throws Exception;
    int userCheck(int user_no,boolean agree1,boolean agree2,boolean agree3,boolean agree4, boolean agree5) throws Exception;
    UserDto searchUser_no(String user_id) throws Exception;
}