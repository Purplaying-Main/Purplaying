package kr.co.purplaying.service;

import java.util.List;

import kr.co.purplaying.domain.SearchResultDto;


public interface SearchResultService {

    List<SearchResultDto> getGoodsList(SearchResultDto sr) throws Exception;
  
 
    int goodsGetTotal(SearchResultDto sr) throws Exception;
}
