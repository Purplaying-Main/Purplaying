package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AddressDto;
import kr.co.purplaying.domain.SettingDto;
import kr.co.purplaying.domain.UserDto;

public interface SettingService {

  // 유저 정보 출력
  UserDto setUser(String user_id) throws Exception;
  // 유저 셋팅 정보 출력
  SettingDto showSetting(int user_no) throws Exception;
  // 유저 닉네임 수정
  int modifyNickName(UserDto userDto) throws Exception;
  // 유저 소개글 수정
  int modifyIntro(SettingDto settingDto) throws Exception;
  // 유저의 배송지 출력
  AddressDto chooseAddress(Integer address_id) throws Exception;
  // 유저 프로필 이미지 수정
  int modifyProfile(Map<String, Object> map) throws Exception;
  // 유저 비밀번호 수정
  int modifyPwd(UserDto userDto) throws Exception;
  // 연락처 수정
  int modifyPhone(UserDto userDto) throws Exception;
  
  // 배송지 추가
  int addressAdd(AddressDto addressDto) throws Exception;
  // 유저의 배송지 목록 출력
  List<AddressDto> getList(int user_no) throws Exception;
  // 배송지 수정
  int modifyAddress(AddressDto addressDto) throws Exception;
  // 배송지 삭제
  int removeAddress(Integer address_id) throws Exception;
  // 배송지 갯수 출력
  int addressCnt(int user_no);
  
  // 회원가입시 마케팅 활용 동의 여부 추가
  int insertcheckbox(int user_no, boolean agree_marketing) throws Exception;
  // 알림 수신여부 출력
  SettingDto selectUserCheck(int user_no) throws Exception;
  // 알림 수신여부 출력
  int modifyAlarm(SettingDto settingDto) throws Exception;
  // 수신여부 리스트 출력
  List<SettingDto> getAgreeList(int user_no) throws Exception;
  
}
