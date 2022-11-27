package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.domain.SearchResultDto;

public interface SearchResultDao {
  
  List<ProjectDto> searchResult(Map map) throws Exception;
  
  List<ProjectDto> searchSelectPage(SearchItem sc) throws Exception;

  int searchcount(SearchItem sc) throws Exception;
}
