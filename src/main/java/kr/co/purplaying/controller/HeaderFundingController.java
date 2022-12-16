package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.purplaying.dao.HeaderFundingDao;
import kr.co.purplaying.domain.ProjectDto;

@Controller
public class HeaderFundingController { 
  @Autowired
  HeaderFundingDao headerFundingDao;
  
  @GetMapping("/popularFunding")
  public String popularFunding(ProjectDto projectDto, Model m) {
    try {
      Map map = new HashMap();
      List<ProjectDto> list_p = headerFundingDao.popularFunding(map);
      m.addAttribute("list_p",list_p);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "popularFunding";
  }
  
  @GetMapping("/newFunding")
  public String newFunding(ProjectDto projectDto, Model m) {
    try {
      Map map = new HashMap();
      List<ProjectDto> list_n = headerFundingDao.newFunding(map);
      m.addAttribute("list_n",list_n);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "newFunding";
  }
  

  @GetMapping("/comingsoonFunding")
  public String getPage(ProjectDto projectDto, Model m ) {
    
    try {
      Map map = new HashMap();
      List<ProjectDto> list_c = headerFundingDao.comingsoonFunding(map);
      m.addAttribute("list_c",list_c);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return "comingsoonFunding";
  }
}
