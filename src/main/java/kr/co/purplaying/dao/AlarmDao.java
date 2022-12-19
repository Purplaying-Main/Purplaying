package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AlarmDto;

public interface AlarmDao {

  List<AlarmDto> selectPage(Map map) throws Exception;

  int count() throws Exception;

  AlarmDto selectAlarm(int alarm_no) throws Exception;

  int insertAlarm(AlarmDto alarmDto) throws Exception;

  int increaseViewCnt(int alarm_no) throws Exception;

}
