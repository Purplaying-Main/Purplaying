package kr.co.purplaying.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.purplaying.service.OneononeService;

@Controller
@RequestMapping(value = "/ans")
public class AnsController {
	
	@Autowired
	OneononeService oneononeService;
		
	private boolean loginCheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		// 1. 세션을 얻어서
		HttpSession session = request.getSession(false);				//false 는 session 이 없어도 새로 생성하지 않음. 반환값 null
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환
		return session != null && session.getAttribute("user_id") != null;
	}
	

}
