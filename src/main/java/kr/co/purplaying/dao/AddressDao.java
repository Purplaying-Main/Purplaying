package kr.co.purplaying.dao;

import java.util.List;

import kr.co.purplaying.domain.AddressDto;

public interface AddressDao {

  AddressDto selectAddress(Integer user_no) throws Exception;
  int delete(Integer address_id) throws Exception;
  int update(AddressDto addressDto) throws Exception;
  int insert(AddressDto addressDto) throws Exception;
  List<AddressDto> AddressList(Integer user_no) throws Exception;
}
