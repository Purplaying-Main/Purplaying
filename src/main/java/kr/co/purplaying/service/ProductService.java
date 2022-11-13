package kr.co.purplaying.service;

import kr.co.purplaying.domain.ProductDto;

public interface ProductService {

  ProductDto read(Integer prdt_id) throws Exception;

  
}
