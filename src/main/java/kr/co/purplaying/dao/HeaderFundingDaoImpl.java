package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem2;

@Repository
public class HeaderFundingDaoImpl implements HeaderFundingDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.headerFundingMapper.";
  
  @Override
  public List<ProjectDto> popularFunding(Map map) throws Exception {
    return session.selectList(namespace+"popularFunding", map);
  }
  
  @Override
  public List<ProjectDto> newFunding(Map map) throws Exception {
    return session.selectList(namespace+"newFunding", map);
  }
  
  @Override
  public List<ProjectDto> comingsoonFunding(Map map) throws Exception {
    return session.selectList(namespace+"comingsoonFunding", map);
  }

  @Override
  public int getSearchResultCnt(SearchItem2 sc2) throws Exception {
    return session.selectOne(namespace+"searchResultCnt", sc2);
  }

  @Override
  public List<ProjectDto> getSearchResultPage_p(SearchItem2 sc2) throws Exception {
    return session.selectList(namespace+"searchSelectPage_p", sc2);
  }
  
  @Override
  public List<ProjectDto> getSearchResultPage_n(SearchItem2 sc2) throws Exception {
    return session.selectList(namespace+"searchSelectPage_n", sc2);
  }
  
  


}
