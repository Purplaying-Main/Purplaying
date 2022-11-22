package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.ProjectSuggestDto;


public interface ProjectSuggestDao {
  List<ProjectDto> projectSuggest(Map map) throws Exception;
}
