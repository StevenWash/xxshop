package com.huaxin.xxshop.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huaxin.xxshop.dao.OrderDao;
import com.huaxin.xxshop.dao.OrderDetailDao;
import com.huaxin.xxshop.entity.Order;
import com.huaxin.xxshop.entity.OrderDetail;
import com.huaxin.xxshop.entity.PageBean;
import com.huaxin.xxshop.service.OrderService;
import com.huaxin.xxshop.util.XXShopUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao = null;
	@Autowired
	private OrderDetailDao orderDetailDao = null;

	@Override
	public void addOrder(Order order, List<OrderDetail> orderDetails) {
		order.setId(XXShopUtil.getId());
		order.setOrderTime(new Date());
		order.setStatus("1");

		orderDao.addOrder(order);

		for (OrderDetail orderDetail : orderDetails) {
			orderDetail.setId(XXShopUtil.getId());
			orderDetail.setOrderId(order.getId());
			orderDetail.setPayStatus(0);
			orderDetail.setSendStatus(0);
			orderDetail.setOrderStatus(1);// 表示订单已提交
			orderDetailDao.addOrderDetail(orderDetail);
		}
	}

	@Override
	public PageBean<Order> getOrderByPage(int page, Order order) {
		// 页面的大小
		int pageSize = 6;
		PageBean<Order> pageBean = new PageBean<>();
		Map<String, Object> params = new HashMap<>();
		params.put("indexPage", (page - 1) * pageSize);
		params.put("pageSize", pageSize);
		params.put("order", order);

		List<Order> data = orderDao.getOrderByPage(params);

		pageBean.setData(data);
		pageBean.setPage(page);
		pageBean.setPageSize(pageSize);
		pageBean.setActualPageSize(data.size());

		System.out.println("order:"
				+ (order == null ? "order为空" : order.toString()));

		int totalNum = orderDao.getOrderNum(order);
		pageBean.setTotalNum(totalNum);
		int totalPage = totalNum % pageSize == 0 ? totalNum / pageSize
				: totalNum / pageSize + 1;
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	@Override
	public List<Order> getOrderByUserId(String userId) {
		return orderDao.getOrderByUserId(userId);
	}

	@Override
	public Map<String, Object> getOrderInfoByUserId(String userId) {
		Map<String, Object> params = new HashMap<>();
		List<Order> orders = orderDao.getOrderByUserId(userId);
		float orderTotalNum = orders.size();// 总交易的数量,包括所有的订单
		float totalUsed = 0;// 总花费
		int noPay = 0;// 待支付的
		int noReceive = 0;// 待接收
		for (int i = 0; i < orders.size(); i++) {
			if ((orders.get(i).getOrderDetail().getOrderStatus()) == 2) {// 2表示待发货
				totalUsed += orders.get(i).getTotalMoney();
			}
			if ((orders.get(i).getOrderDetail().getOrderStatus()) == 1) {// 2表示待支付
				noPay++;
			}
			if ((orders.get(i).getOrderDetail().getOrderStatus()) == 3) {// 2表示待接收
				noReceive++;
			}

		}
		System.out.println("total:  orderTotalNum:" + orderTotalNum
				+ "  totalUsed:" + totalUsed + "  noPay:" + noPay
				+ "  noReceive:" + noReceive);
		params.put("orderTotalNum", orderTotalNum);
		params.put("totalUsed", totalUsed);
		params.put("noPay", noPay);
		params.put("noReceive", noReceive);
		return params;
	}

	@Override
	public Order getOrder(String id) {
		return orderDao.getOrder(id);
	}

	@Override
	public void updateOrder(Order order, List<OrderDetail> orderDetails) {
		orderDao.updateOrder(order);
		for (OrderDetail orderDetail : orderDetails) {
			orderDetailDao.updateOrderDetail(orderDetail);
		}
	}

	@Override
	public List<OrderDetail> getOrderDetailByOrderId(String orderId) {
		return orderDetailDao.getOrderDetailByOrderId(orderId);
	}



	// getter 和getter
	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public OrderDetailDao getOrderDetailDao() {
		return orderDetailDao;
	}

	public void setOrderDetailDao(OrderDetailDao orderDetailDao) {
		this.orderDetailDao = orderDetailDao;
	}

}
