package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;
import kr.co.purplaying.domain.ProjectDto;

public interface IndexDao {
  ProjectDto select(Integer prdt_no) throws Exception;
  List<ProjectDto> popluarFunding(Map map) throws Exception;
  List<ProjectDto> newFunding(Map map) throws Exception;
}
