package kr.co.purplaying.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.UserMapper.";
  
  @Override
  public UserDto selectUser(String user_id) throws Exception {
    return session.selectOne(namespace+"selectUser", user_id);
    
  }

  @Override
  public UserDto selectUserbyId(int user_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"selectUserbyId", user_no);
   
  }



	
}































