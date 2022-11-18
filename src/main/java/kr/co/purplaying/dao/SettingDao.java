package kr.co.purplaying.dao;

import kr.co.purplaying.domain.SettingDto;

public interface SettingDao {

  SettingDto selectSetting(Integer user_no) throws Exception;
  int modifyIntro() throws Exception;
  int insert(SettingDto settingDto) throws Exception;
  int update(SettingDto settingDto) throws Exception;
}
