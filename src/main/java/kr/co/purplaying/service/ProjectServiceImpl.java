package kr.co.purplaying.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.domain.UpdateDto;
import kr.co.purplaying.domain.UserDto;

@Service
public class ProjectServiceImpl implements ProjectService{
  
  @Autowired
  ProjectDao projectDao;
  
  @Override
  public int getCount() throws Exception {
    return projectDao.count();
  }

  @Override
  public int write(String writer) throws Exception {
    return projectDao.insert(writer);
  }

  @Override
  @Transactional
  public int modify(ProjectDto projectDto) throws Exception {
    return projectDao.update(projectDto);
  }

  @Override
  public ProjectDto read(Integer prdt_id) throws Exception {
    ProjectDto projectDto = projectDao.select(prdt_id);
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
  public List<ProjectDto> getList(Integer prdt_id) throws Exception {
    return projectDao.selectAll(prdt_id);
  }

  @Override
  public int remove(Integer prdt_id, String writer) throws Exception {
    return projectDao.delete(prdt_id, writer);
  }

  @Override
  public ProjectDto view(Integer prdt_id) throws Exception {
    return projectDao.projectDetail(prdt_id);
  }

  @Override
  public int insertFile(File uploadPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception {
    return projectDao.insertFile(uploadPath, uploadFileName, uploadFileSize, prdt_id);
  }

  @Override
  public ProjectDto readPayment(Integer prdt_id) throws Exception {
    ProjectDto projectDto = projectDao.getPaymentProjectInfo(prdt_id);
    return projectDto;
  }

  @Override
  public int insertUpdate(UpdateDto updateDto) throws Exception {
    return projectDao.insertUpdate(updateDto);
  }

  @Override
  public List<UpdateDto> selectUpdate(Integer prdt_id) throws Exception {
    return projectDao.selectUpdate(prdt_id);
  }

  @Override
  public List<ProjectDto> selectProject(SearchItem sc) throws Exception {
    return projectDao.selectProject(sc);
  }

  @Override
  public int deleteProject(Integer prdt_id) throws Exception {
    return projectDao.deleteProject(prdt_id);
  }

  @Override
  public ProjectDto selectProjectlikelist(int prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return projectDao.selectProjectlikelist(prdt_id);
  }
}
