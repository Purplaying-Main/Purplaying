package kr.co.purplaying.service;

import kr.co.purplaying.domain.ProjectDto;

public interface ProjectService {
  int write(ProjectDto ProjectDto) throws Exception;
}
