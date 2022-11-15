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
  public int write(ProjectDto projectDto) throws Exception {
    return projectDao.insert(projectDto);
  }

  @Override
  public int modify(ProjectDto projectDto) throws Exception {
    return projectDao.update(projectDto);
  }

  @Override
  public ProjectDto read(Integer product_id) throws Exception {
    ProjectDto projectDto = projectDao.select(product_id);
    //조회수 증가
    return projectDto;
  }

}
