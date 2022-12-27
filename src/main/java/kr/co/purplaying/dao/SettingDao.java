package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.SettingDto;

public interface SettingDao {

  // 유저의 셋팅값 불러오기
  SettingDto selectSetting(int user_no) throws Exception;
  // 유저의 소개글 변경
  int updateIntro(SettingDto settingDto) throws Exception;
  // 회원 가입시 마케팅 활용 여부 입력
  int insertcheckbox(int user_no,boolean agree_marketing) throws Exception;
  // 알림 수신 여부 출력
  SettingDto selectUserCheck(int user_no) throws Exception;
  // 알림 수신 여부 수정
  int updateAlarm(SettingDto settingDto) throws Exception;
  // 알림 수신 여부 출력
  List<SettingDto> selectAll(int user_no) throws Exception;
  
}
