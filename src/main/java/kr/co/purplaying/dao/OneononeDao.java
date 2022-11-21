package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.OneononeDto;
import kr.co.purplaying.domain.SearchItem;

public interface OneononeDao{

  OneononeDto select(Integer inquiry_no) throws Exception;
	
	int insert(OneononeDto dto) throws Exception;
	int count() throws Exception;
	int deleteAll()throws Exception;
	
	List<OneononeDto> selectPage(Map<String, Integer> map) throws Exception;

	int delete(Integer inquiry_no, String user_id) throws Exception;

	int update(OneononeDto oneononeDto) throws Exception;
	
	int searchResultCnt(SearchItem sc) throws Exception;
	    
	List<OneononeDto> searchSelectPage(SearchItem sc) throws Exception;
}


