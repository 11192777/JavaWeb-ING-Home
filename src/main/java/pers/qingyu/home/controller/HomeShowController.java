package pers.qingyu.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("homeShow")
public class HomeShowController {

	@RequestMapping("showHomes")
	public String showHomes(){
		return "homeShow/homeshow";
	}
}
