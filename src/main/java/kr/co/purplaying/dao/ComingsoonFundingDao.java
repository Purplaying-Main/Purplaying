package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ComingsoonFundingDto;

public interface ComingsoonFundingDao {
  List<ComingsoonFundingDto> comingsoonFunding(Map map) throws Exception;
}
