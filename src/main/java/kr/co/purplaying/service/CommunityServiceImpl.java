package kr.co.purplaying.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.BoardDao;
import kr.co.purplaying.dao.CommunityDao;
import kr.co.purplaying.domain.CommunityDto;

@Service
public class CommunityServiceImpl implements CommunityService {

  CommunityDao communityDao;
  BoardDao boardDao;

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
  public List<CommunityDto> selectCommunity(Integer prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return communityDao.selectCommunity(prdt_id);
  }

}
