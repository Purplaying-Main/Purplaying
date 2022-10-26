package kr.co.purplaying;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SettingController {

	@RequestMapping(value="/setting", method=RequestMethod.GET)
	public String setting() {
		return "setting";
	}
}
