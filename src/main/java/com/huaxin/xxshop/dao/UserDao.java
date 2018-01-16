package com.huaxin.xxshop.dao;

import java.util.List;
import com.huaxin.xxshop.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 用户实体类 User 访问接口
 * @author 没有蜡笔的小新 2015-12-21 参数一般是基本数据类型或者实体类
 */
@Repository
public interface UserDao {

	/**
	 * 添加用户
	 * @param user 用户的实体类的对象
	 */
	public void addUser(User user);

	/**
	 * 得到所有的用户
	 * @return 含有所有用户的集合
	 */
	public List<User> getAllUser();

	/**
	 * 通过用户名和密码得到用户
	 * @param name 用户名
	 * @param password 密码
	 * @return 返回用户的实体类对象
	 */
//	public User getUserByNameAndPwd(String name, String password);
    // 当只有一个参数时，Mapper中可以不使用@Param
    // 但是有多个参数时必须用
    public User getUserByNameAndPwd(@Param("name") String name,
                                    @Param("password") String password);
	/**
	 * 通过id修改用户的头像
	 * @param id 用户的id
	 * @param avar 用户的头像链接
	 */
	public void updateAvatar(@Param("id") String id,
							 @Param("avar") String avar);

	/**
	 * 通过名字查询当前在数据库中的数量
	 * @param name 查询 的名字
	 * @return 查询到的数量
	 */
	public int getNumByName(String name);

	/**
	 * 实现更新某一位用户的money
	 * 
	 * @param id 当前需要更新的用户id
	 * @param money 更新之后的money
	 */
	public void updateMoney(@Param("id") String id,
							@Param("money") float money);

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
	public void updateStatus(@Param("id") String id,
                             @Param("status") int status);

}
