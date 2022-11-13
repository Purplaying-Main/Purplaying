package kr.co.purplaying.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.ProductMapper.";
  
  @Override
  public ProductDto select(Integer prdt_id) throws Exception{
    return session.selectOne(namespace+"select", prdt_id);
  }

  

}
