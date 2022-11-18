package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.dao.SearchResultDao;
import kr.co.purplaying.domain.SearchResultDto;

@Controller
//@RequestMapping("/searchResult")
public class SearchResultController {

//  @Autowired
//  SearchResultDao searchResultDao;
//  
//  @RequestMapping("/searchResult")
//  @GetMapping("/searchResult")
//  public String searchResult(SearchResultDto searchResultDto, Model m) {
//   
//    
//    try {
//      Map map = new HashMap();
//      List<SearchResultDto> list_sr = searchResultDao.searchResult(map);
//      m.addAttribute("list_sr", list_sr);
//
//    } catch (Exception e) {
//     e.printStackTrace();
//    }
//    return "searchResult";
//  }
  

}
