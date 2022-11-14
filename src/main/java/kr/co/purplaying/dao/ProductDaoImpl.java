package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

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
  public List<ProductDto> product(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"product", map);
    
  }
  

  
  }

  

