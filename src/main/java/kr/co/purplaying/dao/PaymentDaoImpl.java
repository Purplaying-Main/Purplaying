package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.PaymentDto;

@Repository
public class PaymentDaoImpl implements PaymentDao {
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.PaymentMapper.";
  
  @Override
  public List<PaymentDto> select(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"select", map);
  }

  @Override
  public int insert(PaymentDto paymentDto) throws Exception {
    // TODO Auto-generated method stub
    return session.insert(namespace+"insert", paymentDto);
  }

  @Override
  public PaymentDto getPaymentInfo(int pay_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"getPaymentInfo", pay_no);
  }

}
