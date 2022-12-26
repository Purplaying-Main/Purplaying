package kr.co.purplaying.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.purplaying.domain.AlarmDto;
import kr.co.purplaying.domain.LikeDto;
import kr.co.purplaying.service.AlarmService;
import kr.co.purplaying.service.LikeService;

@Controller
@RequestMapping("/like")
public class LikeController {
  
  @Autowired
  LikeService likeService;
  
  @Autowired
  AlarmService alarmService;
  
  @PostMapping("/addlike")
  @ResponseBody
  public String addLikelist(@RequestBody LikeDto likeDto, AlarmDto alarmDto, HttpSession session){
//    System.out.println(session.getAttribute("user_id"));
    String user_id = (String) session.getAttribute("user_id");
    likeDto.setUser_id(user_id);
    
    try {
      if(likeService.insertLike(likeDto)!=1) {
        System.out.println("좋아요 추가 실패");
      }
      
      LikeDto recentlyLikeDto = likeService.selectByRecently(user_id);
      System.out.println("recentlyLikeDto: "+recentlyLikeDto);
      int like_id = recentlyLikeDto.getLike_id();
      
      alarmDto.setLike_id(like_id);
      System.out.println("alarmDto: "+alarmDto);
      
      if(alarmService.insertAlarm(alarmDto)!=1) {
        System.out.println("관심 알림 추가 실패");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }
  
  @PostMapping("/removelike")
  @ResponseBody
  public String removeLikelist(@RequestBody LikeDto likeDto, HttpSession session){
    System.out.println(session.getAttribute("user_id"));
    likeDto.setUser_id((String)session.getAttribute("user_id"));
    System.out.println(likeDto);
    
    try {
      if(likeService.deleteLike(likeDto)!=1) {
        System.out.println("좋아요 삭제 실패");
      }
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return null;
  }
}
