package pres.qingyu.home.service;

import pers.qingyu.home.bean.UserBean;

public interface UserService {
	
	void insertUser (UserBean user);
	UserBean queryUserById(String userId);
	UserBean verifyPasswd (UserBean user);
}
