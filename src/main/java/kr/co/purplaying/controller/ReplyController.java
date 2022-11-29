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
  ReplyService service;
  
  public @ResponseBody List<ReplyDto> list(int prdt_id) {
    List<ReplyDto> list = null;

    try {
      list = service.getList(prdt_id);

      System.out.println("list =" + list);
      return list;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

  }

  @PostMapping("/communitys")
  @ResponseBody
  public List<ReplyDto> list2(@RequestBody ReplyDto replyDto) {
    List<ReplyDto> list = null;
    System.out.println(replyDto);

    try {
      if (service.insertRply(replyDto) != 1) {
        System.out.println("실패");
      }
      list = service.getList(replyDto.getPrdt_id());

      System.out.println("list =" + list);
      return list;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

  }

}
