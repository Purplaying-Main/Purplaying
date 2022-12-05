package kr.co.purplaying.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.purplaying.domain.CommunityDto;
import kr.co.purplaying.service.CommunityService;

@Controller
@RequestMapping("/project/{prdt_id}")
public class CommunityController {

  @Autowired
  CommunityService communityService;

  @GetMapping("/community")
  public @ResponseBody List<CommunityDto> list(@PathVariable int prdt_id) {
    List<CommunityDto> list = null;

    try {
      list = communityService.getList(prdt_id);

      System.out.println("list =" + list);
      return list;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

  }

  @PostMapping("/community")
  @ResponseBody
  public List<CommunityDto> list2(@RequestBody CommunityDto communityDto) {
    List<CommunityDto> list = null;
    System.out.println(communityDto);

    try {
      if (communityService.insertChat(communityDto) != 1) {
        System.out.println("실패");
      }
      list = communityService.getList(communityDto.getPrdt_id());

      System.out.println("list =" + list);
      return list;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

  }
//지정된 댓글을 삭제하는 메서드
  @DeleteMapping("/communitys/{chat_no}")
  public ResponseEntity<String> remove(@PathVariable int chat_no) {

    try {
      if (communityService.remove(chat_no) != 1)
        throw new Exception("Delete failed");
      return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
    }
  }

//댓글을 수정하는 메서드
  @PatchMapping("/communitys/{chat_no}")
  public ResponseEntity<String> modify(@PathVariable Integer chat_no, @RequestBody CommunityDto dto,
      HttpSession session) {
    String chat_writer = (String) session.getAttribute("prdt_id");

    dto.setChat_writer(chat_writer);
    dto.setChat_no(chat_no);
    System.out.println("dto = " + dto);

    try {
      if (communityService.modify(dto) != 1)
        throw new Exception("Update failed");
      return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
    }
  }
}
//  @PostMapping("/communitys/{chat_no}/write")
//  public String write(CommunityDto communityDto, RedirectAttributes rattr, Model m, HttpSession session) {
//      System.out.println("dafsds ");
//      String writer = (String) session.getAttribute("chat_writer");
//      communityDto.setChat_writer(writer);
//      try {
//        if (communityService.insertChat(communityDto) != 1)
//          throw new Exception("Write failed");
//  
//        rattr.addFlashAttribute("msg", "RPL_OK");
//        return "redirect:/projectdetail";
//  
//      } catch (Exception e) {
//        e.printStackTrace();
//        m.addAttribute("mode", "new"); // 글쓰기 모드
//        m.addAttribute("communityDto", communityDto); // 등록하려던 내용을 보여줘야 함
//        m.addAttribute("msg", "RPL_ERR");
//        return "projectDetail";
//      }
//  }
//}

//
//    @GetMapping("/read")
//    public String read(int chat_serial_no, Model m) {
//      try {
//          CommunityDto communityDto = communityService.read(chat_serial_no);
//          m.addAttribute(communityDto);
//  
//      } catch (Exception e) {
//          e.printStackTrace();
//          return "redirect:/projectdetail/read";
//      }
//      
//      return "projectDetail";
//    
//    }
