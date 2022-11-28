package kr.co.purplaying.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.purplaying.domain.AttachFileDto;

@Repository
public class AttachFileDaoImpl implements AttachFileDao {
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.FileMapper.";
  
  @Override
  public AttachFileDto selectFile(Integer prdt_id) throws Exception {
    return session.selectOne(namespace+"selectFile", prdt_id);
  }
  
  @Override
  public int insertFile(String uploadFolderPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception {
    Map map = new HashMap();
    map.put("file_location", uploadFolderPath);
    map.put("file_name", uploadFileName);
    map.put("file_size", uploadFileSize);
    map.put("prdt_id", prdt_id);
    
    return session.insert(namespace+"insertFile", map);
  }

  @Override
  public List<AttachFileDto> selectFileList(Map map) throws Exception {
    return session.selectList(namespace+"selectFileList", map);
  }
  
  @Override
  public int insertUserProfile(String uploadFolderPath, String uploadFileName, long uploadFileSize, int user_no) throws Exception {
    Map map = new HashMap();
    map.put("file_location", uploadFolderPath);
    map.put("file_name", uploadFileName);
    map.put("file_size", uploadFileSize);
    map.put("user_no", user_no);
    
    return session.insert(namespace+"insertUserProfile", map);
  }
  
}
