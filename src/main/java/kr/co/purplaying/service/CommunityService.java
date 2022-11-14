package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.CommunityDto;

public interface CommunityService {

  List<CommunityDto> getPage(Map map) throws Exception;
  int write(CommunityDto communityDto) throws Exception;
}
