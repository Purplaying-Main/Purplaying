package kr.co.purplaying.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

  @PatchMapping("/modify/{product_id}")
  public ResponseEntity<String> modify(@PathVariable Integer product_id, ProjectDto projectDto, HttpSession session, Model m){
  
      try {
        if(projectService.modify(projectDto) != 1)
          throw new Exception("Modify failed");
        
        System.out.println("Patch result modify: "+projectDto);
        return new ResponseEntity<String>("Modify_OK", HttpStatus.OK);
      } catch (Exception e) {
        e.printStackTrace();
        return new ResponseEntity<String>("Modify_ERR", HttpStatus.BAD_REQUEST);
      }
  }
  
  @GetMapping("/modify")
  public String read(Integer product_id, SearchItem sc, Model m, HttpSession session) {
      try {
        
          String user_id = (String)session.getAttribute("user_id");
          m.addAttribute(user_id);
          
          ProjectDto projectDto = projectService.read(product_id);
          m.addAttribute(projectDto);
          
          String writer = projectDto.getWriter();
          m.addAttribute(writer);
          
      
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
