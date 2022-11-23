package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;

public interface ProjectDao {
  
  ProjectDto select(Integer prdt_id) throws Exception;
  ProjectDto selectRecently(String writer) throws Exception;
  
  List<ProjectDto> selectPage(Map map) throws Exception;

  int insert(ProjectDto projectDto) throws Exception;
  int update(ProjectDto projectDto) throws Exception;
  int searchResultCnt(SearchItem sc) throws Exception;
  List<ProjectDto> searchSelectPage(SearchItem sc) throws Exception;
  int count()throws Exception;
  List<ProjectDto> selectAll(Integer prdt_id) throws Exception;
  int delete(Integer prdt_id, String writer) throws Exception;
  ProjectDto projectDetail(Integer prdt_id) throws Exception;
  int insertFile(String uploadFolder, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception;
  

  
}
