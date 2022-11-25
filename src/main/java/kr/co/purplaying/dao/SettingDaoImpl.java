package kr.co.purplaying.dao;

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

}
