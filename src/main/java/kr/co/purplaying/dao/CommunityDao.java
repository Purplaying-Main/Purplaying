package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.CommunityDto;

public interface CommunityDao {

  CommunityDto select(int user_no) throws Exception;

  List<CommunityDto> selectPage(Map map) throws Exception;

  int insert(CommunityDto communityDto) throws Exception;
  
  int update(CommunityDto communityDto) throws Exception;
}
