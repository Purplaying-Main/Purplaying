package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AddressDto;

public interface AddressDao {

  AddressDto selectAddress(Integer address_id) throws Exception;
  int delete(Integer address_id) throws Exception;
  int update(AddressDto addressDto) throws Exception;
  int insert(AddressDto addressDto) throws Exception;
  List<AddressDto> selectAll(int user_no) throws Exception;
}
