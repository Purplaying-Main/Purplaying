package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.PopularFundingDto;

public interface PopularFundingDao {
  List<PopularFundingDto> popularFunding(Map map) throws Exception;
}
