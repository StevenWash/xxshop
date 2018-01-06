package com.huaxin.xxshop.dao;

import java.util.List;
import java.util.Map;

import com.huaxin.xxshop.entity.Order;

/**
 * Order实体类对应的数据访问接口
 * 
 * @author 没有蜡笔的小新 2015-12-29
 */
public interface OrderDao {

	/**
	 * 增加一个Order
	 * 
	 * @param order
	 */
	public void addOrder(Order order);

	/**
	 * 查询订单的数量
	 * 
	 * @param order
	 * @return
	 */
	public int getOrderNum(Order order);

	/**
	 * 查询订单的信息
	 * 
	 * @param order
	 * @return
	 */
	public Order getOrder(String id);

	

	/**
	 * 用于分页查询
	 * 
	 * @param params
	 * @return
	 */
	public List<Order> getOrderByPage(Map<String, Object> params);

	/**
	 * 通过用户的id得到当前用户的所有的订单信息
	 * 
	 * @param userId
	 * @return
	 */
	public List<Order> getOrderByUserId(String userId);

	/**
	 * 更新订单信息
	 * 
	 * @param order
	 */
	public void updateOrder(Order order);

}
