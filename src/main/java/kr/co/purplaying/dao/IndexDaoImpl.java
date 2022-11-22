package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.purplaying.domain.ProjectDto;

@Repository
public class IndexDaoImpl implements IndexDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.indexMapper.";
  
  @Override
  public List<ProjectDto> popluarFunding(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"popluarFunding", map);
  }

  @Override
  public List<ProjectDto> newFunding(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"newFunding", map);
  }

  @Override
  public ProjectDto select(Integer prdt_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"select", prdt_no);
  }

}
