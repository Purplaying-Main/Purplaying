package kr.co.purplaying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.ProductDao;
import kr.co.purplaying.domain.ProductDto;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDao productDao;
	
	@Override
    public ProductDto projectDetail(int prdt_id) throws Exception { 
        return productDao.projectDetail(prdt_id);
	
	}
	
}
