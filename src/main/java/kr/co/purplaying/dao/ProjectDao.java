package kr.co.purplaying.dao;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.domain.UpdateDto;
import kr.co.purplaying.domain.UserDto;

public interface ProjectDao {
  
  ProjectDto select(Integer prdt_id) throws Exception;
  ProjectDto selectRecently(String writer) throws Exception;
  
  List<ProjectDto> selectPage(Map map) throws Exception;

  int insert(String writer) throws Exception;
  int update(ProjectDto projectDto) throws Exception;
  int searchResultCnt(SearchItem sc) throws Exception;
  List<ProjectDto> searchSelectPage(SearchItem sc) throws Exception;
  int count() throws Exception;
  List<ProjectDto> selectAll(Integer prdt_id) throws Exception;
  int delete(Integer prdt_id, String writer) throws Exception;
  ProjectDto projectDetail(Integer prdt_id) throws Exception;
  int insertFile(File uploadPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception;
  ProjectDto getPaymentProjectInfo(Integer prdt_id) throws Exception;
  int insertUpdate(UpdateDto updateDto) throws Exception;
  List<UpdateDto> selectUpdate(Integer prdt_id) throws Exception;
  int plusBuyerCnt(int prdt_id) throws Exception;
  List<UserDto> selectProject() throws Exception;
  int deleteProject(Integer prdt_id) throws Exception;
  

  
}
