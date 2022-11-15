package kr.co.purplaying.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.domain.OneononeDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.service.OneononeService;

@Controller
@RequestMapping(value = "/oneonone")
public class OneononeController {
	
	@Autowired
	OneononeService oneononeService;
	
	@PostMapping("/modify")
	public String modify(OneononeDto oneononeDto, Integer page, Integer pageSize, RedirectAttributes rattr, Model m, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		oneononeDto.setUser_id(user_id);
		
		try {
			if(oneononeService.modify(oneononeDto) != 1) {
				throw new Exception("Modify failed");
			}
			
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			rattr.addFlashAttribute("msg", "MOD_OK");
			
			return "redirect:/oneonone/list";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute(oneononeDto);
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);
			m.addAttribute("msg", "MOD_ERR");
											// 수정등록하려던 내용을 보여줌
			return "showInquiry5";
		}
		
	}
	
	
	@PostMapping("/write")
	public String write(OneononeDto oneononeDto, RedirectAttributes rattr, Model m, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		oneononeDto.setUser_id(user_id);
		
		try {
			if(oneononeService.write(oneononeDto) != 1) {
				throw new Exception("Write failed");
			}
			
			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/oneonone/list";
			
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");
			m.addAttribute("oneononeDto",oneononeDto);		// m.addAttribute("boardDto", boardDto); "boardDto" 생략가능
			m.addAttribute("msg", "WRT_ERR");
			return "showInquiry5";
		}

	}
	
	
	@RequestMapping("/write")
	public String write(Model m) {
		m.addAttribute("mode", "new");
		
		return "showInquiry5";					// board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할때는 mode = new
	}
	
	@PostMapping("/remove")
	public String remove(Integer inquiry_no, Integer page, Integer pageSize, RedirectAttributes rattr , HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		String msg = "DEL_OK";
		
		try {
			if(oneononeService.remove(inquiry_no,user_id) != 1) {
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
	public String read(Integer inquiry_no, /*Integer page, Integer pageSize,*/ SearchItem sc, Model m) {
		try {
		    OneononeDto oneononeDto = oneononeService.read(inquiry_no);
			System.out.println(oneononeDto);
//		
			m.addAttribute("oneononeDto", oneononeDto);							// 생략시 BoardDto 첫 문자를 소문자로 바꾸어 키값으로 인식

//			m.addAttribute("page", page);
//			m.addAttribute("pageSize", pageSize);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/oneonone/list";
		}
		
		return "showInquiry5";
	}
	
	
	@GetMapping("/list")
	public String list(SearchItem sc,
						Model m,
						HttpServletRequest request) {
		
		if(!loginCheck(request))
			return "redirect:/user/login?toURL="+request.getRequestURL();
		
		try {
			
//			if(page==null) page=1;
//			if(pageSize==null) pageSize=10;
		  
			
			int totalCnt = oneononeService.getSearchResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);
			
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			
			List<OneononeDto> list = oneononeService.getSearchResultPage(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "oneonone";				// 로그인 한 상태, 게시판 목록 화면으로 이동
		
	}

	/*
	 *  @GetMapping("/list")
  public String list(@RequestParam(defaultValue = "1") Integer page,
                     @RequestParam(defaultValue = "10") Integer pageSize,
                     Model m,
                     HttpServletRequest request) {
      
      try {
          
          int totalCnt = noticeService.getCount();
          m.addAttribute("totalCnt", totalCnt);
          
          PageResolver pageResolver = new PageResolver(totalCnt, page, pageSize);
          if(page < 0 || page > pageResolver.getTotalCnt())
              page = 1;
          if(pageSize < 0 || page > 50)
              pageSize = 10;
          
          Map map = new HashMap();
          map.put("offset", (page-1)*pageSize);
          map.put("pageSize", pageSize);
          
          List<NoticeDto> list = noticeService.getPage(map);
          m.addAttribute("list", list);
          m.addAttribute("pr", pageResolver);
          
          m.addAttribute("page", page);
          m.addAttribute("pageSize", pageSize);
          
      } catch (Exception e) {
          e.printStackTrace();
      }
      return "serviceCenter";                         // 로그인 한 상태, 게시판 목록 화면으로 이동
  }
	 * 
	
	 * 
	 * */
	
	
	
	
	private boolean loginCheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		// 1. 세션을 얻어서
		HttpSession session = request.getSession(false);				//false 는 session 이 없어도 새로 생성하지 않음. 반환값 null
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환
		return session != null && session.getAttribute("user_id") != null;
	}
	
	
	

}
