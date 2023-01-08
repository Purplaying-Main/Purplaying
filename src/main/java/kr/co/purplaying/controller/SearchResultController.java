package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import kr.co.purplaying.dao.ProjectSuggestDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.PageResolver2;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem2;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.LikeService;
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
  
  @Autowired
  LikeService likeService;

  @GetMapping("/searchResult")
  public String searchResult(SearchItem2 sc2, ProjectDto projectDto,  Model m, Authentication authentication
      ) {
        
        try {
          Map map = new HashMap();

          //검색 리스트
          List<ProjectDto> searchResult = searchResultService.getSearchResultPage(sc2);
          m.addAttribute("keyword", searchResult);
          //유저 리스트
          List<UserDto> searchUser = userDao.searchUserPage(sc2);
          System.out.println("ujser"+searchUser);
          m.addAttribute("U_keyword", searchUser);
          // 검색결과 펀딩 수 
          int totalCnt = searchResultService.getsearchcount(sc2);
          m.addAttribute("prdt_count", totalCnt);
          // 검색결과 유저 수
          int userCount = userDao.searchuser(sc2);
          m.addAttribute("user_count", userCount);

          PageResolver2 pageResolver2 = new PageResolver2(totalCnt, sc2);
          m.addAttribute("pr2", pageResolver2);
          
          List<ProjectDto> list_ps = projectSuggestDao.projectSuggest(map);
          m.addAttribute("list_ps", list_ps);
          
          //세션의 유저 id의 좋아요 리스트 
          if(authentication!=null) {
            UserDto udt = (UserDto) authentication.getPrincipal();
            String id = (String)udt.getUser_id();
            boolean likecheck = false;
            List<Integer> Likelist = likeService.selectLikelist(id);
            System.out.println(Likelist);
            m.addAttribute("Likelist",Likelist);            
          }          
        } catch (Exception e) {
          e.printStackTrace();
        }        
        return "searchResult";
        }
          
  @GetMapping("/projectViewMore")
  public String projectViewMore(SearchItem2 sc2, ProjectDto projectDto,  Model m, Authentication authentication) {
          
          
          try {
                      
            List<ProjectDto> projectViewMore = searchResultService.getSearchResultPage(sc2);
            m.addAttribute("prdt_view", projectViewMore);
            
            int totalCnt = searchResultService.getsearchcount(sc2);
            m.addAttribute("prdt_count", totalCnt);
            
            PageResolver2 pageResolver2 = new PageResolver2(totalCnt, sc2);
            m.addAttribute("pr2", pageResolver2);
            
            if(authentication!=null) {
              UserDto udt = (UserDto) authentication.getPrincipal();
              String id = (String)udt.getUser_id();
              boolean likecheck = false;
              List<Integer> Likelist = likeService.selectLikelist(id);
              System.out.println(Likelist);
           
         
              m.addAttribute("Likelist",Likelist);
              
            }
            
          } catch (Exception e) {
            e.printStackTrace();
          }
          return "projectViewMore";
        }
  
  
  @GetMapping("/creatorViewMore")
  public String creatorViewMore(SearchItem2 sc2,  Model m) {

          try {
                      
            List<UserDto> creatorViewMore = userDao.searchUserPage(sc2);
            m.addAttribute("creator_view", creatorViewMore);
            
            int userCount = userDao.searchuser(sc2);
            m.addAttribute("user_count", userCount);          
            
            PageResolver2 pageResolver2 = new PageResolver2(userCount, sc2);
            m.addAttribute("pr2", pageResolver2);
            
          } catch (Exception e) {
            e.printStackTrace();
          }
          return "creatorViewMore";
        }
  
  
  
  //창작자 프로젝트 더보기
  @GetMapping("/creatorSearch/{user_id}")       
  public String creatorSearch(@PathVariable String user_id, UserDto userDto, Model m, Authentication authentication) {

          try {
              // 유저 id에 해당하는 펀딩 리스트
              List<ProjectDto> list_project = projectService.getListByWriter(user_id); 
              System.out.println(list_project);
              m.addAttribute("list_project",list_project);
              
              // 펀딩 예정 리스트
              List<ProjectDto> list_soon = projectService.getSoonListByWriter(user_id);
              System.out.println(list_soon);
              m.addAttribute("list_soon", list_soon);
              
              // 유저 프로필
              List<UserDto> list_crea = userDao.getUserList(userDto);
              System.out.println(list_crea);
              m.addAttribute("list_crea", list_crea);
              
              // 세션의 유저 id의 좋아요 리스트 
              if(authentication!=null) {
                UserDto udt = (UserDto) authentication.getPrincipal();
                String id = (String)udt.getUser_id();
                boolean likecheck = false;
                List<Integer> Likelist = likeService.selectLikelist(id);
                System.out.println(Likelist);        
                m.addAttribute("Likelist",Likelist);               
              }
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
  
  




