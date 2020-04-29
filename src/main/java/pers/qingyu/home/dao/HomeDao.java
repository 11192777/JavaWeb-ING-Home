package pers.qingyu.home.dao;

import java.util.ArrayList;

import pers.qingyu.home.bean.HomeBean;

public interface HomeDao {

	void insertHome(HomeBean home);

	ArrayList<HomeBean> queryHomeList();

}
