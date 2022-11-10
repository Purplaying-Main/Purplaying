package kr.co.purplaying;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.purplaying.dao.IndexDao;
import kr.co.purplaying.domain.IndexDto;

@Controller
@RequestMapping
public class IndexController {

  @Autowired
  IndexDao indexDao;
  
  @GetMapping("/")
  public String getPage(IndexDto indexDto, Model m) {
    try {
      Map map_p = new HashMap();
      List<IndexDto> list_p = indexDao.popluarFunding(map_p);
      System.out.println(list_p.get(0).toString());
      m.addAttribute("list_p",list_p);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "/index";
  }
  
}
