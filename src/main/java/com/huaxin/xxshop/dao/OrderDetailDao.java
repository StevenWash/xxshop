package com.huaxin.xxshop.dao;

import java.util.List;

import com.huaxin.xxshop.entity.OrderDetail;

/**
 * OrderDetail实体类对应的数据库访问接口
 * 
 * @author 没有蜡笔的小新 2015-12-29
 */
public interface OrderDetailDao {

	/**
	 * 增加一个OrderDetail对象
	 * 
	 * @param orderDetail
	 */
	public void addOrderDetail(OrderDetail orderDetail);

	/**
	 * 更新一个订单详细信息
	 * 
	 * @param orderDetail
	 */
	public void updateOrderDetail(OrderDetail orderDetail);

	/**
	 * 通过Order的id来得到这个order所包含的所有的orderDetail
	 * 
	 * @param orderId
	 * @return
	 */
	public List<OrderDetail> getOrderDetailByOrderId(String orderId);
}
