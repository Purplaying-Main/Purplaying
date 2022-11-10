package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.purplaying.domain.IndexDto;

@Repository
public class IndexDaoImpl implements IndexDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.indexMapper.";
  
  @Override
  public List<IndexDto> popluarFunding(Map map_p) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"popluarFunding", map_p);
  }

  @Override
  public List<IndexDto> newFunding(Map map_n) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"newFunding", map_n);
  }

  @Override
  public IndexDto select(Integer prdt_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"select", prdt_no);
  }

//  @Override
//  public IndexDto total(Integer prdt_currentTotal) throws Exception {
//    // TODO Auto-generated method stub
//    return session.selectOne(namespace+"total", prdt_currentTotal);
//  }

//  @Override
//  public List<IndexDto> selectIndex(Map map) throws Exception {
//    // TODO Auto-generated method stub
//    return session.selectList(namespace+"selectIndex", map);
//  }

}
