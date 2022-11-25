package kr.co.purplaying.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.purplaying.domain.RewardDto;
import kr.co.purplaying.service.RewardService;

@Controller
@RequestMapping("pr")
public class RewardController {
  
  @Autowired
  RewardService rewardService;
  Model m= null;

  @GetMapping("/reward")
  @ResponseBody
  public String reward(Model m, @RequestBody int prdt_id) {
    try {
      List<RewardDto> list = rewardService.selectReward(prdt_id);
      
      System.out.println(list);    
      m.addAttribute("dto",list);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return "reward";
  }
    
  @PostMapping("/deletereward/{prdt_id}")
  @ResponseBody
  public List<RewardDto> delreward(@PathVariable int prdt_id, @RequestBody RewardDto rewardDto ) {
    System.out.println("ri= "+ rewardDto.getReward_id());
    try {
      if(rewardService.deleteReward(rewardDto.getReward_id()) != 1) {
        throw new Exception("Delete Failed");
      }
      rewardDto.setReward_id(0);
      List<RewardDto> dto = rewardService.selectReward(prdt_id);
      return dto;
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return null;
    }
  }
  
  
  @PostMapping("/findmodireward")
  @ResponseBody
  public RewardDto findmodireward(@RequestBody RewardDto rewardDto) {
    System.out.println(rewardDto.toString());
    try {
      RewardDto dto = rewardService.selectItem(rewardDto.getReward_id());
      return dto;
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return null;
    }
  }
  
  @PostMapping("/modireward")
  @ResponseBody
  public ResponseEntity<List<RewardDto>> modiReward(@RequestBody RewardDto rewardDto) {
    System.out.println(rewardDto.toString());
    try {
      if(rewardService.updateReward(rewardDto)!=1) {
        System.out.println("업데이트실패");
      }
      List<RewardDto> list = rewardService.selectReward(rewardDto.getPrdt_id());
      return new ResponseEntity<List<RewardDto>>(list,HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<List<RewardDto>>(HttpStatus.BAD_REQUEST);
    }
  }
  
  @PostMapping("/reward")
  @ResponseBody
  public ResponseEntity<List<RewardDto>> Reward(@RequestBody RewardDto rewardDto, Model m) {
    System.out.println(rewardDto.toString());
    try {
      if(rewardService.insertReward(rewardDto)!=1) {
        throw new Exception("insertReward err");
      }
      List<RewardDto> list_reward = rewardService.selectReward(rewardDto.getPrdt_id());
      System.out.println(list_reward);
      m.addAttribute("list_reward",list_reward);
      return new ResponseEntity<List<RewardDto>>(list_reward,HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<List<RewardDto>>(HttpStatus.BAD_REQUEST);
    }
  }
}
