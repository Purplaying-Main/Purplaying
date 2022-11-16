package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.CommunityDto;

public interface CommunityDao {

  List<CommunityDto> selectAll(Integer prdt_id) throws Exception;
}
