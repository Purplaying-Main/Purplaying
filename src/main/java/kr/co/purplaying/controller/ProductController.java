package kr.co.purplaying.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProductController {
  
  @Autowired
  ProjectService projectService;
  
  //미리보기
  @GetMapping("/view/{prdt_id}")
  public String view(@PathVariable Integer prdt_id,
                                      Model m,
                                      HttpSession session) {
        try {
          String user_id = (String)session.getAttribute("user_id");
          m.addAttribute(user_id);
          
          ProjectDto projectDto = projectService.read(prdt_id);
          m.addAttribute(projectDto);
          System.out.println(projectDto);
          
          String writer = projectDto.getWriter();
          m.addAttribute(writer);
      
      } catch (Exception e) {
          e.printStackTrace();
          return "redirect:/mypage";
      }
      
      return "projectDetail";
  }
  
  //지정된 댓글을 삭제하는 메서드 
  @DeleteMapping("/remove/{prdt_id}")
  public ResponseEntity<String> remove(@PathVariable Integer prdt_id, HttpSession session) {
      String writer = (String) session.getAttribute("user_id");
      
      try {
          int removeResult = projectService.remove(prdt_id, writer);
          
          if(removeResult != 1) 
              throw new Exception("Delete Failed");
          
          return new ResponseEntity<>(HttpStatus.OK);
      } catch (Exception e) {
          e.printStackTrace();
          return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
      }
  }
  
  @PostMapping("/write")
  public String write(ProjectDto projectDto, Model m, 
                      RedirectAttributes rattr, HttpSession session, HttpServletRequest request) {
    
      if(!loginCheck(request)) {
        return "redirect:/login/login?toURL=" + request.getRequestURL();
      }
      
      String writer = (String) session.getAttribute("user_id");
      projectDto.setWriter(writer);
      System.out.println("projectDto : "+projectDto);
      try {
          if(projectService.write(projectDto) != 1)
            throw new Exception("write failed");
          rattr.addFlashAttribute("msg", "WRT_OK");
          m.addAttribute("mode", "new");
          m.addAttribute(projectDto);
//          projectDto = projectService.readRecently(writer);
//          projectDto.setprdt_id(projectDto.getprdt_id());
          return "projectRegisterPage";
      } catch (Exception e) {
          e.printStackTrace();
          m.addAttribute("mode", "new");                  //글쓰기 모드
          m.addAttribute("projectDto", projectDto);           //등록하려던 내용을 보여줘야 함
          m.addAttribute("msg", "WRT_ERR");
          return "projectRegisterIntro";
      } 
  }
  
  @GetMapping("/write")
  public String write(Model m) {
      m.addAttribute("mode", "new");
      
      return "projectRegisterIntro";         // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할때는 mode=new
  }
   
  @PatchMapping("/modify/{prdt_id}")
  public ResponseEntity<List<ProjectDto>> modify(@PathVariable Integer prdt_id,
                                       @RequestBody ProjectDto projectDto, 
                                       HttpSession session){
    
      List<ProjectDto> list = null;
      
      String writer = (String)session.getAttribute("user_id");
      projectDto.setWriter(writer);
      projectDto.setPrdt_id(prdt_id);
      
      try {
        list = projectService.getList(prdt_id);
        
        if(projectService.modify(projectDto) != 1)
          throw new Exception("Modify failed");
        
        return new ResponseEntity<List<ProjectDto>>(list, HttpStatus.OK);
      } catch (Exception e) {
        e.printStackTrace();
        return new ResponseEntity<List<ProjectDto>>(HttpStatus.BAD_REQUEST);
      }
  }
  
  
  @GetMapping("/modify/{prdt_id}")
  public String modify(@PathVariable Integer prdt_id,
                                      Model m,
                                      SearchItem sc, HttpSession session) {
      try {
          String user_id = (String)session.getAttribute("user_id");
          m.addAttribute(user_id);
          
          ProjectDto projectDto = projectService.read(prdt_id);
          m.addAttribute(projectDto);
          
          String writer = projectDto.getWriter();
          m.addAttribute(writer);
          System.out.println("writer : "+writer);
          
      
      } catch (Exception e) {
          e.printStackTrace();
//        예외발생 -> 목록으로 돌아가기
          return "mypage";
      }
      
      return "projectRegisterPage";
  }
  
  private boolean loginCheck(HttpServletRequest request) {
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false);                    // false는 session이 없어도 새로 생성하지 않음. 반환값 : null.
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환함
    return session != null && session.getAttribute("user_id") != null;

  }
}
