package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.NoticeService;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
  
  @Autowired
  NoticeService noticeService; 
  

  
  @GetMapping("/read")
  public String read(Integer notice_id, Integer page, Integer pageSize, Model m, HttpSession session) {
    
    try {
      
          String user_id = (String)session.getAttribute("user_id");
          
          NoticeDto noticeDto = noticeService.read(notice_id);
          
          String writer = noticeDto.getWriter();
          System.out.println("user id: "+user_id);
          System.out.println("writer: " + writer);
          
          m.addAttribute(noticeDto);
          m.addAttribute("page", page);
          m.addAttribute("pageSize", pageSize);
      
      } catch (Exception e) {
          e.printStackTrace();
//        예외발생 -> 목록으로 돌아가기
          return "redirect:/notice/list";
      }
      return "notice";
  }
  
  @GetMapping("/list")
  public String list(@RequestParam(defaultValue = "1") Integer page,
                     @RequestParam(defaultValue = "10") Integer pageSize,
                     Model m,
                     HttpServletRequest request) {
      
      try {
          
//        if(page == null) page = 1;
//        if(pageSize == null) pageSize=10;
          
          int totalCnt = noticeService.getCount();
          m.addAttribute("totalCnt", totalCnt);
          
          PageResolver pageResolver = new PageResolver(totalCnt, page, pageSize);
          if(page < 0 || page > pageResolver.getTotalCnt())
              page = 1;
          if(pageSize < 0 || page > 50)
              pageSize = 10;
          
          Map map = new HashMap();
          map.put("offset", (page-1)*pageSize);
          map.put("pageSize", pageSize);
          
          List<NoticeDto> list = noticeService.getPage(map);
          m.addAttribute("list", list);
          m.addAttribute("pr", pageResolver);
          
          m.addAttribute("page", page);
          m.addAttribute("pageSize", pageSize);
          
      } catch (Exception e) {
          e.printStackTrace();
      }
      return "serviceCenter";                         // 로그인 한 상태, 게시판 목록 화면으로 이동
  }
  
  
}
