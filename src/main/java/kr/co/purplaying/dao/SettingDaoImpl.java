package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.List;
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

  // 유저의 셋팅 정보 출력
  @Override
  public SettingDto selectSetting(int user_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace + "selectSetting", user_no);
  }

  // 유저 소개글 수정
  @Override
  public int updateIntro(SettingDto settingDto) throws Exception {
    return session.update(namespace + "updateIntro", settingDto);
  }

  // 회원가입시 마케팅 활용 동의 여부
  @Override
  public int insertcheckbox(int user_no,boolean agree_marketing) throws Exception {
    Map map = new HashMap();
    map.put("user_no", user_no);
    map.put("agree_marketing", agree_marketing);
    
    return session.insert(namespace+"insertcheckbox",map);
  }

  // 알림 수신여부 출력
  @Override
  public SettingDto selectUserCheck(int user_no) throws Exception {

    return session.selectOne(namespace+"selectUserCheck",user_no);
  }
  
  // 알림 수신여부 수정
  @Override
  public int updateAlarm(SettingDto settingDto) throws Exception {

    return session.update(namespace + "updateAlarm",settingDto);
  }

  // 알림 수신여부 출력
  @Override
  public List<SettingDto> selectAll(int user_no) throws Exception {
    return session.selectList(namespace+"selectAll", user_no);
  }

}
