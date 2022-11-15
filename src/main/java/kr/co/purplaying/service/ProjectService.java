package kr.co.purplaying.service;

import kr.co.purplaying.domain.ProjectDto;

public interface ProjectService {
  
  ProjectDto read(Integer product_id) throws Exception;

  int write(ProjectDto ProjectDto) throws Exception;
  int modify(ProjectDto ProjectDto) throws Exception;

}
