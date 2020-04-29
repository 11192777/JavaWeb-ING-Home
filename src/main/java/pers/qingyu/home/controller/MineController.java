package pers.qingyu.home.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pers.qingyu.home.ajax.bean.AjaxResult;
import pers.qingyu.home.bean.UserBean;
import pers.qingyu.home.bean.UserInformationBean;
import pres.qingyu.home.service.UserInformationService;

@Controller
@RequestMapping("mine")
public class MineController {

	@Autowired
	UserInformationService userInformationService;

	@RequestMapping("headImgUpForm")
	public String headImgUp(HttpServletRequest httpServletRequset, HttpSession session) throws IllegalStateException, IOException {
		MultipartHttpServletRequest requset = (MultipartHttpServletRequest) httpServletRequset;
		MultipartFile headImgFile = requset.getFile("headImgUpFile");
		String fileName = headImgFile.getOriginalFilename();
		
		//获取当前wen应用的文案目录
		ServletContext application = httpServletRequset.getSession().getServletContext();
		String imgSavePath = application.getRealPath("images/headImg");
		
		//获取当前用户ID
		UserBean user = (UserBean) session.getAttribute("loginUser");
		
//		UUID.randomUUID().toString();	
//		String suffix = fileName.substring(fileName.lastIndexOf("."));
		
		String suffix = ".png";
		File targetFile = new File(imgSavePath + "/" + user.getUserId() + suffix);
		
		//保存文件
		headImgFile.transferTo(targetFile);
		
		return "mine/basicInformation";
	}

	@RequestMapping("basicInformation")
	public String basicInformation() {
		return "mine/basicInformation";
	}

	@RequestMapping("addTenant")
	public String addTenant() {
		return "mine/addTenant";
	}

	@RequestMapping("myHome")
	public String myHome() {
		return "mine/myHome";
	}

	@ResponseBody
	@RequestMapping("ajax/getInformation")
	public Object getInformation(String userId) {
		AjaxResult result = new AjaxResult();

		UserInformationBean user = userInformationService.queryUserInformationById(userId);

		if (user != null) {
			result.setSuccess(true);
			result.setData(user);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@RequestMapping("addHome")
	public String addHome() {
		return "mine/addHome";
	}

	@RequestMapping("tenant")
	public String tenant() {
		return "mine/tenant";
	}

	@RequestMapping("host/step1")
	public String hostStep1() {
		return "mine/host/step1";
	}

	@RequestMapping("host/step2")
	public String hostStep2() {
		return "mine/host/step2";
	}

	@RequestMapping("host/step3")
	public String hostStep3() {
		return "mine/host/step3";
	}

	@RequestMapping("host/step4")
	public String hostStep4() {
		return "mine/host/step4";
	}
}
