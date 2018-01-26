package com.huaxin.xxshop.service;

import java.util.List;
import com.huaxin.xxshop.entity.User;
import org.springframework.stereotype.Service;

/**
 * 用户的服务接口
 * @author 没有蜡笔的小新 2015-12-21
 */
public interface UserService {

	public void addLogin(User user);
	public void updateEmail(String id, String email);
	public void updatePhoneNum(String id, String phoneNum);
	public void updatePassword(String id, String password);

	/**
	 * 用于进行用户注册的操作
	 * @param user 一个用户的实体类
	 */
	public void register(User user);

	/**
	 * 用于进行用户的登陆操作
	 * @param name 用户的登录名
	 * @param password 用户密码
	 * @return 登陆成功后返回用户的实体类对象
	 */
//	public User login(String name, String password);
    public User findUser(String name, String password);

	/**
	 * 检验用户是否存在
	 * @param name 通过名字
	 * @return 返回true or false
	 */
	public boolean isexist(String name);

	/**
	 * 通过id修改用户的头像
	 * @param id 用户的id
	 * @param avar 用户的头像链接
	 */
	public void updateAvatar(String id, String avar);

	/**
	 * 通过id修改用户的money
	 * @param id 用户的id
	 * @param money 需要更新的钱
	 */
	public void updateMoney(String id, float money);

	/**
	 * 得到所有的用户
	 * @return 含有所有用户的集合
	 */
	public List<User> getAllUser();

	/**
	 * 通过user的id来删除用户
	 * @param id
	 */
	public void deleteUser(String id);

	/**
	 * 通过user的id来获取用户
	 * @param id
	 */
	public User getUser(String id);

	/**
	 * 实现更新某一位用户的status
	 * @param id 当前需要更新的用户id
	 * @param status 更新之后的status
	 */
	public void updateStatus(String id, int status);

	/**
	 * 更新会员信息
	 * 可能包括：1.身份role；2.状态status；3.密码password
	 * @param memberId
	 * @param status
	 * @param memberId1
	 * @param password
	 * @param role
	 */
	public void updateMember(String memberId, Integer status, String memberId1, String password, String role);
}
