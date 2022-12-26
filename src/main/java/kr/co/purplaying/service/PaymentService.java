package kr.co.purplaying.service;

import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.UserDto;

public interface PaymentService {
  
  //결제에 따른 DB 업데이트 및 결제 insert
  int payment(ProjectDto projectDto, UserDto userDto, PaymentDto paymentDto) throws Exception;
  
}
