package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.ProductDto;

public interface ProductDao {

  List<ProductDto> product(Map map) throws Exception;

  
  
}
