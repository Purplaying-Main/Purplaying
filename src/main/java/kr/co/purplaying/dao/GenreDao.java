package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.GenreDto;
import kr.co.purplaying.domain.Sort;
public interface GenreDao {
  List<GenreDto> genreLiterature(Map map) throws Exception;
  List<GenreDto> genrePoemEssay(Map map) throws Exception;
  List<GenreDto> genreWebtoon(Map map) throws Exception;
  
  List<GenreDto> genreLiteratureSort(Sort sort) throws Exception;
}
