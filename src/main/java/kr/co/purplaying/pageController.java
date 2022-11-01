package kr.co.purplaying;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class pageController {
    //setting.jsp호출
    @RequestMapping(value="/setting", method=RequestMethod.GET)
    public String setting() {
        return "setting";
    }
    
    //serviceCenter.jsp호출
    @RequestMapping(value="/servicecenter", method=RequestMethod.GET)
    public String serviceCenter() {
        return "serviceCenter";
    }
    
    //inquiryWrite.jsp호출
    @RequestMapping(value="/inquirywrite", method=RequestMethod.GET)
    public String inquiryWrite() {
        return "inquiryWrite";
    }
    
    //showInquiry.jsp호출
    @RequestMapping(value="/showinquiry", method=RequestMethod.GET)
    public String showInquiryAnswer() {
        return "showInquiry";
    }
    
    //notice.jsp호출
    @RequestMapping(value="/notice", method=RequestMethod.GET)
    public String notice() {
        return "notice";
    }
    
    //noticeWrite.jsp호출
    @RequestMapping(value="/noticeWrite", method=RequestMethod.GET)
    public String noticeWrite() {
        return "noticeWrite";
    }
    
    //writeAnswer.jsp(Admin)호출
    @RequestMapping(value="/writeanswer", method=RequestMethod.GET)
    public String writeAnswer() {
        return "writeAnswer";
    }
    
    //projectDetail.jsp(Admin)호출
    @RequestMapping(value="/projectdetail", method=RequestMethod.GET)
    public String projectDetail() {
        return "projectDetail";
    }
    
    //payment.jsp호출
    @RequestMapping(value="/payment", method=RequestMethod.GET)
    public String payment() {
        return "payment";
    }
    
    //paymentcompleted.jsp호출
    @RequestMapping(value="/paymentcompleted", method=RequestMethod.GET)
    public String paymentCompleted() {
        return "paymentCompleted";
    }
    
    //mypage.jsp호출
    @RequestMapping(value="/mypage", method=RequestMethod.GET)
    public String mypage() {
        return "mypage";
    }
    
    //genre.jsp호출
    @RequestMapping(value="/genre", method=RequestMethod.GET)
    public String genre() {
        return "genre";
    }
    
    //genreLiterature.jsp호출
    @RequestMapping(value="/genreliterature", method=RequestMethod.GET)
    public String genreLiterature() {
        return "genreLiterature";
    }
    
    //genrePoemEssay.jsp호출
    @RequestMapping(value="/genrepoemessay", method=RequestMethod.GET)
    public String genrePoemEssay() {
        return "genrePoemEssay";
    }
    
    //genreWebtoon.jsp호출
    @RequestMapping(value="/genrewebtoon", method=RequestMethod.GET)
    public String genreWebtoon() {
        return "genreWebtoon";
    }
    
    //signIn.jsp호출
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login() {
        return "signIn";
    }
    
    //searchResult.jsp호출
    @RequestMapping(value="/searchResult", method=RequestMethod.GET)
    public String searchResult() {
        return "searchResult";
    }
    
    //profilSearch.jsp호출
    @RequestMapping(value="/creatorSearch", method=RequestMethod.GET)
    public String profilSearch() {
        return "creatorSearch";
    }
    
    //popularFunding.jsp호출
    @RequestMapping(value="/popularFunding", method=RequestMethod.GET)
    public String popularFunding() {
        return "popularFunding";
    }
    
    //newFunding.jsp호출
    @RequestMapping(value="/newFunding", method=RequestMethod.GET)
    public String newFunding() {
        return "newFunding";
    }
    
    //comingsoonFunding.jsp호출
    @RequestMapping(value="/comingsoonFunding", method=RequestMethod.GET)
    public String comingsoonFunding() {
        return "comingsoonFunding";
    }

}
