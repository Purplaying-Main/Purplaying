package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.IndexDto;

public interface IndexDao {
  IndexDto select(Integer prdt_no) throws Exception;
  List<IndexDto> popluarFunding(Map map) throws Exception;
  List<IndexDto> newFunding(Map map) throws Exception;
}
