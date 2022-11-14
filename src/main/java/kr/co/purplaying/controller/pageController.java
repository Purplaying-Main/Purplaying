package kr.co.purplaying.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class pageController {
    

    //고객센터///////////////////////////////////////////////////////////////////////////////////////
    //serviceCenter.jsp호출
    @RequestMapping(value="/servicecenter", method=RequestMethod.GET)
    public String serviceCenter() {
        return "serviceCenter";
    }
    
    //oneonone.jsp호출
    @RequestMapping(value="/oneonone", method=RequestMethod.GET)
    public String oneonone() {
        return "oneonone";
    }
    
    //questions.jsp호출
    @RequestMapping(value="/questions", method=RequestMethod.GET)
    public String questions() {
        return "questions";
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
    
    //showInquiry2.jsp호출
    @RequestMapping(value="/showinquiry2", method=RequestMethod.GET)
    public String showInquiryAnswer2() {
        return "showInquiry2";
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
    /////////////////////////////////////////////////////////////////////////////////////////
    
    //프로젝트///////////////////////////////////////////////////////////////////////////////////////

    
    //projectregister.jsp(Admin)호출
    @RequestMapping(value="/projectregister", method=RequestMethod.GET)
    public String projectRegister() {
        return "projectRegister";
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
    /////////////////////////////////////////////////////////////////////////////////////////
    
    //회원///////////////////////////////////////////////////////////////////////////////////////
    //mypage.jsp호출
    @RequestMapping(value="/mypage", method=RequestMethod.GET)
    public String mypage() {
        return "mypage";
    }
    
    //leave.jsp호출
    @RequestMapping(value="/leave", method=RequestMethod.GET)
    public String leave() {
        return "leave";
    }
    
    //setting.jsp호출
    @RequestMapping(value="/setting", method=RequestMethod.GET)
    public String setting() {
        return "setting";
    }
    
    //signIn.jsp호출
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login() {
        return "signIn";
    }
    
    //signUp.jsp호출
    @RequestMapping(value="/signup", method=RequestMethod.GET)
    public String signUp() {
        return "signup";
    }
    
    //findaccount.jsp호출
    @RequestMapping(value="/findaccount", method=RequestMethod.GET)
    public String findAccount() {
        return "findAccount";
    }
    /////////////////////////////////////////////////////////////////////////////////////////
    
    //카데고리, 검색///////////////////////////////////////////////////////////////////////////////////////
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
    /////////////////////////////////////////////////////////////////////////////////////////
    
    //헤더연결 페이지///////////////////////////////////////////////////////////////////////////////////////
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
    /////////////////////////////////////////////////////////////////////////////////////////
    
    //푸터연결 페이지///////////////////////////////////////////////////////////////////////////////////////
    //공지사항은 최상단에 별도로 삽입함
    
    //serviceIntroduce.jsp호출
    @RequestMapping(value="/serviceIntroduce", method=RequestMethod.GET)
    public String serviceIntroduce() {
        return "serviceIntroduce";
    }
    
    //creationguide.jsp호출
    @RequestMapping(value="/creationguide", method=RequestMethod.GET)
    public String creationguide() {
        return "creationguide";
    }
    
    //fundingguide.jsp호출
    @RequestMapping(value="/fundingguide", method=RequestMethod.GET)
    public String fundingguide() {
        return "fundingguide";
    }
    
    //termsofuse.jsp호출
    @RequestMapping(value="/termsofuse", method=RequestMethod.GET)
    public String termsofuse() {
        return "termsofuse";
    }
    
    //privacypolicy.jsp호출
    @RequestMapping(value="/privacypolicy", method=RequestMethod.GET)
    public String privacypolicy() {
        return "privacypolicy";
    }

    // error
    // 첫번째 오류: 0으로 나눴으므로 500 오류를 발생시킨다.
    @GetMapping("/divide")
    public String problem(Model m) {
        int result = 1 / 0;
        m.addAttribute("serverTime", result);
        return "error";
    }

    // 두 번째 오류: @PostMapping이므로 Get 방식으로 요청 시 405 오류를 발생시킨다.
    @PostMapping("/method")
    public String method(Model m) {
        return "error";
    }


}
    
    
    /////////////////////////////////////////////////////////////////////////////////////////

