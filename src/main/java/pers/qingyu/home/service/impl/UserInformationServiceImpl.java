package pers.qingyu.home.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.home.bean.UserInformationBean;
import pers.qingyu.home.dao.UserInformationDao;
import pres.qingyu.home.service.UserInformationService;

@Service
public class UserInformationServiceImpl implements UserInformationService{
	
	@Autowired
	UserInformationDao userInformationdao;

	@Override
	public UserInformationBean queryUserInformationById(String userId) {
		return userInformationdao.queryUserInformationById(userId);
	}

	@Override
	public void insertUserInformation(UserInformationBean userInformation) {
		userInformationdao.insertUserInformation(userInformation);
	}

}
