package kr.co.purplaying.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnsDaoimpl implements AnsDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.ansMapper.";
  
  
  
}
