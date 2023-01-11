package kr.co.purplaying.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class logoutSuccessHandler implements LogoutSuccessHandler{

  @Override
  public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)throws IOException, ServletException {
    System.out.println("logoutHandler");
    response.setStatus(HttpServletResponse.SC_OK);
    response.sendRedirect("/");
  }
  
}
