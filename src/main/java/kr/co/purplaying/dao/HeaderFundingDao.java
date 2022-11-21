package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;
import kr.co.purplaying.domain.HeaderFundingDto;

public interface HeaderFundingDao {
  List<HeaderFundingDto> popularFunding(Map map) throws Exception;
  List<HeaderFundingDto> newFunding(Map map) throws Exception;
  List<HeaderFundingDto> comingsoonFunding(Map map) throws Exception;
}
