package kr.co.purplaying.service;

import org.springframework.transaction.annotation.Transactional;

import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.UserDto;

public interface PaymentService {
  
  //결제에 따른 DB 업데이트 및 결제 insert
  @Transactional(rollbackFor = Exception.class)
  int payment(ProjectDto projectDto, UserDto userDto, PaymentDto paymentDto) throws Exception;
  
  //결제취소
  @Transactional(rollbackFor = Exception.class)
  int paymentCancel(int pay_no, int pay_total, int prdt_id, int user_no) throws Exception;
}
