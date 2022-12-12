package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;

public interface PaymentDao {
  List<PaymentDto> select (Map map) throws Exception;
  int insert(PaymentDto paymentDto) throws Exception;
  PaymentDto getPaymentInfo(int pay_no) throws Exception;
  List<PaymentDto> paymentCompleted(Map map) throws Exception;
  PaymentDto getPaymentReceipt(int pay_no) throws Exception;
  List<PaymentDto> pay_no(int user_no,int prdt_it) throws Exception;
  List<PaymentDto> fundingManage(Map map) throws Exception;
}
