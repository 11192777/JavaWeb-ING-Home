package pers.qingyu.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.qingyu.home.ajax.bean.AjaxResult;
import pers.qingyu.home.bean.TenantBean;
import pers.qingyu.home.dao.TenantDao;
import pres.qingyu.home.service.TenantService;

@Controller
@RequestMapping("tenant")
public class TenantController {

	@Autowired
	private TenantService tenantService;
	
	@ResponseBody
	@RequestMapping("ajax/addTenant")
	public Object ajaxAddTenant(TenantBean tenant){
		
		AjaxResult result = new  AjaxResult();
		
		try {
			tenantService.insertTenant(tenant);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("ajax/queryTenantList")
	public Object queryTenantList(){
		AjaxResult result = new AjaxResult();
		
		try {
			List<TenantBean> tenantList = tenantService.queryTenantList();
			result.setData(tenantList);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
}
