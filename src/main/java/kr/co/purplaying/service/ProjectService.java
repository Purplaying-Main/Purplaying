package kr.co.purplaying.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.domain.UpdateDto;
import kr.co.purplaying.domain.UserDto;

public interface ProjectService {
  int getCount() throws Exception;
  List<ProjectDto> getPage(Map map) throws Exception;

  ProjectDto read(Integer prdt_id) throws Exception;
  ProjectDto readRecently(String writer) throws Exception;

  int write(String writer) throws Exception;
  int modify(ProjectDto ProjectDto) throws Exception;

  int getSearchResultCnt(SearchItem sc) throws Exception;
  List<ProjectDto> getSearchResultPage(SearchItem sc) throws Exception;
  List<ProjectDto> getList(Integer prdt_id) throws Exception;
  
  int remove(Integer prdt_id, String writer) throws Exception;
  ProjectDto view(Integer prdt_id) throws Exception;
  
  int insertFile(File uploadPath, String uploadFileName, long uploadFileSize, int prdt_id)  throws Exception;
  ProjectDto readPayment(Integer prdt_id) throws Exception;
  int insertUpdate(UpdateDto updateDto) throws Exception;
  List<UpdateDto> selectUpdate(Integer prdt_id) throws Exception;
  List<ProjectDto> selectProject(SearchItem sc) throws Exception;
  int deleteProject(Integer prdt_id) throws Exception;


  
}
