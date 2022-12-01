package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.SettingDto;

@Repository
public class SettingDaoImpl implements SettingDao {
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.SettingMapper.";

  @Override
  public Map<String, Object> selectSettingJoinUser(String user_id) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace + "selectSettingJoinUser", user_id);
  }

  @Override
  public int updateIntro(Map<String, Object> map) throws Exception {
    // TODO Auto-generated method stub
    return session.update(namespace + "updateIntro", map);
  }

  @Override
  public int insert(SettingDto settingDto) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int update(SettingDto settingDto) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int insertcheckbox(int user_no,boolean agree_marketing) throws Exception {
    Map map = new HashMap();
    map.put("user_no", user_no);
    map.put("agree_marketing", agree_marketing);
    
    return session.insert(namespace+"insertcheckbox",map);
  }

  @Override
  public SettingDto selectUserCheck(int user_no) throws Exception {

    return session.selectOne(namespace+"selectUserCheck",user_no);
  }

}
