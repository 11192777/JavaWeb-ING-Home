package pres.qingyu.home.service;

import pers.qingyu.home.bean.UserInformationBean;

public interface UserInformationService {
	
	UserInformationBean queryUserInformationById(String userId);

	void insertUserInformation(UserInformationBean userInformation);
	
}
