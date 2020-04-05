package pres.qingyu.home.service;

import java.util.List;

import pers.qingyu.home.bean.UserBean;

public interface UserFriendService {

	List<UserBean> queryUserFriendList(String userId);

}
