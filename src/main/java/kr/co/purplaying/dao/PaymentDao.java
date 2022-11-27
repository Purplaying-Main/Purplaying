package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.PaymentDto;

public interface PaymentDao {
  List<PaymentDto> select (Map map) throws Exception;
  int insert(PaymentDto paymentDto) throws Exception;
  PaymentDto getPaymentInfo(int pay_no) throws Exception;
  List<PaymentDto> paymentCompleted(Map map) throws Exception;
}