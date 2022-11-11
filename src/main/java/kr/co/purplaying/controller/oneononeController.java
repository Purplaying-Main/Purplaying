package kr.co.purplaying.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.service.BoardService;

@Controller
@RequestMapping(value = "/oneonone")
public class oneononeController {
	
	@Autowired
	BoardService boardService;
	
	@PostMapping("/modify")
	public String modify(BoardDto boardDto, Integer page, Integer pageSize, RedirectAttributes rattr, Model m, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		boardDto.setUser_id(user_id);
		
		try {
			if(boardService.modify(boardDto) != 1) {
				throw new Exception("Modify failed");
			}
			
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			rattr.addFlashAttribute("msg", "MOD_OK");
			
			return "redirect:/oneonone/list";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute(boardDto);
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);
			m.addAttribute("msg", "MOD_ERR");
											// 수정등록하려던 내용을 보여줌
			return "showInquiry3";
		}
		
	}
	
	
	@PostMapping("/write")
	public String write(BoardDto boardDto, RedirectAttributes rattr, Model m, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		boardDto.setUser_id(user_id);
		
		try {
			if(boardService.write(boardDto) != 1) {
				throw new Exception("Write failed");
			}
			
			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/oneonone/list";
			
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");
			m.addAttribute(boardDto);		// m.addAttribute("boardDto", boardDto); "boardDto" 생략가능
			m.addAttribute("msg", "WRT_ERR");
			return "showInquiry3";
		}

	}
	
	
	@RequestMapping("/write")
	public String write(Model m) {
		m.addAttribute("mode", "new");
		
		return "showInquiry3";					// board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할때는 mode = new
	}
	
	@PostMapping("/remove")
	public String remove(Integer inquiry_no, Integer page, Integer pageSize, RedirectAttributes rattr , HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		String msg = "DEL_OK";
		
		try {
			if(boardService.remove(inquiry_no,user_id) != 1) {
				throw new Exception("Delete failed.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}
		
		// 삭제 후 메시지가 한번만 나와야 함. Model 이 아닌 RedirectAttributes 에 저장하면 메시지가 한번만 나옴
		// 	addFlashAttribute() : 한번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한번 쓰고 지워버림. 세션에도 부담이 덜함.
		rattr.addAttribute("page", page);
		rattr.addAttribute("pageSize", pageSize);
		rattr.addFlashAttribute("msg", msg);
				
		return "redirect:/oneonone/list";
	}
	
	
	@GetMapping("/read")
	public String read(Integer inquiry_no, Integer page, Integer pageSize, Model m) {
		try {
			BoardDto boardDto = boardService.read(inquiry_no);
			System.out.println(boardDto);
//			m.addAttribute("boardDto", boardDto);				// 아래 문장과 동일
			m.addAttribute(boardDto);							// 생략시 BoardDto 첫 문자를 소문자로 바꾸어 키값으로 인식

			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/oneonone/list";
		}
		
		return "showInquiry3";
	}
	
	
	@GetMapping("/list")
	public String list(SearchItem sc,
						Model m,
						HttpServletRequest request) {
		
		if(!loginCheck(request))
			return "redirect:/login/login?toURL="+request.getRequestURL();
		
		try {
			
//			if(page==null) page=1;
//			if(pageSize==null) pageSize=10;
			
			int totalCnt = boardService.getSearchResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);
			
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			
			List<BoardDto> list = boardService.getSearchResultPage(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "oneonone";				// 로그인 한 상태, 게시판 목록 화면으로 이동
		
	}

	private boolean loginCheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		// 1. 세션을 얻어서
		HttpSession session = request.getSession(false);				//false 는 session 이 없어도 새로 생성하지 않음. 반환값 null
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환
		return session != null && session.getAttribute("id") != null;
	}
	
	
	

}
