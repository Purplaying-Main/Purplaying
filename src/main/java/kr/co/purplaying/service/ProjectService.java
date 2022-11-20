package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;

public interface ProjectService {
  int getCount() throws Exception;
  List<ProjectDto> getPage(Map map) throws Exception;

  ProjectDto read(Integer prdt_id) throws Exception;
  ProjectDto readRecently(String writer) throws Exception;

  int write(ProjectDto ProjectDto) throws Exception;
  int modify(ProjectDto ProjectDto) throws Exception;

  int getSearchResultCnt(SearchItem sc) throws Exception;
  List<ProjectDto> getSearchResultPage(SearchItem sc) throws Exception;
  List<ProjectDto> getList(Integer prdt_id) throws Exception;
  
  int remove(Integer prdt_id, String writer) throws Exception;
  ProjectDto view(Integer prdt_id) throws Exception;


  
}