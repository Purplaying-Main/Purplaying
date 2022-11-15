package kr.co.purplaying.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.purplaying.dao.ProductDao;
import kr.co.purplaying.domain.ProductDto;

@Controller
public class ProductController {

	@Autowired
	ProductDao productDao;
	
	@RequestMapping("/projectDetailPage")
	@GetMapping("/projectDetailPage")
	public String getDetail(int prdt_id, Model m) {

      try {
        System.out.println(prdt_id);     
        ProductDto productDto = productDao.projectDetail(prdt_id);
        m.addAttribute(productDto);
        
        
      } catch (Exception e) {
          e.printStackTrace();
      }
      return "/projectDetailPage";
      
	}
}























