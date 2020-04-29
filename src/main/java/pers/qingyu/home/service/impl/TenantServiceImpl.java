package pers.qingyu.home.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.home.bean.TenantBean;
import pers.qingyu.home.dao.TenantDao;
import pres.qingyu.home.service.TenantService;

@Service
public class TenantServiceImpl implements TenantService{

	@Autowired
	private TenantDao tenantDao;
	
	@Override
	public void insertTenant(TenantBean tenant) {
		tenantDao.insertTenant(tenant);
	}

	@Override
	public List<TenantBean> queryTenantList() {
		return tenantDao.queryTenantList();
	}

}
