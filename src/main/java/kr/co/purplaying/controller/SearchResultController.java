package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.service.SearchResultService;

@Controller
public class SearchResultController {
  

  @Autowired
  SearchResultService searchResultService;
  
  @RequestMapping("/searchResult")
  @GetMapping("/searchResult")
  public String searchResult(SearchItem sc,  Model m) {
        
     
        try {
          Map map = new HashMap();

          
          List<ProjectDto> searchResult = searchResultService.getSearchResultPage(sc);
          m.addAttribute("keyword", searchResult);
          
          int totalCnt = searchResultService.getsearchcount(sc);
          m.addAttribute("count", totalCnt);

          PageResolver pageResolver = new PageResolver(totalCnt, sc);
          m.addAttribute("pr", pageResolver);
          
        } catch (Exception e) {
          e.printStackTrace();
        }
        
        return "searchResult";

        }
          
          

        
  }
      

   
    
    
    
    
    
    
    
    
    
    
//    try {
//      Map map = new HashMap();
//      List<SearchResultDto> list_nm = searchResultDao.searchResult(map);
//      m.addAttribute("list_nm", list_nm);
//      m.addAttribute("keyword", sr);
//      
//     
//      
//    }catch (Exception e) {
//      e.printStackTrace();
//    }
//    
//    
//  
//    return "searchResult";
//   
//    
//  }
//  
//  public String searchResult(Map map,
//      @RequestParam(value = "keyword", defaultValue = "") String keyword, HttpServletRequest request) throws Exception {
//    
//    
//    return keyword;
//
//  }
  
  




