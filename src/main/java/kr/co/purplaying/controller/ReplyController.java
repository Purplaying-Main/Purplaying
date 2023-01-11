package kr.co.purplaying.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.ReplyDto;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.CommunityService;
import kr.co.purplaying.service.ReplyService;

@Controller
public class ReplyController {

  @Autowired
  CommunityService service;

  @Autowired
  UserDao userDao;

  @Autowired
  ReplyService replyService;

//Reply list
  @GetMapping("/reply")
  @ResponseBody
  public ResponseEntity<List<ReplyDto>> list(int prdt_id) {
    List<ReplyDto> list = null;

    try {
      list = replyService.getRlist(prdt_id);

      System.out.println("RRRRRRRlist =" + list);
      return new ResponseEntity<List<ReplyDto>>(list, HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<List<ReplyDto>>(HttpStatus.BAD_REQUEST);
    }

  }

  @PostMapping("/reply")
  @ResponseBody
  public List<ReplyDto> list2(@RequestBody ReplyDto replyDto, int prdt_id, Model m) {
    List<ReplyDto> list_reply2 = null;
    System.out.println(replyDto);

    try {
      if (replyService.replyInsert(replyDto) != 1) {
        System.out.println("실패");
      }
      list_reply2 = replyService.getRlist(replyDto.getPrdt_id());
      System.out.println("list2 =" + list_reply2);

      return list_reply2;

    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }

  @PostMapping("/reply/insert/{rno}")
  @ResponseBody
  public ResponseEntity<List<ReplyDto>> write(@RequestBody ReplyDto rDto, RedirectAttributes rattr,
      Model m, Authentication authentication) {
    List<ReplyDto> list = null;
    UserDto udt = (UserDto)authentication.getPrincipal();
    String writer = (String) udt.getUser_id();
    String nickname = (String) udt.getUser_nickname();
    
    rDto.setChat_writer(writer);
    rDto.setUser_nickname(nickname);

    System.out.println("list13 =" + list);
    try {
      UserDto userDto = userDao.searchUser_no(writer);
      rDto.setUser_no(userDto.getUser_no());
      System.out.println(rDto);
      if (replyService.replyInsert(rDto) != 1)
        throw new Exception("Write failed");
      rattr.addFlashAttribute("msg", "RPL_OK");
      list = replyService.getRlist(rDto.getPrdt_id());
      System.out.println("Rlist = " + list);
      return new ResponseEntity<List<ReplyDto>>(list, HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      m.addAttribute("mode", "new"); // 글쓰기 모드
      m.addAttribute("communityDto", rDto); // 등록하려던 내용을 보여줘야 함
      m.addAttribute("msg", "RPL_ERR");
      return new ResponseEntity<List<ReplyDto>>(HttpStatus.BAD_REQUEST);
    }
  }
}
