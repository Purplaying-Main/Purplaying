package kr.co.purplaying.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class FooterController {

  @RequestMapping("/questions")
  public String questions() {
   
    return "questions";
  }
  
  @RequestMapping("/serviceIntroduce")
  public String serviceIntroduce() {
    
    return "serviceIntroduce";
  }
  
  
  @RequestMapping("/creationguide")
  public String creationguide() {
   
    return "creationguide";
  }
  
  
  @RequestMapping("/fundingguide")
  public String fundingguide() {
    
    return "fundingguide";
  }
  
  @RequestMapping("/termsofuse")
  public String termsofuse() {
    
    return "termsofuse";
  }
  
  @RequestMapping("/privacypolicy")
  public String privacypolicy() {
    
    return "privacypolicy";
  }
  
  
}
