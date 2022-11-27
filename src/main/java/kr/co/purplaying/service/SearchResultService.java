package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;


public interface SearchResultService {
  
  List<ProjectDto> searchResult(Map map) throws Exception;
  
  List<ProjectDto> getSearchResultPage(SearchItem sc) throws Exception;
  
  int getsearchcount(SearchItem sc) throws Exception;
}
