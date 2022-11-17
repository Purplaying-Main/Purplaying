package kr.co.purplaying.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AgreementDaoImpl implements AgreementDao{
  
  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.UserMapper.";

}
