  package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.domain.SearchItem2;
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
      
      return session.update(namespace + "updateName", userDto);
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

    @Override
    public int findUserData(UserDto userDto) throws Exception {
      return session.selectOne(namespace+"findUserData",userDto);
    }

    @Override
    public String findUserId(UserDto userDto) throws Exception {
      return session.selectOne(namespace+"findUserId",userDto);
    }

    @Override
    public int updateUserPwd(UserDto userDto) throws Exception {
      return session.update(namespace+"updateUserPwd",userDto);
    }

    @Override
    public UserDto getPaymentUserInfo(String user_name) throws Exception {
      // TODO Auto-generated method stub
      return session.selectOne(namespace+"getPaymentUserInfo", user_name);
    }

    @Override
    public int modifyProfile(Map<String, Object> map) throws Exception {
      return session.update(namespace+"modifyProfile",map);
    }
    

    @Override
    public List<UserDto> adminSelect(SearchItem sc) throws Exception {
      return session.selectList(namespace+"adminSelect",sc);
    }

    @Override
    public int updateRole(UserDto userDto) throws Exception {
      return session.update(namespace+"updateRole",userDto);
    }

    
    //검색기능
    @Override
    public int searchuser(SearchItem2 sc2) throws Exception {
      // TODO Auto-generated method stub
      return session.selectOne(namespace+"searchuser", sc2);
    }

    @Override
    public List<UserDto> searchUserPage(SearchItem2 sc2) throws Exception {
      // TODO Auto-generated method stub
      return session.selectList(namespace+"searchUserPage", sc2);
    }
    //검색기능

    @Override
    public int getSearchResultCnt(SearchItem sc) throws Exception {
      return session.selectOne(namespace +"searchResultCnt", sc);
    }

    @Override
    public int updateUserPhone(UserDto userDto) throws Exception {
      // TODO Auto-generated method stub
      return session.update(namespace +"updateUserPhone", userDto);
    }

    @Override
    public List<UserDto> getUserList(UserDto userDto) throws Exception {
      // TODO Auto-generated method stub
      return session.selectList(namespace+"getUserList", userDto);
    }

    @Override
    public int updatePoint(UserDto userDto) throws Exception {
      // TODO Auto-generated method stub
      return session.update(namespace+"insertPoint",userDto);
    }
    
    
}

