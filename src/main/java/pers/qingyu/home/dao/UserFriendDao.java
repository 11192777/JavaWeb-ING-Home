package pers.qingyu.home.dao;

import java.util.List;

import pers.qingyu.home.bean.UserBean;

public interface UserFriendDao {

	List<UserBean> queryUserFriendList(String userId);

}
