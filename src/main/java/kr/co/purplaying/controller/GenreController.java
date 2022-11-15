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
import kr.co.purplaying.domain.GenreDto;
import kr.co.purplaying.domain.Sort;
@Controller
@RequestMapping("/genre")
public class GenreController {

  @Autowired
  GenreDao genreDao;
  
  @RequestMapping("/literature")
  @GetMapping("/literature")
  public String getLiterature(Sort sort, Model m) {
    try {
      List<GenreDto> list_gl = genreDao.genreLiteratureSort(sort);
      m.addAttribute("list_gl",list_gl);
      m.addAttribute("sort",sort);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return "genreLiterature";
  }
  
  @RequestMapping("/poemessay")
  @GetMapping("/poemessay")
  public String getPoemEssay (GenreDto genreDto, Model m) {
    try {
      Map map = new HashMap();
      List<GenreDto> list_gpe = genreDao.genrePoemEssay(map);
      m.addAttribute("list_gpe",list_gpe);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "genrePoemEssay";
  }
  
  @RequestMapping("/webtoon")
  @GetMapping("/webtoon")
  public String genrWebtoon (GenreDto genreDto, Model m) {
    try {
      Map map = new HashMap();
      List<GenreDto> list_gw = genreDao.genreWebtoon(map);
      m.addAttribute("list_gw",list_gw);
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "genreWebtoon";
  }
}
