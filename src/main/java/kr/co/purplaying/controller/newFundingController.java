package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.purplaying.dao.NewFundingDao;
import kr.co.purplaying.domain.IndexDto;
import kr.co.purplaying.domain.NewFundingDto;

@Controller
public class newFundingController { 
  @Autowired
  NewFundingDao newFundingDao;
  

  @GetMapping("/newFunding")
  public String getPage(NewFundingDto newFundingDto, Model m) {
    try {
      Map map = new HashMap();
      List<NewFundingDto> list_n = newFundingDao.newFunding(map);
      m.addAttribute("list_n",list_n);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "newFunding";
  }
  
}
