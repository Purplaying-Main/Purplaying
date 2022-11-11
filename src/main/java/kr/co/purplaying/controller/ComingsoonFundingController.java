package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.dao.ComingsoonFundingDao;
import kr.co.purplaying.domain.ComingsoonFundingDto;

@Controller
public class ComingsoonFundingController {

  @Autowired
  ComingsoonFundingDao comingsoonFundingDao;
  
  @RequestMapping("/comingsoonFunding")
  @GetMapping("/comingsoonFunding")
  public String getPage(ComingsoonFundingDto comingsoonFundingDto, Model m ) {
    
    try {
      Map map = new HashMap();
      List<ComingsoonFundingDto> list_c = comingsoonFundingDao.comingsoonFunding(map);
      m.addAttribute("list_c",list_c);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return "comingsoonFunding";
  }
  
}
