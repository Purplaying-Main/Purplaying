package kr.co.purplaying.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.ReplyDao;
import kr.co.purplaying.domain.ReplyDto;

@Service
public class ReplyServiceImpl implements ReplyService {

  @Autowired
  ReplyDao replyDao;

  @Override
  public List<ReplyDto> getList(int prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return replyDao.selectAll(prdt_id);
  }

  @Override
  public int insertRply(ReplyDto replyDto) throws Exception {
    // TODO Auto-generated method stub
    return replyDao.insertRply(replyDto);
  }

}