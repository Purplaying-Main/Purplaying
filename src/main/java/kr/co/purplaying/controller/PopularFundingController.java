package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.purplaying.dao.PopularFundingDao;
import kr.co.purplaying.domain.PopularFundingDto;

@Controller
public class PopularFundingController {

  @Autowired
  PopularFundingDao popularFundingDao;
  

  @GetMapping("/popularFunding")
  public String getPage(PopularFundingDto popularFundingDto, Model m) {
    try {
      Map map = new HashMap();
      List<PopularFundingDto> list_p = popularFundingDao.popularFunding(map);
      m.addAttribute("list_p",list_p);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "popularFunding";
  }
}
