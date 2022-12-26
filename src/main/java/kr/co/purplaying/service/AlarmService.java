package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AlarmDto;

public interface AlarmService {

  List<AlarmDto> getPage(Map map) throws Exception;

  int getCount() throws Exception;

  AlarmDto selectAlarm(int alarm_no) throws Exception;

  int insertAlarm(AlarmDto alarmDto) throws Exception;

  List<AlarmDto> selectPage(Map map) throws Exception;

  AlarmDto read(int alarm_no) throws Exception;

}
