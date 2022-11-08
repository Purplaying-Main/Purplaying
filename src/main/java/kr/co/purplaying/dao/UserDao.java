package kr.co.purplaying.dao;

import kr.co.purplaying.domain.User;

public interface UserDao {

	User selectUser(String id);
	void deleteAll() throws Exception;
	int insertUser(User user);
	int updateUser(User user);

}