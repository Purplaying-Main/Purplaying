package kr.co.purplaying.security;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import kr.co.purplaying.domain.UserDto;

public class loginSuccessHandler implements AuthenticationSuccessHandler {
  
  private final RequestCache requestCache = new HttpSessionRequestCache();
  private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
      Authentication authentication) throws IOException, ServletException {
    
      clearSession(request);
      SavedRequest savedRequest = requestCache.getRequest(request, response);
           
      String prevPage = (String) request.getSession().getAttribute("prevPage");
      if (prevPage != null) {
          request.getSession().removeAttribute("prevPage");
      }
      String uri = "/purplaying";
       
      if (savedRequest != null) {
          uri = savedRequest.getRedirectUrl();
      } else if (prevPage != null && !prevPage.equals("")) {
          // 회원가입 - 로그인으로 넘어온 경우 "/"로 redirect
          if (prevPage.contains("/user/signup")) {
              uri = "/";
          } else {
              uri = prevPage;
          }
      }
      
      redirectStrategy.sendRedirect(request, response, uri);
      }
      
      // 로그인 실패 후 성공 시 남아있는 에러 세션 제거
      protected void clearSession(HttpServletRequest request) {
      HttpSession session = request.getSession(false);
      if (session != null) {
          session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
      }
    }

}
