package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.GenreDto;
import kr.co.purplaying.domain.Order;
public interface GenreDao {
  List<GenreDto> genreLiterature(Order order) throws Exception;
  List<GenreDto> genrePoemEssay(Order order) throws Exception;
  List<GenreDto> genreWebtoon(Order order) throws Exception;
}
