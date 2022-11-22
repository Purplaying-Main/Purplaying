package kr.co.purplaying.dao;

import java.util.List;

import kr.co.purplaying.domain.SearchResultDto;

public interface SearchResultDao {
  
  List<SearchResultDto> getGoodsList(SearchResultDto sr) throws Exception;
  
  int goodsGetTotal(SearchResultDto sr) throws Exception;


}
