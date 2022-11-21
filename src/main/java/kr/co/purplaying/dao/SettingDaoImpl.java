package kr.co.purplaying.dao;

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
  public SettingDto selectSetting(Integer user_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace + "selectSetting", user_no);
  }

  @Override
  public int modifyIntro() throws Exception {
    // TODO Auto-generated method stub
    return 0;
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
