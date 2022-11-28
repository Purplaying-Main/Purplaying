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
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.purplaying.dao.PaymentDao;
import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.service.ProjectService;

@Controller
public class MypageController {
  
  @Autowired
  ProjectService projectService;
  
  @Autowired
  PaymentDao paymentDao;

  @GetMapping("/mypage")
  public String list(@RequestParam(defaultValue = "1") Integer page,
                     @RequestParam(defaultValue = "10") Integer pageSize,
                     Model m,
                     HttpServletRequest request, HttpSession session,
                     ProjectDto projectDto, PaymentDto paymentDto) {
    
      if(!loginCheck(request))
        return "redirect:/login/login?toURL="+request.getRequestURL();
      
      try {
       //session.user_id 와 작성자 비교.
        String user_id = (String)session.getAttribute("user_id");
        m.addAttribute(user_id);
        
      
      int totalCnt = projectService.getCount();
      m.addAttribute("totalCnt", totalCnt);
      
      PageResolver pageResolver = new PageResolver(totalCnt, page, pageSize);
      if(page < 0 || page > pageResolver.getTotalCnt())
          page = 1;
      if(pageSize < 0 || page > 50)
          pageSize = 10;
      
      Map map = new HashMap();
      map.put("offset", (page-1)*pageSize);
      map.put("pageSize", pageSize);
      
      List<ProjectDto> list = projectService.getPage(map);
      m.addAttribute("list", list);
      System.out.println("list : "+ list);
      m.addAttribute("pr", pageResolver);
      
      m.addAttribute("page", page);
      m.addAttribute("pageSize", pageSize);
      
      List<PaymentDto> myfunding = paymentDao.myfunding(map);
      m.addAttribute("myfunding", myfunding);
      
      
      } catch (Exception e) {
      e.printStackTrace();
      }
      return "mypage";                         // 로그인 한 상태, 게시판 목록 화면으로 이동
  }

  private boolean loginCheck(HttpServletRequest request) {
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false);        // false는 session이 없어도 새로 생성하지 않음. 반환값  null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id") != null;
  }
}
