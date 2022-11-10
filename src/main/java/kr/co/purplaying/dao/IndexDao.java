package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.IndexDto;

public interface IndexDao {
  IndexDto select(Integer prdt_no) throws Exception;
  List<IndexDto> popluarFunding(Map map_p) throws Exception;
  List<IndexDto> newFunding(Map map_n) throws Exception;
//List<IndexDto> selectIndex(Map map) throws Exception;
//IndexDto total(Integer prdt_currentTotal) throws Exception;
}
