package kr.co.purplaying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.ProductDao;
import kr.co.purplaying.domain.ProductDto;

@Service
public class ProductServiceImpl implements ProductService {
	
  @Autowired
  ProductDao productDao;
    
  
  @Override
  public ProductDto read(Integer prdt_id) throws Exception{
    ProductDto productDto = productDao.select(prdt_id);
    //비즈니스 로직 추가
    return productDto;
  }

  
}
