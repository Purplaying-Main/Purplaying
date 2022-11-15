package kr.co.purplaying.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.ProjectDto;

@Repository
public class ProjectDaoImpl implements ProjectDao {
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.ProjectMapper.";
  
  @Override
  public int insert(ProjectDto projectDto) {
    return session.insert(namespace+"insert", projectDto);
  }

}
