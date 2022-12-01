package kr.co.purplaying.service;

import kr.co.purplaying.domain.PaymentDto;

public interface PaymentService {
  PaymentDto readPayment(int pay_no) throws Exception;
  int write(PaymentDto paymentDto) throws Exception;
  PaymentDto setPay_no (int pay_no) throws Exception;
}
