package kr.co.purplaying.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.domain.UpdateDto;
import kr.co.purplaying.domain.UserDto;

@Repository
public class ProjectDaoImpl implements ProjectDao {
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.ProjectMapper.";
  
  ProjectDto projectDto;
  
  @Override
  public int insert(ProjectDto projectDto) throws Exception {
    return session.insert(namespace+"insert", projectDto);
  }
  
  @Override
  public int update(ProjectDto projectDto) throws Exception {
    return  session.update(namespace+"update", projectDto);
  }

  @Override
  public ProjectDto select(Integer prdt_id) throws Exception {
    return session.selectOne(namespace+"select",prdt_id);
  }

  @Override
  public ProjectDto selectRecently(String writer) throws Exception {
    return session.selectOne(namespace+"selectRecently",writer);
  }

  @Override
  public int searchResultCnt(SearchItem sc) throws Exception {
    return session.selectOne(namespace+"searchResultCnt", sc);
  }

  @Override
  public List<ProjectDto> searchSelectPage(SearchItem sc) {
    return session.selectOne(namespace+"searchSelectPage", sc);
  }

  @Override
  public int count() throws Exception{
    return session.selectOne(namespace+"count");
  }

  @Override
  public List<ProjectDto> selectPage(Map map) throws Exception {
    return session.selectList(namespace+"selectPage", map);
  }

  @Override
  public List<ProjectDto> selectAll(Integer prdt_id) throws Exception {
    return session.selectList(namespace+"selectAll", prdt_id);
  }

  @Override
  public int delete(Integer prdt_id, String writer) throws Exception {
    Map map = new HashMap();
    map.put("prdt_id", prdt_id);
    map.put("writer", writer);
    return session.delete(namespace+"delete", map);
  }

  @Override
  public ProjectDto projectDetail(Integer prdt_id) throws Exception {
    return session.selectOne(namespace+"projectDetail", prdt_id);
  }

  @Override
  public int insertFile(File uploadPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception {
    Map map = new HashMap();
    map.put("file_location", uploadPath);
    map.put("file_name", uploadFileName);
    map.put("file_size", uploadFileSize);
    map.put("prdt_id", prdt_id);
    
    return session.insert(namespace+"insertFile", map);
  }


  @Override
  public int insertUpdate(UpdateDto updateDto) throws Exception {
    return session.insert(namespace+"insertUpdate",updateDto);
  }

  @Override
  public List<UpdateDto> selectUpdate(Integer prdt_id) throws Exception {
    return session.selectList(namespace+"selectUpdate", prdt_id);
  }
  
  @Override
  public int plusBuyerCnt(int prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return session.update(namespace+"plusBuyerCnt", prdt_id);
  }

  @Override
  public List<ProjectDto> selectProject(SearchItem sc) throws Exception {
    return session.selectList(namespace+"selectProject",sc);
  }
  

  @Override
  public int deleteProject(Integer prdt_id) throws Exception {
    return session.delete(namespace+"deleteProject",prdt_id);
  }
  

  @Override
  public ProjectDto selectProjectlikelist(int prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"selectProjectlikelist",prdt_id);
  }
  
  @Override
  public int plusBuyerPrice(int prdt_id,int pay_total,int prdt_currenttotal) throws Exception {
    Map map = new HashMap();
    map.put("prdt_id", prdt_id);
    map.put("prdt_currenttotal",pay_total );
    map.put("pay_total",prdt_currenttotal );
    return session.update(namespace+"plusBuyerPrice",map);
  }
  
  @Override
  public List<ProjectDto> getListByWriter(String user_id) throws Exception {
    return session.selectList(namespace+"getListByWriter", user_id);
  }

  @Override
  public List<ProjectDto> getSoonListByWriter(String user_id) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"getSoonListByWriter", user_id);
  }

  @Override
  public List<ProjectDto> selectProjectImgforAdmin(SearchItem sc) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"selectProjectImgforAdmin",sc);
  }

  @Override
  public ProjectDto getPaymentProjectInfo(Integer prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"getPaymentProjectInfo", prdt_id);
  }
}
