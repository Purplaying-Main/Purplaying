package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AddressDto;

public interface AddressDao {

  Map<String, Object> selectAddress(String user_id) throws Exception;
  int delete(Integer address_id) throws Exception;
  int update(AddressDto addressDto) throws Exception;
  int insert(AddressDto addressDto) throws Exception;
  List<Map<String, Object>> AddressList(Integer user_no) throws Exception;
}
