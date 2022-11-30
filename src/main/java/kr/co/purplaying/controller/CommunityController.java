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
@RequestMapping("/projectdetail")
public class CommunityController {

  @Autowired
  CommunityService communityService;

  @GetMapping("/communitys")
  
  public @ResponseBody List<CommunityDto> list(int prdt_id) {
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

  @PostMapping("/communitys")
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

//  // 댓글을 등록하는 메서드
//
//  @PostMapping("/communitys")
//  public ResponseEntity<String> write(@RequestBody CommentDto dto, Integer bno,
//  HttpSession session) {
//  //로그인을 안하고 commenter 정보를 입력해줘야함;
//  String commenter="ezen";
//  
//  dto.setCommenter(commenter);
//  dto.setBno(bno);
//  System.out.println("dto = "+ dto);
//  
//  try {
//  if(service.write(dto) != 1)
//  throw new Exception("write failed");
//  return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
//  } catch (Exception e) {
//  e.printStackTrace();
//  return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
//  }
//  }

// * 

// 지정된 게시물의 모든 댓글을 가져오는 메서드

//  @GetMapping("/communitys")
//
//  @ResponseBody
//  public ResponseEntity<List<CommunityDto>> list(Integer prdt_no) {
//    List<CommunityDto> list = null;
//
//    try {
//      list = communityService.getList(prdt_no);
//
//      System.out.println("list = " + list);
//      return new ResponseEntity<List<CommunityDto>>(list, HttpStatus.OK); // 200
//
//    } catch (Exception e) {
//      e.printStackTrace();
//      return new ResponseEntity<List<CommunityDto>>(HttpStatus.BAD_REQUEST); // 400
//    }
//
//    // return list;
//  }
//}
