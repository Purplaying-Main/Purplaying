package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ProjectDto;

public interface HeaderFundingDao {
  List<ProjectDto> popularFunding(Map map) throws Exception;
  List<ProjectDto> newFunding(Map map) throws Exception;
  List<ProjectDto> comingsoonFunding(Map map) throws Exception;
}
