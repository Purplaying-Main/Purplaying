package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;

@Repository
public class ProjectDaoImpl implements ProjectDao {
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.ProjectMapper.";
  
  @Override
  public int insert(ProjectDto projectDto) throws Exception {
    return session.insert(namespace+"insert", projectDto);
  }
  
  @Override
  public int update(ProjectDto projectDto) throws Exception {
    return  session.update(namespace+"update", projectDto);
  }

  @Override
  public ProjectDto select(Integer prdt_id) throws Exception {
    return session.selectOne(namespace+"select",prdt_id);
  }

  @Override
  public ProjectDto selectRecently(String writer) throws Exception {
    return session.selectOne(namespace+"selectRecently",writer);
  }

  @Override
  public int searchResultCnt(SearchItem sc) throws Exception {
    return session.selectOne(namespace+"searchResultCnt", sc);
  }

  @Override
  public List<ProjectDto> searchSelectPage(SearchItem sc) {
    return session.selectOne(namespace+"searchSelectPage", sc);
  }

  @Override
  public int count() throws Exception{
    return session.selectOne(namespace+"count");
  }

  @Override
  public List<ProjectDto> selectPage(Map map) throws Exception {
    return session.selectList(namespace+"selectPage", map);
  }

  @Override
  public List<ProjectDto> selectAll(Integer prdt_id) throws Exception {
    return session.selectList(namespace+"selectAll", prdt_id);
  }

  @Override
  public int delete(Integer prdt_id, String writer) throws Exception {
    Map map = new HashMap();
    map.put("prdt_id", prdt_id);
    map.put("writer", writer);
    return session.delete(namespace+"delete", map);
  }

  @Override
  public ProjectDto projectDetail(Integer prdt_id) throws Exception {
    return session.selectOne(namespace+"projectDetail", prdt_id);
  }

}
