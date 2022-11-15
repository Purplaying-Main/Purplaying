//package kr.co.purplaying.servermsg;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.http.HttpStatus;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.ResponseStatus;
//import org.springframework.web.servlet.NoHandlerFoundException;
//
//@ControllerAdvice
//public class MyAdvice {
//
//    private Logger logger = LoggerFactory.getLogger(MyAdvice.class);
//    
//    @ExceptionHandler(Exception.class)
//    public String handleException(Exception ex, Model m) {
//        logger.error("Exception 발생 : {}", ex.getMessage());
//        m.addAttribute("msg", "죄송합니다. 서버 장애입니다. 나중에 다시 시도해 주세요");
//        return "error";
//    }
//  
//    
//    @ExceptionHandler(NoHandlerFoundException.class)
//    @ResponseStatus(value = HttpStatus.NOT_FOUND)
//    public String handle404(NoHandlerFoundException ex, Model m) {
//        logger.error("404 요청 발생", ex.getRequestURL());
//        m.addAttribute("msg", "권한이 없거나 존재하지 않는 페이지입니다.");
//        return "error";
//    }
//}