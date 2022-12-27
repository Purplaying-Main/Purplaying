package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AddressDto;

public interface AddressDao {

  // 등록된 배송지 선택
  AddressDto selectAddress(Integer address_id) throws Exception;
  // 배송지 삭제
  int deleteAddress(Integer address_id) throws Exception;
  // 배송지 수정
  int update(AddressDto addressDto) throws Exception;
  // 배송지 추가
  int insert(AddressDto addressDto) throws Exception;
  // 배송지 리스트 출력
  List<AddressDto> selectAll(int user_no) throws Exception;
  // 기본 배송지 갯수 출력
  int countDefaultAddress(int user_no) throws Exception;
  // 기본 배송지를 일반 배송지로 변경
  int DefaultT2F(int user_no) throws Exception;
  // 배송지 갯수 출력
  int CntAddress(int user_no);
}
