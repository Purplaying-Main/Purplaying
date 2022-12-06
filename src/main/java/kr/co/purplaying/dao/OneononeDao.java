package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.OneononeDto;
import kr.co.purplaying.domain.SearchItem;

public interface OneononeDao{

    OneononeDto select(Integer inquiry_no) throws Exception;
    
 //   OneononeDto selectAns(Integer inquiry_no) throws Exception;
	
	int insert(OneononeDto OneononeDto) throws Exception;
	int count() throws Exception;
//	int deleteAll()throws Exception;
	
	List<OneononeDto> selectPage(Map map) throws Exception;

	int delete(Integer inquiry_no, String writer) throws Exception;

	int update(OneononeDto oneononeDto) throws Exception;
	
//	int searchResultCnt(SearchItem sc) throws Exception;
	    
//	List<OneononeDto> searchSelectPage(SearchItem sc) throws Exception;
	
//	int privateFalse(OneononeDto oneononeDto) throws Exception;
	
	int updateAnsCnt(Integer inquiry_no, Integer inquiry_state) throws Exception;


   
  
}


