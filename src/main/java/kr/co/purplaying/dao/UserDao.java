package kr.co.purplaying.dao;

import kr.co.purplaying.domain.UserDto;

public interface UserDao {

    UserDto selectUser(String user_id) throws Exception;
    int deleteAll() throws Exception ;
    int count() throws Exception;
    int insertUser(UserDto dto) throws Exception;
    
}