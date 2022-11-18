package kr.co.purplaying.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.purplaying.dao.ProductDetailDao;
import kr.co.purplaying.domain.ProductDetailDto;

@Controller
public class ProductController {

	@Autowired
	ProductDetailDao productDetailDao;
	
	@RequestMapping("/projectDetail")
	@GetMapping("/projectDetail")
	public String getDetail(int prdt_id, Model m) {

      try {
        System.out.println(prdt_id);     
        ProductDetailDto productDetailDto = productDetailDao.projectDetail(prdt_id);
        m.addAttribute(productDetailDto);
        
        
      } catch (Exception e) {
          e.printStackTrace();
      }
      return "/projectDetail";
      
	}
}























