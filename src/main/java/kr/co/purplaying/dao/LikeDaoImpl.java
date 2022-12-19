package kr.co.purplaying.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.LikeDto;

@Repository
public class LikeDaoImpl implements LikeDao{
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.LikeMapper.";

  @Override
  public int insertLike(LikeDto likeDto) throws Exception {
    return session.insert(namespace+"insertLike",likeDto);
  }

  @Override
  public int deleteLike(LikeDto likeDto) throws Exception {
    return session.delete(namespace+"deleteLike",likeDto);
  }

  @Override
  public List<Integer> selectLikelist(String user_id) throws Exception {
    return session.selectList(namespace+"selectLikelist",user_id);
  }

  @Override
  public List<LikeDto> selectByUserId(String user_id) throws Exception {
    return session.selectList(namespace+"selectByUserId",user_id);
  }

  @Override
  public LikeDto selectByRecently(String user_id) throws Exception {
    return session.selectOne(namespace+"selectByRecently",user_id);
  }

}
