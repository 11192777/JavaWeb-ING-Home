package pers.qingyu.home.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.home.bean.HomeBean;
import pers.qingyu.home.dao.HomeDao;
import pres.qingyu.home.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeDao homeDao;

	@Override
	public void insertHome(HomeBean home) {
		homeDao.insertHome(home);
	}

	@Override
	public List<HomeBean> queryHomeList() {
		return homeDao.queryHomeList();
	}

	
	
}
