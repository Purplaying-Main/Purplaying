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
  public PaymentDto readPayment(int pay_no) throws Exception {
    PaymentDto paymentDto = paymentDao.getPaymentInfo(pay_no);
    return paymentDto;
  }

  @Override
  public int wrtie(PaymentDto paymentDto) throws Exception {
    // TODO Auto-generated method stub
    return paymentDao.insert(paymentDto);
  }

  @Override
  public PaymentDto setPay_no(int pay_no) throws Exception {
    PaymentDto paymentDto = paymentDao.getPaymentReceipt(pay_no);
    return paymentDto;
  }

}
