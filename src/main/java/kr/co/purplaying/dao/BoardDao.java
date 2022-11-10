package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.BoardDto;

public interface BoardDao{

	BoardDto select(Integer bno) throws Exception;
	
	int insert(BoardDto dto) throws Exception;
	int count() throws Exception;
	int deleteAll()throws Exception;
	
	List<BoardDto> selectPage(Map<String, Integer> map) throws Exception;

	int increaseViewCnt(int bno) throws Exception;

	int delete(Integer bno, String writer) throws Exception;

	int update(BoardDto boardDto) throws Exception;
}


