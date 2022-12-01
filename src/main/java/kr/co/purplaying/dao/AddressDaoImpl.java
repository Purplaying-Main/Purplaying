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
  
  @Override                     // address_id로 출력 확인후 변경
  public AddressDto selectAddress(Integer address_id) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace + "selectAddress", address_id);
  }

  @Override
  public int deleteAddress(Integer address_id) throws Exception {
    // TODO Auto-generated method stub
    return session.delete(namespace + "deleteAddress", address_id);
  }

  @Override
  public int update(AddressDto addressDto) throws Exception {
    // TODO Auto-generated method stub
    return session.update(namespace + "updateAddress", addressDto);
  }

  @Override
  public int insert(AddressDto addressDto) throws Exception {
    // TODO Auto-generated method stub
    return session.insert(namespace + "insertAddress", addressDto);
  }

  @Override
  public List<AddressDto> selectAll(int user_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace + "AddressList", user_no);
  }

}
