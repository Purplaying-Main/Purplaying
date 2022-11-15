package kr.co.purplaying.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.service.ProjectService;

@Controller
@RequestMapping("/projectregister")
public class ProjectController {
  
  @Autowired
  ProjectService projectService;

  @PostMapping("/modify")
  public String modify(ProjectDto projectDto,  
                      RedirectAttributes rattr, Model m, HttpSession session) {
      String writer = (String) session.getAttribute("user_id");
      projectDto.setWriter(writer);
      
      try {
          if(projectService.modify(projectDto) != 1)
              throw new Exception("Modify failed");
          
          rattr.addFlashAttribute("msg", "MOD_OK");
          return "redirect:/projectregister/modify";
      } catch(Exception e) {
          e.printStackTrace();
          m.addAttribute(projectDto);
          m.addAttribute("msg", "MOD_ERR");
          return "projectRegisterPage";         // 수정등록하려던 내용을 보여줌
      }
      
  }
  
  @GetMapping("/modify")
  public String modify(Integer product_id, Model m, HttpSession session) {
    //read와 동일. notice_id를 불러와서 조회.
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
          return "projectRegisterPage";
      }
    
      return "projectRegisterPage";         // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할때는 mode=new
  }
  
  @PostMapping("/write")
  public String write(ProjectDto projectDto, RedirectAttributes rattr, Model m, HttpSession session) {
      String writer = (String) session.getAttribute("user_id");
      projectDto.setWriter(writer);
      System.out.println("projectDto : "+projectDto);
      try {
          if(projectService.write(projectDto) != 1) 
          
          rattr.addFlashAttribute("msg", "WRT_OK");
          return "redirect:/projectregister/modify";
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
  
  
  private boolean loginCheck(HttpServletRequest request) {
    // TODO Auto-generated method stub
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false);        // false는 session이 없어도 새로 생성하지 않음. 반환값 null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id")!=null;
}

}
