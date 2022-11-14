package kr.co.purplaying.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.domain.CommunityDto;
import kr.co.purplaying.service.CommunityService;

@Controller
@RequestMapping("/projectDetail")
public class CommunityController {

  @Autowired
  CommunityService communityService;

  @PostMapping("/write")
  public String write(CommunityDto communityDto, RedirectAttributes rattr, Model m, HttpSession session) {
    String writer = (String) session.getAttribute("id");
    communityDto.setCmnt_writer(writer);

    try {
      if (communityService.write(communityDto) != 1)
        throw new Exception("Write failed");

      rattr.addFlashAttribute("msg", "RPL_OK");
      return "redirect:/projectDetail/write";

    } catch (Exception e) {
      e.printStackTrace();
      m.addAttribute("mode", "new"); // 글쓰기 모드
      m.addAttribute("communityDto", communityDto); // 등록하려던 내용을 보여줘야 함
      m.addAttribute("msg", "RPL_ERR");
      return "projectDetail";
    }

  }

}
