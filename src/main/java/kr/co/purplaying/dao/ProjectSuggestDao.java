package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ProjectSuggestDto;


public interface ProjectSuggestDao {
  List<ProjectSuggestDto> projectSuggest(Map map) throws Exception;
}
