package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.SearchItem;

public interface BoardService {
	
	List<BoardDto> getPage(Map map) throws Exception;
	int getCount() throws Exception;
	BoardDto read(int inquiry_no) throws Exception;
	int remove(Integer inquiry_no, String user_id) throws Exception;
    int write(BoardDto boardDto) throws Exception;
    int modify(BoardDto boardDto) throws Exception;
    
    int getSearchResultCnt(SearchItem sc) throws Exception;
    List<BoardDto> getSearchResultPage(SearchItem sc) throws Exception;
    
}
