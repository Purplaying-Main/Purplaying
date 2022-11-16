package kr.co.purplaying.dao;

import kr.co.purplaying.domain.ProjectDto;

public interface ProjectDao {
  
  ProjectDto select(Integer product_id) throws Exception;
  ProjectDto selectRecently(String writer) throws Exception;

  int insert(ProjectDto projectDto) throws Exception;
  int update(ProjectDto projectDto) throws Exception;

  
}
