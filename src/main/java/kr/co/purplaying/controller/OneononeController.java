package kr.co.purplaying.controller;

import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.AnsDto;
import kr.co.purplaying.domain.OneononeDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.AnsService;
import kr.co.purplaying.service.OneononeService;

@Controller
@RequestMapping(value = "/oneonone")
public class OneononeController {

  @Autowired
  OneononeService oneononeService;

  @Autowired
  AnsService ansService;
  
  @Autowired
  UserDao userDao;

  @PostMapping("/modify")
  public String modify(Integer inquiry_no, String inquiry_title, String inquiry_context, boolean inquiry_private,
      Integer page, Integer pageSize,
      RedirectAttributes rattr, Model m, HttpSession session) {
    String writer = (String) session.getAttribute("user_id");
    OneononeDto oneononeDto = new OneononeDto();
    oneononeDto.setWriter(writer);
    oneononeDto.setInquiry_no(inquiry_no);
    oneononeDto.setInquiry_title(inquiry_title);
    oneononeDto.setInquiry_context(inquiry_context);
    oneononeDto.setInquiry_private(inquiry_private);
    System.out.println(oneononeDto);
    try {
      if (oneononeService.modify(oneononeDto) != 1)
        throw new Exception("Modify failed");

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
      return "oneonone/modify"; // 수정등록하려던 내용을 보여줌
    }

  }

  @GetMapping("/modify")
  public String modify(Integer inquiry_no, Integer page, Integer pageSize, Model m, HttpSession session) {
    // read와 동일. inquiry_no를 불러와서 조회.
    try {

      String user_id = (String) session.getAttribute("user_id");
      m.addAttribute(user_id);

      OneononeDto oneononeDto = oneononeService.read(inquiry_no);

      m.addAttribute(oneononeDto);
      m.addAttribute("page", page);
      m.addAttribute("pageSize", pageSize);

      String writer = oneononeDto.getWriter();
      m.addAttribute(writer);

    } catch (Exception e) {
      e.printStackTrace();
//        예외발생 -> 목록으로 돌아가기
      return "redirect:/oneonone/list";
    }

    return "inquiryWrite"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할때는 mode=new
  }

  @PostMapping("/modify/ans")
  @ResponseBody
  public void modifyAns(
      @RequestBody AnsDto ansDto, Integer ans_no, Integer ans_state, String admin_id, String ans_context,
      Integer inquiry_no, Date ans_regdate,  Integer page, Integer pageSize, RedirectAttributes rattr, Model m, HttpSession session) {
    
    String admin = (String) session.getAttribute("user_id");

    System.out.println(ansDto);

    try {
      if (ansService.modifyAns(ansDto) != 1) {
        System.out.println("실패");
      }
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }
  
  
  
  /*
  @PostMapping(value="/modify/ans", produces = "application/json" )
  public void modifyAns(@RequestBody AnsDto ansDto, Integer inquiry_no, Integer page, Integer pageSize, RedirectAttributes rattr, Model m, HttpSession session) {
    
    String admin_id = (String) session.getAttribute("user_id");
    
    System.out.println(ansDto);
    
    try {
      System.out.println(ansDto);
      if (ansService.modifyAns(ansDto) != 1) {
        System.out.println("실패");
      }
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
  }
  */
  
  
  
  @PostMapping("/write/reg")
  public String write(OneononeDto oneononeDto, RedirectAttributes rattr, Model m, HttpSession session) {
    String writer = (String) session.getAttribute("user_id");
    oneononeDto.setWriter(writer);

    try {
      int writeResult = oneononeService.write(oneononeDto);
      if (writeResult != 1)
        throw new Exception("Write failed");

      rattr.addFlashAttribute("msg", "WRT_OK");
      return "redirect:/oneonone/list";
    } catch (Exception e) {
      e.printStackTrace();
      m.addAttribute("mode", "new"); // 글쓰기 모드
      m.addAttribute("oneononeDto", oneononeDto); // 등록하려던 내용을 보여줘야 함
      m.addAttribute("msg", "WRT_ERR");
      return "oneonone/write";
    }

  }

  @GetMapping("/write")
  public String write(Model m, HttpSession session, OneononeDto oneononeDto) {
    String writer = (String) session.getAttribute("user_id");
    oneononeDto.setWriter(writer);
    System.out.println(oneononeDto);
    m.addAttribute("mode", "new");

    return "inquiryWrite"; // 쓰기에 사용할때는 mode=new
  }

  @PostMapping("/write/ans")
  @ResponseBody
  public void writeans(@RequestBody AnsDto ansDto, Integer inquiry_no, HttpSession session) {

    String admin = (String) session.getAttribute("user_id");
    ansDto.setAdmin_id(admin);
//    ansDto.setInquiry_no(inquiry_no);
    System.out.println(ansDto);

    try {
      if (ansService.insertAns(ansDto) != 1) {
        System.out.println("실패");
      }
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  // 답변 삭제 기능
  @PostMapping("/remove/ans")
  public String removeAns(Integer ans_no, Integer inquiry_no, String admin_id, Integer page, Integer pageSize,
      RedirectAttributes rattr, HttpSession session) {

    String admin = (String) session.getAttribute("user_id");
//    ansDto.setAdmin_id(admin);
    String msg = "DEL_OK";
    System.out.println(msg);
    

    try {
      System.out.println(ans_no);
      System.out.println(admin_id);
      int del_ans = ansService.removeAns(ans_no, inquiry_no, admin_id);
      System.out.println("del_ans : " + del_ans);
//      int del_result = ansService.removeans(ans_no, admin);
      if (del_ans != 1)
        throw new Exception("Delete failed.");

    } catch (Exception e) {
      e.printStackTrace();
      msg = "DEL_ERR";
    }

    // 삭제 후 메시지가 한번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메시지가 한번만 나옴.
    // addFlashAttribute() : 한번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한번 쓰고 지워버림. 세션에도 부담이 덜함.
    rattr.addAttribute("page", page);
    rattr.addAttribute("pageSize", pageSize);
    rattr.addFlashAttribute("msg", msg);

    return "redirect:/oneonone/list";
  }

  @PostMapping("/remove")
  public String remove(Integer inquiry_no, Integer page, Integer pageSize,
      RedirectAttributes rattr, HttpSession session) {

    String writer = (String) session.getAttribute("user_id");
    String msg = "DEL_OK";

    try {
      int del_result = oneononeService.remove(inquiry_no, writer);
      System.out.println("del_result : " + del_result);
      if (del_result != 1)
        throw new Exception("Delete failed.");

    } catch (Exception e) {
      e.printStackTrace();
      msg = "DEL_ERR";
    }

    // 삭제 후 메시지가 한번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메시지가 한번만 나옴.
    // addFlashAttribute() : 한번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한번 쓰고 지워버림. 세션에도 부담이 덜함.
    rattr.addAttribute("page", page);
    rattr.addAttribute("pageSize", pageSize);
    rattr.addFlashAttribute("msg", msg);

    return "redirect:/oneonone/list";
  }

  @GetMapping("/read")
  public String read(Integer inquiry_no, boolean user_role , Integer page, Integer pageSize, Model m, HttpSession session) {
   
    try {
      String user_id = (String) session.getAttribute("user_id");
      m.addAttribute(user_id);
      
      UserDto userDto = userDao.selectUser(user_id);
      m.addAttribute("user_role",user_role);
      System.out.println(userDto);
      AnsDto ansDto = ansService.selectAnsData(inquiry_no);
      if (ansDto == null) {
        m.addAttribute("ansState", false);
        m.addAttribute("user_role",user_role);
      } else {
        m.addAttribute("ansDto", ansDto);
        m.addAttribute("ansState", true);
        m.addAttribute("user_role",user_role);
      }
//--          System.out.println(ansDto);

      OneononeDto oneononeDto = oneononeService.read(inquiry_no);
//--         System.out.println(oneononeDto);
      System.out.println(oneononeDto);
      oneononeDto.getAnsDto();

      m.addAttribute("oneononeDto", oneononeDto);
      m.addAttribute("page", page);
      m.addAttribute("pageSize", pageSize);
      m.addAttribute("inquiry_private",oneononeDto.isInquiry_private());
      session.setAttribute("inquiry_private", oneononeDto.isInquiry_private());
      session.getAttribute("inquiry_private");
      System.out.println(session.getAttribute("inquiry_private"));
      String writer = oneononeDto.getWriter();
      m.addAttribute(writer);

    } catch (Exception e) {
      e.printStackTrace();
//        예외발생 -> 목록으로 돌아가기
      return "redirect:/oneonone/list";
    }

    return "showInquiry2";
  }

  @GetMapping("/list")
  public String list(@RequestParam(defaultValue = "1") Integer page,
      @RequestParam(defaultValue = "10") Integer pageSize,
      Model m,
      HttpServletRequest request) {

    if (!loginCheck(request)) {
      return "redirect:/user/login?toURL=/oneonone/list";
    }
    
    try {

      int totalCnt = oneononeService.getCount();
      m.addAttribute("totalCnt", totalCnt);

      PageResolver pageResolver = new PageResolver(totalCnt, page, pageSize);
      if (page < 0 || page > pageResolver.getTotalCnt())
        page = 1;
      if (pageSize < 0 || page > 50)
        pageSize = 10;

      Map map = new HashMap();
      map.put("offset", (page - 1) * pageSize);
      map.put("pageSize", pageSize);

      List<OneononeDto> list = oneononeService.getPage(map);
      m.addAttribute("list", list);
      m.addAttribute("pr", pageResolver);

      m.addAttribute("page", page);
      m.addAttribute("pageSize", pageSize);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return "oneonone"; // 로그인 한 상태, 게시판 목록 화면으로 이동
  }
  
  private boolean loginCheck(HttpServletRequest request) {
    // 1. 세션을 얻어서
    HttpSession session = request.getSession(false);                //false 는 session 이 없어도 새로 생성하지 않음. 반환값 null
    // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
    return session != null && session.getAttribute("user_id") != null;
}
  

}
