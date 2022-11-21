package kr.co.purplaying.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//@RestController
@Controller
public class SimpleRestController {

	@GetMapping("/ajax")
	public String ajax() {

		return "ajax";
	}

	@GetMapping("/test")
	public String test() {

		return "test";
	}

}