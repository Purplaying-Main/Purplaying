package kr.co.purplaying.dao;

import kr.co.purplaying.domain.ProductDto;

public interface ProductDao {

  ProductDto select(Integer prdt_id) throws Exception;

  
  
}
