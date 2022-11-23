package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.OneononeDto;
import kr.co.purplaying.domain.SearchItem;

public interface OneononeService {
	
	List<OneononeDto> getPage(Map map) throws Exception;
	int getCount() throws Exception;
	OneononeDto read(Integer inquiry_no) throws Exception;
	OneononeDto readans(Integer inquiry_no) throws Exception;
	int remove(Integer inquiry_no, String writer) throws Exception;
    int write(OneononeDto oneononeDto) throws Exception;
    int modify(OneononeDto oneononeDto) throws Exception;
    
    int getSearchResultCnt(SearchItem sc) throws Exception;
    List<OneononeDto> getSearchResultPage(SearchItem sc) throws Exception;
    
}