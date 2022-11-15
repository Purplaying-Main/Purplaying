package kr.co.purplaying.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
  
  @PostMapping("/write")
  public String write(ProjectDto projectDto, RedirectAttributes rattr, Model m, HttpSession session) {
      String writer = (String) session.getAttribute("user_id");
      projectDto.setWriter(writer);
      System.out.println("projectDto : "+projectDto);
      try {
          if(projectService.write(projectDto) != 1) 
          
          rattr.addFlashAttribute("msg", "WRT_OK");
          return "redirect:/projectRegister";
      } catch (Exception e) {
          e.printStackTrace();
          m.addAttribute("mode", "new");                  //글쓰기 모드
          m.addAttribute("projectDto", projectDto);           //등록하려던 내용을 보여줘야 함
          m.addAttribute("msg", "WRT_ERR");
          return "projectRegisterIntro";
      }
      
  }
  
  
  private boolean loginCheck(HttpServletRequest request) {
    // TODO Auto-generated method stub
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false);        // false는 session이 없어도 새로 생성하지 않음. 반환값 null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id")!=null;
}

}
