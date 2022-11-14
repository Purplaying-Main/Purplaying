package kr.co.purplaying.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.purplaying.dao.ProductDao;
import kr.co.purplaying.domain.ProductDto;

@Controller
public class ProductController {

  
  
	@Autowired
	ProductDao productDao;
	
	@RequestMapping("/projectdetail")
	@GetMapping("/projectdetail")
	public String getPage(Model m, ProductDto productdto) {
	  
	  try {
	    
	    Map map = new HashMap();
	      List<ProductDto> list_p = productDao.product(map);
	      m.addAttribute("list_p",list_p);
	}  catch(Exception e) {
	  e.printStackTrace();
	}
	  return "projectdetail";
	  

    }
}























