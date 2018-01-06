package com.huaxin.xxshop.service.impl;

import java.util.List;

import com.huaxin.xxshop.dao.UserDao;
import com.huaxin.xxshop.entity.User;
import com.huaxin.xxshop.service.UserService;
import com.huaxin.xxshop.util.XXShopUtil;

/**
 * UserService 接口ude实现类
 * 
 * @author 没有蜡笔的小新 2015/12/21
 */
public class UserServiceImpl implements UserService {

	private UserDao userDao;

	// getter 和 setter
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void register(User user) {
		user.setId(XXShopUtil.getId());
		user.setRegTime(XXShopUtil.getNow());
		user.setRole("u");
		userDao.addUser(user);
	}

	@Override
	public User login(String name, String password) {
		return userDao.getUserByNameAndPwd(name, password);
	}

	@Override
	public boolean isexist(String name) {
		int num = userDao.getNumByName(name);
		return num != 0;
	}

	@Override
	public void updateAvatar(String id, String avar) {
		userDao.updateAvatar(id, avar);
	}

	@Override
	public void updateMoney(String id, float money) {
		userDao.updateMoney(id, money);
	}

	@Override
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	@Override
	public void deleteUser(String id) {
		userDao.deleteUser(id);
	}

	@Override
	public User getUser(String id) {
		return userDao.getUser(id);
	}

	@Override
	public void updateStatus(String id, int status) {
		userDao.updateStatus(id, status);
	}

}
