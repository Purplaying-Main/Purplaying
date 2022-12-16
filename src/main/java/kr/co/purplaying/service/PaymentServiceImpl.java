package kr.co.purplaying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.domain.PaymentDto;
@Service
public class PaymentServiceImpl implements PaymentService {
  
  @Autowired
  PaymentDao paymentDao;


  @Override
  public int write(PaymentDto paymentDto) throws Exception {
    // TODO Auto-generated method stub
    return paymentDao.insert(paymentDto);
  }

}
