package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.purplaying.dao.HeaderFundingDao;
import kr.co.purplaying.domain.IndexDto;
import kr.co.purplaying.domain.HeaderFundingDto;

@Controller
public class HeaderFundingController { 
  @Autowired
  HeaderFundingDao headerFundingDao;
  
  
  @RequestMapping("/popularFunding")
  @GetMapping("/popularFunding")
  public String popularFunding(HeaderFundingDto headerFundingDto, Model m) {
    try {
      Map map = new HashMap();
      List<HeaderFundingDto> list_p = headerFundingDao.popularFunding(map);
      m.addAttribute("list_p",list_p);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "popularFunding";
  }
  
  @RequestMapping("/newFunding")
  @GetMapping("/newFunding")
  public String newFunding(HeaderFundingDto headerFundingDto, Model m) {
    try {
      Map map = new HashMap();
      List<HeaderFundingDto> list_n = headerFundingDao.newFunding(map);
      m.addAttribute("list_n",list_n);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "newFunding";
  }
  
  
  @RequestMapping("/comingsoonFunding")
  @GetMapping("/comingsoonFunding")
  public String getPage(HeaderFundingDto headerFundingDto, Model m ) {
    
    try {
      Map map = new HashMap();
      List<HeaderFundingDto> list_c = headerFundingDao.comingsoonFunding(map);
      m.addAttribute("list_c",list_c);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return "comingsoonFunding";
  }
}
