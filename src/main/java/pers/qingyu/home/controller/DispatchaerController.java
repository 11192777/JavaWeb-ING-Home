package pers.qingyu.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DispatchaerController {

	@RequestMapping("main")
	public String main(){
		return "main";
	}
	
}
