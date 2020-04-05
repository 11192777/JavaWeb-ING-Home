package pers.qingyu.home.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.home.ajax.bean.AjaxResult;
import pers.qingyu.home.bean.UserBean;
import pers.qingyu.home.bean.UserInformationBean;
import pers.qingyu.home.util.FileUtil;
import pers.qingyu.home.util.MD5Util;
import pres.qingyu.home.service.UserInformationService;
import pres.qingyu.home.service.UserService;

@Controller
@RequestMapping("index")
public class IndexController {

	@Autowired
	private UserService userService;
	@Autowired
	private UserInformationService userInformationService;

	@RequestMapping("login")
	public String login() {
		return "index/login";
	}

	@RequestMapping("register")
	public String register() {
		return "index/register";
	}

	@RequestMapping("forgetPasswd")
	public String forgetPasswd() {
		return "index/forgetPasswd";
	}

	@ResponseBody
	@RequestMapping("ajax/doRegister")
	public Object doRegister(UserBean user) {

		AjaxResult result = new AjaxResult();

		if (userService.queryUserById(user.getUserId()) != null) {
			result.setSuccess(false);
		} else {
			try {
				FileUtil.fileCopy(UserInformationBean.DEFAULT_HEADING_IMG + "default.png",
						UserInformationBean.DEFAULT_HEADING_IMG + user.getUserId() + ".png");
				UserInformationBean userInformation = new UserInformationBean(user.getUserId(), "",
						"${APP_PATH}/images/headImg/" + user.getUserId() + ".png", "", 0, "", "", "");
				userInformationService.insertUserInformation(userInformation);
				
				user.setUserPasswd(MD5Util.digest(user.getUserPasswd()));
				userService.insertUser(user);
				result.setSuccess(true);
			} catch (IOException e) {
				System.out.println(UserInformationBean.DEFAULT_HEADING_IMG);
				result.setSuccess(false);
			}
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("ajax/doLogin")
	public Object doLogin(UserBean user, HttpSession session) {

		AjaxResult result = new AjaxResult();

		user.setUserPasswd(MD5Util.digest(user.getUserPasswd()));
		if (userService.verifyPasswd(user) == null) {
			result.setSuccess(false);
		} else {
			result.setSuccess(true);
			session.setAttribute("loginUser", user);

		}
		return result;
	}
}
