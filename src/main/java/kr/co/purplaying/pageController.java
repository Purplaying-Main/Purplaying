package kr.co.purplaying;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class pageController {
    //setting.html호출
    @RequestMapping(value="/setting", method=RequestMethod.GET)
    public String setting() {
        return "setting";
    }
    
    //serviceCenter.html호출
    @RequestMapping(value="/servicecenter", method=RequestMethod.GET)
    public String serviceCenter() {
        return "serviceCenter";
    }
    
    //inquiryWrite.html호출
    @RequestMapping(value="/inquirywrite", method=RequestMethod.GET)
    public String inquiryWrite() {
        return "inquiryWrite";
    }
    
    //inquiryWrite.html호출
    @RequestMapping(value="/showinquiryanswer", method=RequestMethod.GET)
    public String showInquiryAnswer() {
        return "showInquiryAnswer";
    }
}
