package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;


import kr.co.purplaying.domain.Order;
import kr.co.purplaying.domain.ProjectDto;
public interface GenreDao {
  List<ProjectDto> genreLiterature(Order order) throws Exception;
  List<ProjectDto> genrePoemEssay(Order order) throws Exception;
  List<ProjectDto> genreWebtoon(Order order) throws Exception;
}
