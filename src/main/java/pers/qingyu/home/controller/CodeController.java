package pers.qingyu.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("code")
public class CodeController {

	@RequestMapping("codeServer")
	public String codeServer() {
		return "code/codeServer";
	}

}
