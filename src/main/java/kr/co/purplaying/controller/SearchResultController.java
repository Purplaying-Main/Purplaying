package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.dao.SearchResultDao;
import kr.co.purplaying.domain.SearchResultDto;
import kr.co.purplaying.service.SearchResultService;

@Controller
@RequestMapping("/searchResult")
public class SearchResultController {

  @Autowired
  SearchResultService searchResultService;
  
  @Autowired
  SearchResultDao searchResultDao;

  @RequestMapping("/searchResult")
  @GetMapping("/searchResult")
  public String searchResult(SearchResultDto sr, Model m) {
        
       
        try {
        
         
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
  
  




