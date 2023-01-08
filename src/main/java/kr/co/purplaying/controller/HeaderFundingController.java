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

import kr.co.purplaying.dao.HeaderFundingDao;
import kr.co.purplaying.domain.PageResolver2;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem2;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.LikeService;

@Controller
public class HeaderFundingController { 
  @Autowired
  HeaderFundingDao headerFundingDao;
  
  @Autowired
  LikeService likeService;
  
  @GetMapping("/popularFunding")
  public String popularFunding(SearchItem2 sc2, Model m, Authentication authentication) {
    
    try {
      int totalCnt = headerFundingDao.getSearchResultCnt(sc2);
      m.addAttribute("totalCnt", totalCnt);
      
      PageResolver2 pageResolver2 = new PageResolver2(totalCnt, sc2);
      
      List<ProjectDto> list_p = headerFundingDao.getSearchResultPage_p(sc2);
      m.addAttribute("list_p", list_p);
      m.addAttribute("pr", pageResolver2);
      
      
//      Map map = new HashMap();
//      List<ProjectDto> list_p = headerFundingDao.popularFunding(map);
//      m.addAttribute("list_p",list_p);
      
//    좋아요 리스트
      UserDto userDto = (UserDto) authentication.getPrincipal();
      String user_id = userDto.getUser_id();
      
      if(user_id!=null) {
        boolean likecheck = false;
         List<Integer> Likelist = likeService.selectLikelist(user_id);
         System.out.println(Likelist);
         m.addAttribute("Likelist",Likelist);
      }      
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "popularFunding";
  }
  
  @GetMapping("/newFunding")
  public String newFunding(SearchItem2 sc2, Model m, Authentication authentication) {

    try {
      int totalCnt = headerFundingDao.getSearchResultCnt(sc2);
      m.addAttribute("totalCnt", totalCnt);
      
      PageResolver2 pageResolver2 = new PageResolver2(totalCnt, sc2);
      
      List<ProjectDto> list_n = headerFundingDao.getSearchResultPage_n(sc2);
      m.addAttribute("list_n", list_n);
      m.addAttribute("pr", pageResolver2);
      
//    좋아요 리스트
      UserDto userDto = (UserDto) authentication.getPrincipal();
      String user_id = userDto.getUser_id();
      
      if(user_id!=null) {
        boolean likecheck = false;
         List<Integer> Likelist = likeService.selectLikelist(user_id);
         System.out.println(Likelist);
         m.addAttribute("Likelist",Likelist);
      }      
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "newFunding";
  }
  

  @GetMapping("/comingsoonFunding")
  public String getPage(SearchItem2 sc2, Model m, Authentication authentication) {
    
    try {
      int totalCnt = headerFundingDao.getSearchResultCnt_c(sc2);
      m.addAttribute("totalCnt", totalCnt);
      
      PageResolver2 pageResolver2 = new PageResolver2(totalCnt, sc2);
      
      List<ProjectDto> list_c = headerFundingDao.getSearchResultPage_c(sc2);
      m.addAttribute("list_c", list_c);
      m.addAttribute("pr", pageResolver2);
      
//    좋아요 리스트
      UserDto userDto = (UserDto) authentication.getPrincipal();
      String user_id = userDto.getUser_id();
      
      if(user_id!=null) {
        boolean likecheck = false;
         List<Integer> Likelist = likeService.selectLikelist(user_id);
         System.out.println(Likelist);
         m.addAttribute("Likelist",Likelist);
      }      
      

    } catch (Exception e) {
      e.printStackTrace();
    }
    return "comingsoonFunding";
  }
}
