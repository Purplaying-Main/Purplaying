package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.purplaying.dao.IndexDao;
import kr.co.purplaying.domain.ProjectDto;

@Controller
public class IndexController {

  @Autowired
  IndexDao indexDao;
  
  @RequestMapping("/")
  @GetMapping("/")
  public String getPage(ProjectDto projectDto, Model m) {
    try {
      Map map = new HashMap();
      List<ProjectDto> list_p = indexDao.popluarFunding(map);
      m.addAttribute("list_p",list_p);
      
      List<ProjectDto> list_n = indexDao.newFunding(map);
      m.addAttribute("list_n",list_n);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "/index";
  }
  
}
