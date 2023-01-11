package kr.co.purplaying.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.BoardDao;
import kr.co.purplaying.dao.CommunityDao;
import kr.co.purplaying.dao.ReplyDao;
import kr.co.purplaying.domain.CommunityDto;
import kr.co.purplaying.domain.ReplyDto;

@Service
public class CommunityServiceImpl implements CommunityService {

  CommunityDao communityDao;
  BoardDao boardDao;
  ReplyDao replyDao;

  @Autowired
  public CommunityServiceImpl(CommunityDao communityDao, BoardDao boardDao) {
    // super();
    this.communityDao = communityDao;
    this.boardDao = boardDao;
  }

  @Override
  public List<CommunityDto> getList(int prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return communityDao.selectAll(prdt_id);
  }

  @Override
  public int insertChat(CommunityDto communityDto) throws Exception {
    // TODO Auto-generated method stub
    return communityDao.insertChat(communityDto);
  }

  @Override
  public int modify(CommunityDto communityDto) throws Exception {
    // TODO Auto-generated method stub
    return communityDao.update(communityDto);
  }

  @Override
  public int remove(int chat_no) throws Exception {
    // TODO Auto-generated method stub
    return communityDao.delete(chat_no);
  }

  @Override
  public int replyInsert(ReplyDto rDto) throws Exception {
    // TODO Auto-generated method stub
    return replyDao.replyInsert(rDto);
  }

  @Override
  public List<ReplyDto> getRlist(int prdt_id) throws Exception {
    
    return replyDao.selectReply(prdt_id);
  }

}
