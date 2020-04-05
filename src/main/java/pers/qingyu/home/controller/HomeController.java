package pers.qingyu.home.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.home.ajax.bean.AjaxResult;
import pers.qingyu.home.bean.HomeBean;
import pres.qingyu.home.service.HomeService;

@Controller
@RequestMapping("home")
public class HomeController {

	@Autowired
	private HomeService homeService;
	
	@ResponseBody
	@RequestMapping("ajax/addHome")
	public Object addHome(HomeBean home){
		AjaxResult result = new AjaxResult();
		
		try {
			homeService.insertHome(home);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("ajax/queryHomeList")
	public Object queryHomeList(){
		AjaxResult result = new AjaxResult();
		
		try {
			List<HomeBean> homeList = homeService.queryHomeList();
			result.setData(homeList);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
}
