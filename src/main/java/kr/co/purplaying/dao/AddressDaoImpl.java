package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.AddressDto;

@Repository
public class AddressDaoImpl implements AddressDao {
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.AddressMapper.";
  
  // 배송지 선택
  @Override
  public AddressDto selectAddress(Integer address_id) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace + "selectAddress", address_id);
  }

  // 배송지 삭제
  @Override
  public int deleteAddress(Integer address_id) throws Exception {
    // TODO Auto-generated method stub
    return session.delete(namespace + "deleteAddress", address_id);
  }

  // 배송지 수정
  @Override
  public int update(AddressDto addressDto) throws Exception {
    // TODO Auto-generated method stub
    return session.update(namespace + "updateAddress", addressDto);
  }
  
  //배송지 추가
  @Override
  public int insert(AddressDto addressDto) throws Exception {
    // TODO Auto-generated method stub
    return session.insert(namespace + "insertAddress", addressDto);
  }

  // 배송지 목록 출력
  @Override
  public List<AddressDto> selectAll(int user_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace + "AddressList", user_no);
  }

  // 기본배송지 갯수 출력
  @Override
  public int countDefaultAddress(int user_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace + "CountDefaultAddress", user_no);
  }

  // 배송지 갯수 출력
  @Override
  public int CntAddress(int user_no) {
    return session.selectOne(namespace + "CountAddress", user_no);
  }

  // 기본 배송지를 일반 배송지로 변경
  @Override
  public int DefaultT2F(int user_no) throws Exception {
    
    return session.update(namespace + "updateDefaultAddress", user_no);
  }

}
