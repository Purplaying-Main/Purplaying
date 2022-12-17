package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.PaymentDto;

public interface PaymentDao {
  List<PaymentDto> select (Map map) throws Exception;
  int insert(PaymentDto paymentDto) throws Exception;
  List<PaymentDto> paymentCompleted(Map map) throws Exception;
  List<PaymentDto> userFunding(int user_no) throws Exception;
  List<PaymentDto> paynoinfo(int pay_no) throws Exception;
  List<PaymentDto> paynoreinfo(Map pay_no) throws Exception;
  List<PaymentDto>  fundingManageForChart(Map map) throws Exception;
  List<PaymentDto> fundingManageForWeek(Map map) throws Exception;
  List<PaymentDto> fundingManage(Map map) throws Exception;
}
