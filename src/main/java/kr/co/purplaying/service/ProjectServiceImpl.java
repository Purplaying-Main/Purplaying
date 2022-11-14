package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.domain.ProjectDto;

@Service
public class ProjectServiceImpl implements ProjectService{
  
  @Autowired
  ProjectDao projectDao;

  @Override
  public int write(ProjectDto ProjectDto) throws Exception {
    return projectDao.insert(ProjectDto);
  }

}
