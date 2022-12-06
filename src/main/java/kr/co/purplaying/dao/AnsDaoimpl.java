package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.AnsDto;

@Repository
public class AnsDaoimpl implements AnsDao {
  
  @Autowired
  private SqlSession session;
  private static String namespace ="kr.co.purplaying.dao.AnsMapper.";
  
/*  
  
  @Override
  public int deleteAll(Integer inquiry_no) throws Exception {
    // TODO Auto-generated method stub
    return session.delete(namespace + "deleteAll", inquiry_no);
  }
  
  @Override
  public List<AnsDto> selectAll(Integer inquiry_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace + "selectAll", inquiry_no);
  }

  @Override
  public int insert(AnsDto ansDto) throws Exception {
    // TODO Auto-generated method stub
    return session.insert(namespace + "insert", ansDto);
  }
  @Override
  public int update(AnsDto ansDto) throws Exception {
    // TODO Auto-generated method stub
    return session.update(namespace + "update", ansDto);
  }
  @Override
  public List<AnsDto> selectPage(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"selectPage", map);
  }
  
  @Override
  public AnsDto select(Integer inquiry_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"select",inquiry_no);
  }
  
    
*/
  @Override
  public AnsDto selectAnsData(Integer inquiry_no) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"selectAnsData",inquiry_no);
  }
 
   
  @Override
  public int insertAns(AnsDto ansDto) throws Exception {
    // TODO Auto-generated method stub
    return session.insert(namespace +"insertAns", ansDto);
  }

  @Override
  public int deleteAns(Integer ans_no, String admin_id) throws Exception {
    Map map = new HashMap();
    map.put("ans_no", ans_no);
    map.put("admin_id", admin_id);
    System.out.println(ans_no+admin_id+map);
    return session.delete(namespace +"deleteAns", map);
  }
  
  @Override
  public int modifyAns(AnsDto ansDto) throws Exception {
    // TODO Auto-generated method stub
    return session.update(namespace + "modifyAns", ansDto);
  }
  
}
