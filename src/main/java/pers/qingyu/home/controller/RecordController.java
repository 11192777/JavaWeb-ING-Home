package pers.qingyu.home.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.home.ajax.bean.AjaxResult;
import pers.qingyu.home.bean.RecordBean;
import pres.qingyu.home.service.RecordService;

@Controller
@RequestMapping("record")
public class RecordController {

	@Autowired
	private RecordService recordService;
	
	@RequestMapping("show")
	public String showRecord() {
		return "record/show";
	}

	@RequestMapping("mineRecord")
	public String record() {
		return "record/mineRecord";
	}
	
	@ResponseBody
	@RequestMapping("ajax/queryList")
	public Object queryList(){
		AjaxResult result = new AjaxResult();
		
		try {
			ArrayList<RecordBean> recordList = recordService.queryList();
			result.setData(recordList);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			e.printStackTrace();
		}
		
		return result;
	}
}
