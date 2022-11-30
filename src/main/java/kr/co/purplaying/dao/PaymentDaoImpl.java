package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.UserDto;

@Repository
public class PaymentDaoImpl implements PaymentDao {
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.PaymentMapper.";
  UserDto userDto;
  ProjectDto projectDto;
  ProjectDao projectDao;
  PaymentDto paymentDto;
  
  @Override
  public List<PaymentDto> select(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"select", map);
  }

  @Override
  public int insert(PaymentDto paymentDto) throws Exception {
    
    return session.insert(namespace+"insert", paymentDto);
  }

  @Override
  public PaymentDto getPaymentInfo(int pay_no) throws Exception {
     
    return session.selectOne(namespace+"getPaymentInfo", pay_no);
  }

  @Override
  public List<PaymentDto> paymentCompleted(Map map) throws Exception {
    return session.selectList(namespace+"paymentCompleted", map);
  }

  @Override
  public PaymentDto getPaymentReceipt(int pay_no) throws Exception {
      
    return session.selectOne(namespace+"getPaymentReceipt", pay_no);
  }


}
