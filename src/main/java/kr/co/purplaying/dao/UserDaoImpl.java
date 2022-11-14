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
	
	
}
































