package pres.qingyu.home.service;

import java.util.List;

import pers.qingyu.home.bean.HomeBean;

public interface HomeService {

	void insertHome(HomeBean home);

	List<HomeBean> queryHomeList();

}
