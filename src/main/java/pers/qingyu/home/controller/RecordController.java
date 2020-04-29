package pers.qingyu.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("record")
public class RecordController {

	@RequestMapping("show")
	public String showRecord() {
		return "record/show";
	}
}
