package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem2;

public interface SearchResultDao {
  
  List<ProjectDto> searchResult(Map map) throws Exception;
  
  List<ProjectDto> searchSelectPage(SearchItem2 sc2) throws Exception;

  int searchcount(SearchItem2 sc2) throws Exception;
  

}
