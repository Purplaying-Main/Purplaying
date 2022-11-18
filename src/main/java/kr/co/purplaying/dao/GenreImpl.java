package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.GenreDto;
import kr.co.purplaying.domain.Order;

@Repository
public class GenreImpl implements GenreDao {
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.genreMapper.";

  @Override
  public List<GenreDto> genreLiterature(Order order) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"genreLiterature", order);
  }
  @Override
  public List<GenreDto> genrePoemEssay(Order order) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"genrePoemEssay", order);
  }
  @Override
  public List<GenreDto> genreWebtoon(Order order) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"genreWebtoon", order);
  }
  

}
