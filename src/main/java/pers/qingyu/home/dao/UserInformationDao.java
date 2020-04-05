package pers.qingyu.home.dao;

import pers.qingyu.home.bean.UserInformationBean;

public interface UserInformationDao {
	
	UserInformationBean queryUserInformationById(String userId);

	void insertUserInformation(UserInformationBean userInformation);
}
