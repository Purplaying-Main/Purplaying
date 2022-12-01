package kr.co.purplaying.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.purplaying.domain.ReplyDto;
import kr.co.purplaying.service.ReplyService;

@Controller
public class ReplyController {
  
  @Autowired
  ReplyService replyService;
  
  public @ResponseBody List<ReplyDto> list_reply(int prdt_id) {
    List<ReplyDto> list_reply = null;

    try {
      list_reply = replyService.selectReply(prdt_id);

      System.out.println("list_reply =" + list_reply);
      return list_reply;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

  }

  @PostMapping("/communitys")
  @ResponseBody
  public List<ReplyDto> list2(@RequestBody ReplyDto replyDto) {
    List<ReplyDto> list_reply = null;
    System.out.println(replyDto);

    try {
      if (replyService.insertReply(replyDto) != 1) {
        System.out.println("실패");
      }
      list_reply = replyService.selectReply(replyDto.getPrdt_id());

      System.out.println("list_reply =" + list_reply);
      return list_reply;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

  }

}
