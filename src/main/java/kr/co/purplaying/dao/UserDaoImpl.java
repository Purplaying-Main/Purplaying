package kr.co.purplaying.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

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
        // TODO Auto-generated method stub
        return session.selectOne(namespace+"select",user_id);
    }
  
    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace+"deleteAll");
    }
  
    @Override
    public int insertUser(UserDto dto) throws Exception {
        return session.insert(namespace+"insert",dto);
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
































