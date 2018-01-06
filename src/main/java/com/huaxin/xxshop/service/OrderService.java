package com.huaxin.xxshop.service;

import java.util.List;
import java.util.Map;

import com.huaxin.xxshop.entity.Order;
import com.huaxin.xxshop.entity.OrderDetail;
import com.huaxin.xxshop.entity.PageBean;

/**
 * 订单对应的服务层
 * 
 * @author 没有蜡笔的小新 2015-12-29
 */
public interface OrderService {

	/**
	 * 加一个Order
	 * 
	 * @param order
	 *            需要增加的订单信息
	 * @param orderDetails
	 *            需要进行增加的订单详细的信息
	 */
	public void addOrder(Order order, List<OrderDetail> orderDetails);

	/**
	 * 更新Order和OrderDetail
	 * 
	 * @param order
	 *            需要更新的的订单信息
	 * @param orderDetails
	 *            需要进行更新的订单详细的信息
	 */
	public void updateOrder(Order order, List<OrderDetail> orderDetails);

	/**
	 * 通过参数得到一个含有Order实体类的PageBean
	 * 
	 * @param page
	 *            当前的页数
	 * @param Order
	 *            PageBean包含的实体类
	 * @return
	 */
	public PageBean<Order> getOrderByPage(int page, Order order);

	/**
	 * 查询订单的信息
	 * 
	 * @param order
	 * @return
	 */
	public Order getOrder(String id);

	/**
	 * 通过用户的id得到当前用户的所有的订单信息
	 * 
	 * @param userId
	 * @return
	 */
	public List<Order> getOrderByUserId(String userId);

	/**
	 * 通过用户的id得到相关的订单信息
	 * 
	 * @param userId
	 * @return 含有订单信息的Map<String, Object>
	 */
	public Map<String, Object> getOrderInfoByUserId(String userId);

	/**
	 * 通过Order的id来得到这个order所包含的所有的orderDetail
	 * 
	 * @param orderId
	 * @return
	 */
	public List<OrderDetail> getOrderDetailByOrderId(String orderId);

}
