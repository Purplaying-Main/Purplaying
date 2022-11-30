package kr.co.purplaying.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.purplaying.domain.CommunityDto;
import kr.co.purplaying.domain.RewardDto;
import kr.co.purplaying.service.CommunityService;
import kr.co.purplaying.service.RewardService;

@Controller
@RequestMapping("comu")
public class CommunityController {

  @Autowired
  CommunityService communityService;
  Model m= null;

  @GetMapping("/community")
  @ResponseBody
  public String reward(Model m, @RequestBody int prdt_id) {
    try {
      List<CommunityDto> list_community = communityService.selectCommunity(prdt_id);
      
      System.out.println(list_community);    
      m.addAttribute("list_community",list_community);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return "community";
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
