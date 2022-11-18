package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.SearchResultDto;

public interface SearchResultDao {

  
  List<SearchResultDto> searchResult(Map map) throws Exception;
  

}
