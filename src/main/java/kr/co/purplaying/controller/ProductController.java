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
  
//  // mapper테스트. 수정 정상작동 (2022-11-19)
//  @RequestMapping("/modify")
//  public String modify(ProjectDto projectDto,  
//                      RedirectAttributes rattr, Model m, HttpSession session) {
//      String writer = (String) session.getAttribute("user_id");
//      projectDto.setWriter(writer);
//      Integer product_id = projectDto.getProduct_id();
//      projectDto.setProduct_id(product_id);
//      try {
//
//          if(projectService.modify(projectDto) != 1)
//              throw new Exception("Modify failed");
//          
//          rattr.addFlashAttribute("msg", "MOD_OK");
//          System.out.println("post result modify: "+projectDto);
//          return "redirect:/project/modify";
//      } catch(Exception e) {
//          e.printStackTrace();
//          m.addAttribute(projectDto);
//          m.addAttribute("msg", "MOD_ERR");
//          return "projectRegisterPage";         // 수정등록하려던 내용을 보여줌
//      }
//      
//  }
   
  @PatchMapping("/modify/{product_id}")
  public ResponseEntity<List<ProjectDto>> modify(@PathVariable Integer product_id,
                                       @RequestBody ProjectDto projectDto, 
                                       HttpSession session){
    
      List<ProjectDto> list = null;
      
      String writer = (String)session.getAttribute("user_id");
      projectDto.setWriter(writer);
      projectDto.setProduct_id(product_id);
      
      System.out.println("Patch ready modify: "+projectDto);
      try {
        list = projectService.getList(product_id);
        System.out.println("list: "+list);
        
        if(projectService.modify(projectDto) != 1)
          throw new Exception("Modify failed");
        
        System.out.println("Patch result modify: "+projectDto);
        return new ResponseEntity<List<ProjectDto>>(list, HttpStatus.OK);
      } catch (Exception e) {
        e.printStackTrace();
        return new ResponseEntity<List<ProjectDto>>(HttpStatus.BAD_REQUEST);
      }
  }
  
  
  @GetMapping("/modify/{product_id}")
  public String modify(@PathVariable Integer product_id,
                                      Model m,
                                      SearchItem sc, HttpSession session) {
      try {
          String user_id = (String)session.getAttribute("user_id");
          m.addAttribute(user_id);
          
          ProjectDto projectDto = projectService.read(product_id);
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
