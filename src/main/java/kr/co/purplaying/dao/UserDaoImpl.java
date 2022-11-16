package kr.co.purplaying.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
  
    @Autowired
    private SqlSession session;
    private static String namespace = "kr.co.purplaying.UserMapper.";
  
    @Override
    public UserDto selectUser(String user_id) {
        return session.selectOne(namespace+"select",user_id);
    }
  
    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace+"deleteAll");
    }
  
    @Override
    public int insertUser(UserDto userDto) throws Exception {
        return session.insert(namespace+"insert",userDto);
    }
  
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }

    @Override
    public int updateName(UserDto userDto) throws Exception {
      
      return session.update(namespace + "updatename", userDto);
    }
    
    
    
    
  	
}
































