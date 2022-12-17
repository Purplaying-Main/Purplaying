package kr.co.purplaying.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.Order;
import kr.co.purplaying.domain.ProjectDto;

@Repository
public class GenreImpl implements GenreDao {
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.genreMapper.";

  @Override
  public List<ProjectDto> genreLiterature(Order order) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"genreLiterature", order);
  }
  @Override
  public List<ProjectDto> genrePoemEssay(Order order) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"genrePoemEssay", order);
  }
  @Override
  public List<ProjectDto> genreWebtoon(Order order) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"genreWebtoon", order);
  }
  

}
