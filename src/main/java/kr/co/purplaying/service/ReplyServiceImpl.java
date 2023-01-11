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
  public int replyInsert(ReplyDto rDto) throws Exception {
    // TODO Auto-generated method stub
    return replyDao.replyInsert(rDto);
  }

  @Override
  public List<ReplyDto> getRlist(int prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return replyDao.selectReply(prdt_id);
  }

}
