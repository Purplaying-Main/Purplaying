package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;
import kr.co.purplaying.domain.NewFundingDto;

public interface NewFundingDao {
  List<NewFundingDto> newFunding(Map map) throws Exception;
}
