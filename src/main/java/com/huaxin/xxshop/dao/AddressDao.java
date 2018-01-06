package com.huaxin.xxshop.dao;

import java.util.List;

import com.huaxin.xxshop.entity.Address;

/**
 * 地址实体类的数据访问接口
 * 
 * @author 没有蜡笔的小新 2015-12-23
 */
public interface AddressDao {

	/**
	 * 添加一个地址
	 * 
	 * @param address
	 *            地址实体类对应的对象
	 */
	public void addAddress(Address address);

	/**
	 * 得到当前登录用户的所有收货地址
	 * 
	 * @param userId
	 *            当前在线的用户id
	 * @return 地址的集合
	 */
	public List<Address> getAddress(String userId);

	/**
	 * 将地址为id的地址信息设置为一条默认的地址信息
	 * @param id 需要设置为默认地址的id
	 */
	public void setDefault(String id);

	/**
	 * 将当前的用户所有的默认地址信息设置为非默认的地址信息
	 * @param userId 当前用户的userId
	 */
	public void setNotDefault(String userId);
	
	/**
	 * 删除地址信息
	 * @param id 当前需要删除的地址id
	 */
	public void deleteAddress(String id);

}
