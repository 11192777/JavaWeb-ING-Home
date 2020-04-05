package pers.qingyu.home.dao;

import java.util.ArrayList;

import pers.qingyu.home.bean.TenantBean;

public interface TenantDao {

	public void insertTenant(TenantBean tenant);

	public ArrayList<TenantBean> queryTenantList();

}
