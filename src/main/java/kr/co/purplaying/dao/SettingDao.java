package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.SettingDto;

public interface SettingDao {

  SettingDto selectSetting(int user_no) throws Exception;
  int updateIntro(SettingDto settingDto) throws Exception;
  int insertcheckbox(int user_no,boolean agree_marketing) throws Exception;
  SettingDto selectUserCheck(int user_no) throws Exception;
  int updateAlarm(int user_no, boolean msg_agree,boolean update_agree,boolean favor_agree,boolean marketing_agree) throws Exception;
  List<SettingDto> selectAll(int user_no) throws Exception;
  
}
