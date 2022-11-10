package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.NoticeDto;

public interface NoticeDao{

	NoticeDto select(Integer notice_id) throws Exception;
	
	int insert(NoticeDto dto) throws Exception;
	int count() throws Exception;
	int deleteAll()throws Exception;
	
	List<NoticeDto> selectPage(Map map) throws Exception;

	int increaseViewCnt(int notice_id) throws Exception;
}


