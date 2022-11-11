package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.SearchItem;

public interface BoardDao{

	BoardDto select(Integer inquiry_no) throws Exception;
	
	int insert(BoardDto dto) throws Exception;
	int count() throws Exception;
	int deleteAll()throws Exception;
	
	List<BoardDto> selectPage(Map<String, Integer> map) throws Exception;

	int delete(Integer inquiry_no, String user_id) throws Exception;

	int update(BoardDto boardDto) throws Exception;
	
	int searchResultCnt(SearchItem sc) throws Exception;
	    
	List<BoardDto> searchSelectPage(SearchItem sc) throws Exception;
}


