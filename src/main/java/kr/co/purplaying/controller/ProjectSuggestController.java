package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.dao.ProjectSuggestDao;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.ProjectSuggestDto;

@Controller
public class ProjectSuggestController {

  @Autowired
  ProjectSuggestDao projectSuggestDao;
  
  @RequestMapping("/searchResult")
  @GetMapping("/searchResult")
  public String getpage(ProjectDto projectDto, Model m) {
    
    try {
      Map map = new HashMap();
      List<ProjectDto> list_ps = projectSuggestDao.projectSuggest(map);
      m.addAttribute("list_ps", list_ps);
      
    } catch (Exception e) {
     e.printStackTrace();
    }
    return "searchResult";
  }
}
