package kr.co.purplaying.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.dao.GenreDao;
import kr.co.purplaying.domain.Order;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.LikeService;
@Controller
@RequestMapping("/genre")
public class GenreController {

  @Autowired
  GenreDao genreDao;
  
  @Autowired
  LikeService likeService;
  
  @GetMapping("/literature")
  public String getLiterature(Order order, Model m, HttpSession session) {
  
    String user_id = (String)session.getAttribute("user_id");
    
    try {
      List<ProjectDto> list_gl = genreDao.genreLiterature(order);
      m.addAttribute("list_gl",list_gl);
      m.addAttribute("order",order);

      if(user_id!=null) {
        boolean likecheck = false;
        List<Integer> Likelist = likeService.selectLikelist(user_id);
        System.out.println(Likelist);
     
   
        m.addAttribute("Likelist",Likelist);
        
      }            
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "genreLiterature";
  }
  
 
  @GetMapping("/poemessay")
  public String getPoemEssay (Order order, Model m, HttpSession session) {
    
    String user_id = (String)session.getAttribute("user_id");
    
    try {
      List<ProjectDto> list_gpe = genreDao.genrePoemEssay(order);
      m.addAttribute("list_gpe",list_gpe);
      m.addAttribute("order",order);
      
      if(user_id!=null) {
        boolean likecheck = false;
        List<Integer> Likelist = likeService.selectLikelist(user_id);
        System.out.println(Likelist);
     
   
        m.addAttribute("Likelist",Likelist);
        
      }  
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "genrePoemEssay";
  }
  
  @GetMapping("/webtoon")
  public String genrWebtoon (Order order, Model m, HttpSession session) {
    
    String user_id = (String)session.getAttribute("user_id");

    try {
      List<ProjectDto> list_gw = genreDao.genreWebtoon(order);
      m.addAttribute("list_gw",list_gw);
      m.addAttribute("order",order);
      
      if(user_id!=null) {
        boolean likecheck = false;
        List<Integer> Likelist = likeService.selectLikelist(user_id);
        System.out.println(Likelist);
     
   
        m.addAttribute("Likelist",Likelist);
        
      }  
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "genreWebtoon";
  }
}
