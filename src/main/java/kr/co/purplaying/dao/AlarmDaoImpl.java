package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.AlarmDto;


@Repository
public class AlarmDaoImpl implements AlarmDao{
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.AlarmMapper.";
  
  @Override
  public List<AlarmDto> selectPage(Map map) throws Exception {
      return session.selectList(namespace+"selectPage",map);
  }

  @Override
  public int count() throws Exception {
    return session.selectOne(namespace+"count");
  }

  @Override
  public AlarmDto selectAlarm(int alarm_no) throws Exception {
    return session.selectOne(namespace+"selectAlarm",alarm_no);
  }

  @Override
  public int insertAlarm(AlarmDto alarmDto) throws Exception {
    return session.insert(namespace+"insertAlarm",alarmDto);
  }


}
