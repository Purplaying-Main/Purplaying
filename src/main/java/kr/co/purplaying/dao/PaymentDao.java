package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.PaymentDto;

public interface PaymentDao {
  List<PaymentDto> select (Map map) throws Exception;
  
  //결제 insert
  int insert(PaymentDto paymentDto) throws Exception;
  
  //결제완료 페이지 고유조건에 해당하는 결제정보 select
  List<PaymentDto> paymentCompleted(Map map) throws Exception;
  
  //마이페이지 후원 중인 펀딩 select
  List<PaymentDto> userFunding(int user_no) throws Exception;
  
  //마이페이지-결제내역상세보기에서 결제정보,리워드배열 select
  List<PaymentDto> paynoinfo(int pay_no) throws Exception;  
  List<PaymentDto> paynoreinfo(Map pay_no) throws Exception;
  
  //펀딩 관리 페이지 select(테이블,차트)
  List<PaymentDto>  fundingManageForChart(Map map) throws Exception;
  List<PaymentDto> fundingManageForWeek(Map map) throws Exception;
  
  //CSV 파일 추출을 위해 결제 내역 select
  List<PaymentDto> fundingManage(Map map) throws Exception;
  
  //결제취소 delete
  int fundingCancel(int pay_no) throws Exception;
  
  //결제 이력 조회
  PaymentDto alreadyBuy(int prdt_id,int user_no) throws Exception;
}
