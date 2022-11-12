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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.NoticeService;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
  
  @Autowired
  NoticeService noticeService; 
  
  @PostMapping("/write/reg")
  public String write(NoticeDto noticeDto, RedirectAttributes rattr, Model m, HttpSession session) {
      String writer = (String) session.getAttribute("user_id");
      noticeDto.setWriter(writer);
      
      try {
         int writeResult = noticeService.write(noticeDto);
          if(writeResult != 1)
              throw new Exception("Write failed");
          
          rattr.addFlashAttribute("msg", "WRT_OK");
          return "redirect:/notice/list";
      } catch (Exception e) {
          e.printStackTrace();
          m.addAttribute("mode", "new");                  //글쓰기 모드
          m.addAttribute("noticeDto", noticeDto);           //등록하려던 내용을 보여줘야 함
          m.addAttribute("msg", "WRT_ERR");
          return "notice/write";
      }
      
  }
  
  
  @GetMapping("/write")
  public String write(Model m, HttpSession session, NoticeDto noticeDto) {
    String writer = (String) session.getAttribute("user_id");
    noticeDto.setWriter(writer);
    
    m.addAttribute("mode", "new");
    
    return "noticeWrite";         // 쓰기에 사용할때는 mode=new
}
  
  @PostMapping("/remove")
  public String remove(Integer notice_id, Integer page, Integer pageSize, 
          RedirectAttributes rattr, HttpSession session) {
    String writer = (String) session.getAttribute("user_id");
    String msg = "DEL_OK";
    
    try {
      int del_result = noticeService.remove(notice_id, writer);
      System.out.println("del_result : "+ del_result);
      if(del_result != 1)
        throw new Exception("Delete failed.");
      
    } catch (Exception e) {
      e.printStackTrace();
      msg = "DEL_ERR";
    }
    
    //삭제 후 메시지가 한번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메시지가 한번만 나옴.
    //addFlashAttribute() : 한번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한번 쓰고 지워버림. 세션에도 부담이 덜함.
    rattr.addAttribute("page", page);
    rattr.addAttribute("pageSize", pageSize);
    rattr.addFlashAttribute("msg", msg);
    
    return "redirect:/notice/list";
  }
  
  @GetMapping("/read")
  public String read(Integer notice_id, Integer page, Integer pageSize, Model m, HttpSession session) {
    
    try {
      
          String user_id = (String)session.getAttribute("user_id");
          m.addAttribute(user_id);
          
          NoticeDto noticeDto = noticeService.read(notice_id);
          
          m.addAttribute(noticeDto);
          m.addAttribute("page", page);
          m.addAttribute("pageSize", pageSize);
          
          String writer = noticeDto.getWriter();
          m.addAttribute(writer);

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
