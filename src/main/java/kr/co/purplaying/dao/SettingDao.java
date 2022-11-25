package kr.co.purplaying.dao;

import java.util.Map;

import kr.co.purplaying.domain.SettingDto;

public interface SettingDao {

  Map<String, Object> selectSettingJoinUser(String user_id) throws Exception;
  int updateIntro(Map<String, Object> map) throws Exception;
  int insert(SettingDto settingDto) throws Exception;
  int update(SettingDto settingDto) throws Exception;
  
}
