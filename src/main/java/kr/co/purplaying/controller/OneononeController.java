package kr.co.purplaying.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.domain.OneononeDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.service.OneononeService;

@Controller
@RequestMapping(value = "/oneonone")
public class OneononeController {

  @Autowired
  OneononeService oneononeService;

  @PostMapping("/modify")
  public String modify(OneononeDto oneononeDto, Integer page, Integer pageSize, 
                        RedirectAttributes rattr, Model m, HttpSession session) {
    //
    String user_id = (String) session.getAttribute("user_id");
    oneononeDto.setUser_id(user_id);

    try {
      if (oneononeService.modify(oneononeDto) != 1) {
        throw new Exception("Modify failed");
      }

      rattr.addAttribute("page", page);
      rattr.addAttribute("pageSize", pageSize);
      rattr.addFlashAttribute("msg", "MOD_OK");

      return "redirect:/oneonone/list";
      
    } catch (Exception e) {
      e.printStackTrace();
      m.addAttribute(oneononeDto);
      m.addAttribute("page", page);
      m.addAttribute("pageSize", pageSize);
      m.addAttribute("msg", "MOD_ERR");
      // 수정등록하려던 내용을 보여줌
      return "showInquiry5"; /*oneonone/modify;*/
    }

  }
/*  
  @GetMapping("/modify")
  public String modify(Integer inquiry_no, Integer page, Integer pageSize, Model m, HttpSession session) {

    try {
          
          String user_id = (String)session.getAttribute("user_id");
          m.addAttribute(user_id);
          
          OneononeDto oneononeDto = oneononeService.read(inquiry_no);
          
          m.addAttribute(oneononeDto);
          m.addAttribute("page", page);
          m.addAttribute("pageSize", pageSize);
          //
          user_id = oneononeDto.getUser_id();
          m.addAttribute(user_id);

      } catch (Exception e) {
          e.printStackTrace();
//        예외발생 -> 목록으로 돌아가기
          return "redirect:/oneonone/list";
      }
    
      return "showInquiry5";         // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할때는 mode=new
  }
*/
  
  @PostMapping("/write/reg")
  //
  public String write(OneononeDto oneononeDto, RedirectAttributes rattr, Model m, HttpSession session) {
    String user_id = (String) session.getAttribute("user_id");
    oneononeDto.setUser_id(user_id);

    try {
      int writeResult = oneononeService.write(oneononeDto);
      if (writeResult != 1) {
        throw new Exception("Write failed");
      }

      rattr.addFlashAttribute("msg", "WRT_OK");
      return "redirect:/oneonone/list";

    } catch (Exception e) {
      e.printStackTrace();
      m.addAttribute("mode", "new");
      m.addAttribute("oneononeDto", oneononeDto); // m.addAttribute("boardDto", boardDto); "boardDto" 생략가능
      m.addAttribute("msg", "WRT_ERR");

      return "showInquiry5" /* oneonone/write */;
    }

  }

  @GetMapping("/write")
  //
  public String write(Model m, HttpSession session, OneononeDto oneononeDto) {
    String user_id = (String) session.getAttribute("user_id");
    oneononeDto.setUser_id(user_id);

    m.addAttribute("mode", "new");

    return "inquiryeWrite"; // 쓰기에 사용할때는 mode=new
  }

  @PostMapping("/remove")
  public String remove(Integer inquiry_no, Integer page, Integer pageSize,
                        RedirectAttributes rattr, HttpSession session) {
    //
    String user_id = (String) session.getAttribute("user_id");
    // || String user_id = (String) session.getAttribute("admin@gmail.com");

    String msg = "DEL_OK";

    try {
      int del_result = oneononeService.remove(inquiry_no, user_id);
      if (del_result != 1) {
        throw new Exception("Delete failed.");
      }

    } catch (Exception e) {
      e.printStackTrace();
      msg = "DEL_ERR";
    }

    // 삭제 후 메시지가 한번만 나와야 함. Model 이 아닌 RedirectAttributes 에 저장하면 메시지가 한번만 나옴
    // addFlashAttribute() : 한번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한번 쓰고 지워버림. 세션에도 부담이 덜함.
    rattr.addAttribute("page", page);
    rattr.addAttribute("pageSize", pageSize);
    rattr.addFlashAttribute("msg", msg);

    return "redirect:/oneonone/list";
  }

  @GetMapping("/read")
  public String read(Integer inquiry_no, Integer page, Integer pageSize,/* SearchItem sc, */ Model m, HttpSession session) {
    
    try {
        String user_id = (String)session.getAttribute("user_id");
        m.addAttribute(user_id);
        
        OneononeDto oneononeDto = oneononeService.read(inquiry_no);
		
        m.addAttribute("oneononeDto", oneononeDto); 
		m.addAttribute("page", page);
		m.addAttribute("pageSize", pageSize);
        m.addAttribute(user_id, oneononeDto);
//        
        user_id = oneononeDto.getUser_id();
        m.addAttribute(user_id);


    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:/oneonone/list";
    }

    return "showInquiry5";
  }

  @GetMapping("/list")
  public String list(SearchItem sc,
      Model m,
      HttpServletRequest request) {

    if (!loginCheck(request))
      return "redirect:/user/login?toURL=" + request.getRequestURL();

    try {

//			if(page==null) page=1;
//			if(pageSize==null) pageSize=10;

      int totalCnt = oneononeService.getSearchResultCnt(sc);
      m.addAttribute("totalCnt", totalCnt);

      PageResolver pageResolver = new PageResolver(totalCnt, sc);

      List<OneononeDto> list = oneononeService.getSearchResultPage(sc);
      m.addAttribute("list", list);
      m.addAttribute("pr", pageResolver);

    } catch (Exception e) {
      e.printStackTrace();
    }

    return "oneonone"; // 로그인 한 상태, 게시판 목록 화면으로 이동

  }

  private boolean loginCheck(HttpServletRequest request) {
    // TODO Auto-generated method stub
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false); // false 는 session 이 없어도 새로 생성하지 않음. 반환값 null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id") != null;
  }

}
