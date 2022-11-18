package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;

@Service
public class ProjectServiceImpl implements ProjectService{
  
  @Autowired
  ProjectDao projectDao;
  
  @Override
  public int getCount() throws Exception {
    return projectDao.count();
  }

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

  @Override
  public ProjectDto readRecently(String writer) throws Exception {
    return projectDao.selectRecently(writer);
  }

  @Override
  public int getSearchResultCnt(SearchItem sc) throws Exception {
    return projectDao.searchResultCnt(sc);
  }

  @Override
  public List<ProjectDto> getSearchResultPage(SearchItem sc) throws Exception {
    return projectDao.searchSelectPage(sc);
  }

  @Override
  public List<ProjectDto> getPage(Map map) throws Exception {
    // TODO Auto-generated method stub
    return projectDao.selectPage(map);
  }

  @Override
  public List<ProjectDto> getList(Integer product_id) throws Exception {
    return projectDao.selectAll(product_id);
  }


}
