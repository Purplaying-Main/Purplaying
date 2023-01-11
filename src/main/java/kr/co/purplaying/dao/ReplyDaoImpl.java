package kr.co.purplaying.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.ReplyMapper.";
  
  @Override
  public List<ReplyDto> selectReply(int prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"selectReply", prdt_id);
  }
  
  @Override
  public int replyInsert(ReplyDto rDto) throws Exception {
    // TODO Auto-generated method stub
    return session.insert(namespace+"replyInsert", rDto);
  }


}
