package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem2;

public interface HeaderFundingDao {
  List<ProjectDto> popularFunding(Map map) throws Exception;
  List<ProjectDto> newFunding(Map map) throws Exception;
  List<ProjectDto> comingsoonFunding(Map map) throws Exception;
  int getSearchResultCnt(SearchItem2 sc2) throws Exception;
  List<ProjectDto> getSearchResultPage_p(SearchItem2 sc2) throws Exception;
  List<ProjectDto> getSearchResultPage_n(SearchItem2 sc2) throws Exception;
}
