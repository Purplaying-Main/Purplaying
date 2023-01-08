package kr.co.purplaying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.UserDto;

@Service
public class PaymentServiceImpl implements PaymentService {
  
  @Autowired
  PaymentDao paymentDao;
  
  @Autowired
  ProjectDao projectDao;

  @Autowired
  UserDao userDao;

  @Override
  public int payment(ProjectDto projectDto, UserDto userDto, PaymentDto paymentDto)
      throws Exception {
    //후원자수 증가
    projectDao.plusBuyerCnt(projectDto.getPrdt_id());
    //후원금액 증가
    projectDao.plusBuyerPrice(projectDto.getPrdt_id(),paymentDto.getPay_total(), projectDto.getPrdt_currenttotal());
    //유저포인트 감소
    userDao.updatePoint(userDto.getUser_no(),userDto.getUser_point()-paymentDto.getPay_total());
    return paymentDao.insert(paymentDto);//결제insert
  }

  @Override
  public int paymentCancel(int pay_no, int pay_total, int prdt_id, int user_no)
      throws Exception {
    //유저포인트 증가
    userDao.refundPoint(user_no, pay_total);
    //후원자수,후원금액 감소
    projectDao.updateProject(prdt_id, pay_total);
    return paymentDao.fundingCancel(pay_no);
  }

}
