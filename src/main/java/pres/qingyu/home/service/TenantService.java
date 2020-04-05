package pres.qingyu.home.service;

import java.util.List;

import pers.qingyu.home.bean.TenantBean;

public interface TenantService {

	public void insertTenant(TenantBean tenant);

	public List<TenantBean> queryTenantList();

}
