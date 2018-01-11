package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.*;
import com.huaxin.xxshop.service.*;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 用来处理订单的Action
 * @author 没有蜡笔的小新 2015-12-29
 */
public class OrderAction implements SessionAware {

	Map<String, Object> session;

	private AddressService addressService;
	private GoodsService goodsService;
	private OrderService orderService;
	private CategoryService categoryService;
	private UserService userService;

	// 用来进行接收和传送数据
	private Order order;
	private List<Address> addresses;
	private List<OrderDetail> orderDetails;
	private List<Order> orders;
	private List<Category> categories;
	private Goods goods;
	private User user;

	private Map<String, Object> params;

	private PageBean<Order> pageBean;
	private int page = 0;

	// 用来得到用户的id
	private String userId;

	/*
	 * 添加一条订单信息
	 */
	public String add() {
		userId = ((User) session.get("user")).getId();
		addresses = addressService.getAddress(userId);
		// System.out.println("hash:"+this.hashCode());
		for (OrderDetail orderDetail : orderDetails) {

			System.out.println(orderDetail.toString());
			orderDetail.setGoods(goodsService.getGoodsById(orderDetail
					.getGoodsId()));
		}

		return "add";
	}

	/*
	 * 处理提交订单的页面
	 */
	public String submit() {
		userId = ((User) session.get("user")).getId();
		order.setUserId(userId);
		orderService.addOrder(order, orderDetails);
		return "submit";
	}

	/*
	 * 处理订单的直接支付
	 */
	public String resubmit() {
		order = orderService.getOrder(order.getId());
		return "submit";
	}

	/*
	 * 列出来所有的订单信息
	 */
	public String listByUser() {
		userId = ((User) session.get("user")).getId();
		orders = orderService.getOrderByUserId(userId);
		return "listUser";
	}

	/*
	 * 带有所有商品分类的分页 进行分页查询
	 */
	public String listByPage() {
		userId = ((User) session.get("user")).getId();
		if (page == 0) {
			page = 1;
		}
		pageBean = orderService.getOrderByPage(page, order);
		return "listAdmin";
	}

	/*
	 * 用户中心的首页
	 */
	public String uindex() {
		categories = categoryService.getCategories();
		userId = ((User) session.get("user")).getId();
		orders = orderService.getOrderByUserId(userId);
		params = orderService.getOrderInfoByUserId(userId);
		return "uindex";
	}

	/*
	 * 进行支付
	 */
	public String pay() {
		order = orderService.getOrder(order.getId());
		// 更新用户的余额信息
		user = (User) session.get("user");
		float money = (user.getMoney() - order.getTotalMoney()) <= 0 ? 0 : user
				.getMoney() - order.getTotalMoney();
		((User) session.get("user")).setMoney(money);
		userService.updateMoney(user.getId(), money);

		// 更新订单和订单详细信息，还有商品的相关信息
		order.setPayTime(new Date());
		orderDetails = orderService.getOrderDetailByOrderId(order.getId());
		for (OrderDetail orderDetail : orderDetails) {// 支付完成后将支付状态设置为1，订单状态设置为2
			System.out.println(orderDetail);
			orderDetail.setPayStatus(1);
			orderDetail.setOrderStatus(2);

			goods = goodsService.getGoodsById(orderDetail.getGoodsId());
			goods.setSellNum(goods.getSellNum() + orderDetail.getNums());
			goods.setStock(goods.getStock() - orderDetail.getNums());

			goodsService.updateGoods(goods);

		}
		orderService.updateOrder(order, orderDetails);

		return "paysuc";
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	// getter和setter
	public AddressService getAddressService() {
		return addressService;
	}

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public PageBean<Order> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Order> pageBean) {
		this.pageBean = pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Map<String, Object> getParams() {
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
