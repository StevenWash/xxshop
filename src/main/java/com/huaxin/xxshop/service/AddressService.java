package com.huaxin.xxshop.service;

import java.util.List;

import com.huaxin.xxshop.entity.Address;

/**
 * 地址实体类对应的服务接口
 * 
 * @author 没有蜡笔的小新 2015-12-23
 */
public interface AddressService {

	/**
	 * 添加地址
	 * 
	 * @param address
	 */
	public void addAddress(Address address);

	/**
	 * 得到当前用户的所有收货地址
	 * 
	 * @param userId
	 *            当前用户的id
	 * @return 返回地址的集合
	 */
	public List<Address> getAddress(String userId);

	/**
	 * 设置当前的地址是否为默认地址
	 * 
	 * @param address
	 */
	public void setDefault(Address address);

	/**
	 * 删除地址信息
	 * 
	 * @param address
	 *            需要删除的地址实体类对象
	 */
	public void deleteAddress(Address address);

}
