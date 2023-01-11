package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;

public interface IndexDao {
  ProjectDto select(Integer prdt_no) throws Exception;
  List<ProjectDto> popluarFunding(Map map) throws Exception;
  List<ProjectDto> newFunding(Map map) throws Exception;
  int getCount() throws Exception;
  int getSearchResultCnt(SearchItem sc) throws Exception;
}
