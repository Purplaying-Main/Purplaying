package kr.co.purplaying.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
  @ResponseBody
  public List<CommunityDto> list(int prdt_id) {
    List<CommunityDto> list = null;

    try {
      list = communityService.getList(prdt_id);

      System.out.println("list = " + list);
    } catch (Exception e) {
      e.printStackTrace();
    }

    return list;
    
    }

}

//  @PostMapping("/write")
//  public String write(CommunityDto communityDto, RedirectAttributes rattr, Model m, HttpSession session) {
//      System.out.println("dafsds ");
//      String writer = (String) session.getAttribute("chat_writer");
//      communityDto.setChat_writer(writer);
//      try {
//        if (communityService.write(communityDto) != 1)
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
//    }
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
