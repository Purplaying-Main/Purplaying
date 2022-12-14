package kr.co.purplaying.dao;

import java.util.HashMap;
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
  public List<PaymentDto> paymentCompleted(Map map) throws Exception {
    return session.selectList(namespace+"paymentCompleted", map);
  }


  @Override
  public List<PaymentDto> fundingManage(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"fundingManage", map);
  }

  @Override
  public List<PaymentDto> fundingManageForWeek(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"fundingManageForWeek", map);
  }

  @Override
  public List<PaymentDto> fundingManageForChart(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"fundingManageForChart", map);
  }

  @Override
  public List<PaymentDto> userFunding(int user_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"userFunding", user_no);
  }

  @Override
  public List<PaymentDto> paynoreinfo(Map pay_no) throws Exception {

    return session.selectList(namespace+"paynoreinfo", pay_no);
  }

  @Override
  public List<PaymentDto> paynoinfo(int pay_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"paynoinfo", pay_no);
  }

  @Override
  public int fundingCancel(int pay_no) throws Exception {
    // TODO Auto-generated method stub
    return session.delete(namespace+"fundingCancel", pay_no);
  }

  @Override
  public PaymentDto alreadyBuy(int prdt_id, int user_no) throws Exception {
    Map map = new HashMap();
    map.put("prdt_id", prdt_id);
    map.put("user_no", user_no);
    return session.selectOne(namespace+"alreadyBuy", map);
  }

}
