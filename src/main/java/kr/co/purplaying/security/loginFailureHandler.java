package kr.co.purplaying.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;


@Service("loginFailureHandler")
public class loginFailureHandler implements AuthenticationFailureHandler {

  @Override
  public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
      AuthenticationException exception) throws IOException, ServletException {
    
    if (exception instanceof AuthenticationServiceException) {
      request.setAttribute("LoginFailMessage", "존재하지 않는 사용자입니다.");
  
    } else if(exception instanceof BadCredentialsException) {
      request.setAttribute("LoginFailMessage", "비밀번호가 틀립니다.");
    }
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("/user/loginFail");
    dispatcher.forward(request, response);
//    response.sendRedirect("/purplaying/user/login");
    
  }

}
