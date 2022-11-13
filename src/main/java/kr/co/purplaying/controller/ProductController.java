package kr.co.purplaying.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.domain.ProductDto;
import kr.co.purplaying.service.ProductService;

@Controller
//@RequestMapping("/genreliterature")
public class ProductController {

	@Autowired
	ProductService productService;
	

	
	@GetMapping("/projectDetail")
	public String read(Integer prdt_id, Integer prdt_genre, String prdt_name, String prdt_desc, String prdt_desc_detail, Date prdt_opendate, Date prdt_enddate, 
	    Integer prdt_goal, Integer prdt_currenttotal, Integer user_id, Model m) {

		try {
		    ProductDto productDto = productService.read(prdt_id);
			m.addAttribute(productDto);

			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/index";
		}
		
		return "projectDetail";
	}
	
}






















