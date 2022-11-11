package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.ComingsoonFundingDto;

@Repository
public class ComingsoonFundingDaoImpl implements ComingsoonFundingDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.comingsoonFundingMapper.";
  
  @Override
  public List<ComingsoonFundingDto> comingsoonFunding(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"comingsoonFunding", map);
  }

}
