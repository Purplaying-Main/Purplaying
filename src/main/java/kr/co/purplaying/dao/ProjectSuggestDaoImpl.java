package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.ProjectSuggestDto;
@Repository
public class ProjectSuggestDaoImpl implements ProjectSuggestDao {
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.projectSuggestMapper.";
  @Override
  public List<ProjectDto> projectSuggest(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"projectSuggest", map);
  }

}
