package kr.co.purplaying.security;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import kr.co.purplaying.domain.UserDto;

public class loginSuccessHandler implements AuthenticationSuccessHandler {

  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
      Authentication authentication) throws IOException, ServletException {
//      HttpSession session = request.getSession();
//      UserDto userDto_Session = (UserDto) authentication.getPrincipal();
//      userDto_Session.setUser_pwd(null);
//      session.setAttribute("UserDto", userDto_Session);
      
      RequestCache requestCache = new HttpSessionRequestCache();
      SavedRequest savedRequest = requestCache.getRequest(request, response);

      // 있을 경우 URI 등 정보를 가져와서 사용
      if (savedRequest != null) {
          String uri = savedRequest.getRedirectUrl();
          
          // 세션에 저장된 객체를 다 사용한 뒤에는 지워줘서 메모리 누수 방지
          requestCache.removeRequest(request, response);

          System.out.println(uri);
      }

      // 세션 Attribute 확인
//      Enumeration<String> list = request.getSession().getAttributeNames();
//      while (list.hasMoreElements()) {
//          System.out.println(list.nextElement());
//      }
//      System.out.println("asdfas:"+session.getAttribute("UserDto"));
//      
      response.sendRedirect("/purplaying");
  }

}
