package kr.co.purplaying.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
	public int deleteAll() throws Exception {
      return session.delete(namespace+"deleteAll");
  }
	
	private void close(AutoCloseable...closeables) {
		for(AutoCloseable autoCloseable : closeables) {
			try {
				if(autoCloseable!=null) {
					autoCloseable.close();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

    @Override
    public int insertUser(UserDto dto) throws Exception {
        return session.insert(namespace+"insert",dto);
    }

    @Override
    public UserDto selectUser(String user_id) {
        // TODO Auto-generated method stub
        return session.selectOne(namespace+"select",user_id);
    }
    
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }
	
	


    @Override
    public int updateName(UserDto userDto) throws Exception {
      
      return session.update(namespace + "updatename", userDto);
    }
    

    public int signUpUser(String user_id, String user_pwd, String user_name, String user_phone) throws Exception {
      Map map = new HashMap();
      map.put("user_id", user_id);
      map.put("user_pwd", user_pwd);
      map.put("user_name", user_name);
      map.put("user_phone", user_phone);
      
      return session.insert(namespace+"insertUserInfo",map);
    }
    
    @Override
    public int userCheck(int user_no, boolean agree1,boolean agree2,boolean agree3,boolean agree4, boolean agree5) throws Exception {
      Map map = new HashMap();
      map.put("user_no", user_no);
      map.put("agree_age", agree1);
      map.put("agree_terms", agree2);
      map.put("agree_inform", agree3);
      map.put("agree_inform_third", agree4);
      map.put("agree_marketing", agree5);
      
      return session.insert(namespace+"insertUserCheck",map);
    }

    @Override
    public UserDto searchUser_no(String user_id) throws Exception {
      return session.selectOne(namespace+"selectUser_NO",user_id);
    }

    @Override
    public int updateUserActivate(int user_no) {
      return session.update(namespace+"updateUserActivation",user_no);
    }

  	
}
