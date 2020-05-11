package pers.qingyu.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("friend")
public class FriendController {

	@RequestMapping("message")
	public String friendMessage() {
		return "friend/message";
	}
}
