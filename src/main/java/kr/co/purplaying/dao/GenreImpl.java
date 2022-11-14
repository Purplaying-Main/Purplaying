package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.GenreDto;

@Repository
public class GenreImpl implements GenreDao {
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.genreMapper.";
  @Override
  public List<GenreDto> genreLiterature(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"genreLiterature", map);
  }
  @Override
  public List<GenreDto> genrePoemEssay(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"genrePoemEssay", map);
  }
  @Override
  public List<GenreDto> genreWebtoon(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"genreWebtoon", map);
  }
  
  

}
