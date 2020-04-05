package pers.qingyu.home.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.home.bean.UserBean;
import pers.qingyu.home.dao.UserFriendDao;
import pres.qingyu.home.service.UserFriendService;

@Service
public class UserFriendServiceImpl implements UserFriendService{

	@Autowired
	private UserFriendDao userFriendDao;
	
	@Override
	public List<UserBean> queryUserFriendList(String userId) {
		return userFriendDao.queryUserFriendList(userId);
	}

}
