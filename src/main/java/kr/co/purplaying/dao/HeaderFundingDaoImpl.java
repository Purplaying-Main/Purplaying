package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.purplaying.domain.HeaderFundingDto;

@Repository
public class HeaderFundingDaoImpl implements HeaderFundingDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.headerFundingMapper.";
  
  @Override
  public List<HeaderFundingDto> popularFunding(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"popularFunding", map);
  }
  
  @Override
  public List<HeaderFundingDto> newFunding(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"newFunding", map);
  }
  
  @Override
  public List<HeaderFundingDto> comingsoonFunding(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"comingsoonFunding", map);
  }
  
  


}
