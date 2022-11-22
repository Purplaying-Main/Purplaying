package kr.co.purplaying.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.SearchResultDto;

@Repository
public class SearchResultDaoImpl implements SearchResultDao{

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.heart.dao.searchResultMapper.";

  
  @Override
  public List<SearchResultDto> getGoodsList(SearchResultDto sr) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"getGoodsList", sr);
  }
  @Override
  public int goodsGetTotal(SearchResultDto sr) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"goodsGetTotal", sr);
  }
  
  

  }


