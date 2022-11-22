package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.dao.GenreDao;
import kr.co.purplaying.domain.Order;
import kr.co.purplaying.domain.ProjectDto;
@Controller
@RequestMapping("/genre")
public class GenreController {

  @Autowired
  GenreDao genreDao;
  
  @RequestMapping("/literature")
  @GetMapping("/literature")
  public String getLiterature(Order order, Model m) {
    try {
      List<ProjectDto> list_gl = genreDao.genreLiterature(order);
      m.addAttribute("list_gl",list_gl);
      m.addAttribute("order",order);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return "genreLiterature";
  }
  
  @RequestMapping("/poemessay")
  @GetMapping("/poemessay")
  public String getPoemEssay (Order order, Model m) {
    try {
      List<ProjectDto> list_gpe = genreDao.genrePoemEssay(order);
      m.addAttribute("list_gpe",list_gpe);
      m.addAttribute("order",order);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "genrePoemEssay";
  }
  
  @RequestMapping("/webtoon")
  @GetMapping("/webtoon")
  public String genrWebtoon (Order order, Model m) {
    try {
      List<ProjectDto> list_gw = genreDao.genreWebtoon(order);
      m.addAttribute("list_gw",list_gw);
      m.addAttribute("order",order);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "genreWebtoon";
  }
}
