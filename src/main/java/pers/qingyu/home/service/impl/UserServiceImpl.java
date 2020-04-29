package pers.qingyu.home.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.home.bean.UserBean;
import pers.qingyu.home.dao.UserDao;
import pres.qingyu.home.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public void insertUser(UserBean user) {
		userDao.insertUser(user);
	}

	@Override
	public UserBean queryUserById(String userId) {
		return userDao.queryUserById(userId);
	}

	@Override
	public UserBean verifyPasswd(UserBean user) {
		return userDao.verifyPasswd(user);
	}

}
