package kr.co.purplaying.service;

import kr.co.purplaying.domain.PaymentDto;

public interface PaymentService {

  int write(PaymentDto paymentDto) throws Exception;

}
