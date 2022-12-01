package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.dao.ProjectSuggestDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.PageResolver2;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem2;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.ProjectService;
import kr.co.purplaying.service.SearchResultService;

@Controller
public class SearchResultController {
  

  @Autowired
  SearchResultService searchResultService;
  
  @Autowired
  ProjectSuggestDao projectSuggestDao;
  
  @Autowired
  UserDao userDao;

  @Autowired
  ProjectService projectService;

  @GetMapping("/searchResult")
  public String searchResult(SearchItem2 sc2, ProjectDto projectDto,  Model m) {
        
     
        try {
          Map map = new HashMap();

          
          List<ProjectDto> searchResult = searchResultService.getSearchResultPage(sc2);
          m.addAttribute("keyword", searchResult);
          
          List<UserDto> searchUser = userDao.searchUserPage(sc2);
          m.addAttribute("U_keyword", searchUser);
          
          int totalCnt = searchResultService.getsearchcount(sc2);
          m.addAttribute("prdt_count", totalCnt);
          
          int userCount = userDao.searchuser(sc2);
          m.addAttribute("user_count", userCount);

          PageResolver2 pageResolver2 = new PageResolver2(totalCnt, sc2);
          m.addAttribute("pr2", pageResolver2);
          
          List<ProjectDto> list_ps = projectSuggestDao.projectSuggest(map);
          m.addAttribute("list_ps", list_ps);
          
        } catch (Exception e) {
          e.printStackTrace();
        }
        
        return "searchResult";

        }
          

  @GetMapping("/creatorSearch/{writer}")       
  public String creatorSearch(@PathVariable String writer, Model m, HttpSession session) {
          System.out.println(writer);
          try {
              List<ProjectDto> list_project = projectService.getListByWriter(writer); 
              System.out.println(list_project);
              m.addAttribute("list_project",list_project);
              

              
          


          } catch (Exception e) {
            e.printStackTrace();
          }
          
        return "creatorSearch";
      }
        
  }
      

   
    
    
//creatorSearch
    
    
    
    
    
    
    
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
  
  




