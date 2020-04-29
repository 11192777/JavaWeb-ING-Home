package pers.qingyu.home.dao;

import pers.qingyu.home.bean.UserBean;

public interface UserDao {
	
	void insertUser (UserBean user);
	UserBean queryUserById(String userId);
	UserBean verifyPasswd (UserBean user);
}
