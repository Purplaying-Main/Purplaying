package kr.co.purplaying.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.LikeDao;
import kr.co.purplaying.domain.LikeDto;

@Service
public class LikeServiceImpl implements LikeService {
  
  @Autowired
  LikeDao likeDao;

  @Override
  public int insertLike(LikeDto likeDto) throws Exception {
    return likeDao.insertLike(likeDto);
  }

  @Override
  public int deleteLike(LikeDto likeDto) throws Exception {
    return likeDao.deleteLike(likeDto);
  }

  @Override
  public List<Integer> selectLikelist(String user_id) throws Exception {
    // TODO Auto-generated method stub
    return likeDao.selectLikelist(user_id);
  }

  @Override
  public List<LikeDto> selectByUserId(String user_id) throws Exception {
    // TODO Auto-generated method stub
    return likeDao.selectByUserId(user_id);
  }

}
