package pers.qingyu.home.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.home.ajax.bean.AjaxResult;
import pers.qingyu.home.bean.UserBean;
import pres.qingyu.home.service.UserFriendService;

@Controller
@RequestMapping("message")
public class MessageController {

	@Autowired
	private UserFriendService userFriendService;
	
	@RequestMapping("friend")
	public String friend(){
		return "message/friend/friend";
	}
	

	@RequestMapping("friend/latter")
	public String friendLatter(){
		return "message/friend/latter";
	}
	
	@RequestMapping("friend/ajax/latter")
	public String friendLatter(String receiveId, HttpSession session){
		session.setAttribute("receiveId", receiveId);
		return "message/friend/latter";
	}
	
	@RequestMapping("tenement") 	
	public String tenement(){
		return "message/tenement/tenement";
	}
	
	@RequestMapping("tenement/latter")
	public String tenementLatter(){
		return "message/friend/latter";
	}
	
	@RequestMapping("tenant")
	public String tenant(){
		return "message/tenant/tenant";
	}
	
	@RequestMapping("tenant/latter")
	public String tenantLatter(){
		return "message/tenant/latter";
	}
	
	@ResponseBody
	@RequestMapping("friend/ajax/getFriend")
	public Object getFriend(String userId){
		AjaxResult result = new AjaxResult();
		
		List<UserBean> friendList = userFriendService.queryUserFriendList(userId);
		if (friendList .size() != 0){
			result.setSuccess(true);
			result.setData(friendList);
		}else{
			result.setSuccess(false);
		}
		return result;
	}
	
}
