package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.dao.IndexDao;
import kr.co.purplaying.domain.BannerFileDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.FileService;
import kr.co.purplaying.service.LikeService;
import kr.co.purplaying.service.SettingService;

@Controller
public class IndexController {

  @Autowired
  IndexDao indexDao;
  
  @Autowired
  SettingService settingService;
  
  @Autowired
  FileService fileSevice;
  
  @Autowired
  LikeService likeService;
  
  @RequestMapping("/")
  @GetMapping("/")
  public String getPage(ProjectDto projectDto, Model m, HttpSession session) {
    
    String id = (String)session.getAttribute("user_id");
    
    try {
//    로그인 시 유저정보(userDto) 세션에 저장
      UserDto userDto = settingService.setUser(id);
      session.putValue("userDto", userDto);
      
      Map map = new HashMap();
      List<ProjectDto> list_p = indexDao.popluarFunding(map);
      
      
      
      List<BannerFileDto> bannerList = fileSevice.selectBannerList();
      
      System.out.println(bannerList);
      m.addAttribute("bannerList",bannerList);
      
      m.addAttribute("list_p",list_p);
     
      
      List<ProjectDto> list_n = indexDao.newFunding(map);
      m.addAttribute("list_n",list_n);
      if(id!=null) {
        boolean likecheck = false;
        List<Integer> Likelist = likeService.selectLikelist(id);
        System.out.println(Likelist);
     
   
        m.addAttribute("Likelist",Likelist);
        
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return "/index";
  }
  
}
