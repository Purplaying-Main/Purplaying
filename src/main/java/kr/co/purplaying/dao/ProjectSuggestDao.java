package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ProjectDto;

public interface ProjectSuggestDao {
  List<ProjectDto> projectSuggest(Map map) throws Exception;
}
