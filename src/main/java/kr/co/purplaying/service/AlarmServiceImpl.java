package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.AlarmDao;
import kr.co.purplaying.domain.AlarmDto;

@Service
public class AlarmServiceImpl implements AlarmService{
  
  @Autowired
  AlarmDao alarmDao;

  @Override
  public List<AlarmDto> getPage(Map map) throws Exception {
      return alarmDao.selectPage(map);
  }

  @Override
  public int getCount() throws Exception {
    return alarmDao.count();
  }

  @Override
  public AlarmDto selectAlarm(int alarm_no) throws Exception {
    return alarmDao.selectAlarm(alarm_no);
  }

  @Override
  public int insertAlarm(AlarmDto alarmDto) throws Exception {
    return alarmDao.insertAlarm(alarmDto);
  }

  @Override
  public List<AlarmDto> selectPage(Map map) throws Exception {
    return alarmDao.selectPage(map);
  }

}
