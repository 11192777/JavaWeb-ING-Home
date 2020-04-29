package pers.qingyu.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("housing")
public class HousingController {

	@RequestMapping("show")
	public String housingShow() {
		return "housing/show";
	}
}
