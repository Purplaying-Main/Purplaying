package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem2;

@Repository
public class SearchResultDaoImpl implements SearchResultDao{

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.searchResultMapper.";
  
  
  @Override
  public List<ProjectDto> searchResult(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"searchResult", map);
  }
  @Override
  public List<ProjectDto> searchSelectPage(SearchItem2 sc2) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"searchSelectPage", sc2);
  }
  
  @Override
  public int searchcount(SearchItem2 sc2) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"searchcount", sc2);
  }

  

  
  

  }


