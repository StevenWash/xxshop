package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.dto.OrderDetailListDTO;
import com.huaxin.xxshop.entity.*;
import com.huaxin.xxshop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 用来处理订单的Action
 * @author 没有蜡笔的小新 2015-12-29
 */

@Controller
@RequestMapping("/order")
public class OrderAction {
	Map<String, Object> session;

	@Autowired
	private AddressService addressService;
    @Autowired
	private GoodsService goodsService;
    @Autowired
	private OrderService orderService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
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
	@RequestMapping("/add")
	public String add(HttpSession session, String goodsId, int nums, Model model) {
//	public String add(HttpSession session, List<OrderDetail> orderDetails, Model model) {
		String userId = ((User) session.getAttribute("user")).getId();

		OrderDetail orderDetail = new OrderDetail();

		orderDetail.setGoodsId(goodsId);
		orderDetail.setNums(nums);
		List<OrderDetail> orderDetails = new ArrayList<>();
		orderDetails.add(orderDetail);
//		orderService.

		List<Address> addresses = addressService.getAddress(userId);
		// System.out.println("hash:"+this.hashCode());
		for (OrderDetail od : orderDetails) {
			System.out.println(od.toString());
			od.setGoods(goodsService.getGoodsById(od.getGoodsId()));
		}
		model.addAttribute("addresses", addresses);
		model.addAttribute("orderDetails", orderDetails);
		return "order_add";
//		return "add";
	}

	/*
	 * 处理提交订单的页面
	 */
    @RequestMapping("/submit")
	public String submit(Order order, OrderDetailListDTO orderDetailListDTO, HttpSession session,Model model) {
		String userId = ((User) session.getAttribute("user")).getId();
		List<OrderDetail> orderDetailList = orderDetailListDTO.getOrderDetailList();
		System.out.println("orderDetails.size: " + orderDetailList.size());

		for(OrderDetail orderDetail : orderDetailList) {
			System.out.println("orderDetail: " + orderDetail);
		}
		order.setUserId(userId);
		System.out.println(order);
		orderService.addOrder(order, orderDetailList);
		System.out.println(order.getId());
		model.addAttribute("order", order);
		model.addAttribute("orderId",order.getId());
//		return "submit";
        return "order_submit";
	}

	/*
	 * 处理订单的直接支付
	 */
	@RequestMapping("/resubmit")
	public String resubmit(String orderId,	Model model) {
		Order order = orderService.getOrder(orderId);
		model.addAttribute("order", order);
		return "order_submit";
//		return "submit";
	}


	/*
	 * 列出来所有的订单信息
	 */
	@RequestMapping("/listByUser")
	public String listByUser(HttpSession session, Model model) {
        // 如果用户未登录，调回主页
        if(!isOnline(session)) {
            return "redirect:/index";
        }
	    String userId = ((User) session.getAttribute("user")).getId();
        List<Order> orders = orderService.getOrderByUserId(userId);
		model.addAttribute("userId", userId);
		model.addAttribute("orders", orders);
		return "/usercenter/order_list";
//		return "listUser";
	}

	/*
	 * 带有所有商品分类的分页 进行分页查询
	 */
	@RequestMapping("/listByPage")
	public String listByPage(HttpSession session, Integer page, Model model) {
		String userId = ((User) session.getAttribute("user")).getId();
		if (page==null || page==0) {
			page = 1;
		}
        PageBean<Order> pageBean = orderService.getOrderByPage(page, order);
		model.addAttribute("pageBean", pageBean);
		return "admin/order_list";
//		return "listAdmin";
	}

	/*
	 * 用户中心的首页
	 */
	@RequestMapping("/uindex")
	public String uindex(HttpSession session, Model model) {
		// 如果用户未登录，调回主页
        if(!isOnline(session)) {
            return "redirect:/index";
        }

		String userId = ((User) session.getAttribute("user")).getId();
		List<Order> orders = orderService.getOrderByUserId(userId);
        Map<String, Object> params = orderService.getOrderInfoByUserId(userId);
        List<Category> categories = categoryService.getCategories();

        model.addAttribute("categories", categories);
		model.addAttribute("orders", orders);
		model.addAttribute("params", params);
		return "usercenter/index";
	}


	@RequestMapping("/payTest")
	public String pay() {
		String orderId = "0902753763e2482e80de9bf6112c4907";

		// 更新订单和订单详细信息，还有商品的相关信息
		Order order = orderService.getOrder(orderId);
		order.setPayTime(new Date());
		order.setStatus("2"); // 修改订单状态

		List<OrderDetail> orderDetails = orderService.getOrderDetailByOrderId(order.getId());
		System.out.println("orderDetails.size(): " + orderDetails.size());
		Goods goods = null;
		for (OrderDetail orderDetail : orderDetails) {// 支付完成后将支付状态设置为1，订单状态设置为2
			System.out.println(orderDetail);
			orderDetail.setPayStatus(1); // 支付状态改为"已支付"--"1"
			orderDetail.setOrderStatus(2); // 订单状态改为"待发货"--"2"
			System.out.println("goodsId: " + orderDetail.getGoodsId());
			goods = goodsService.getGoodsById(orderDetail.getGoodsId());
			if(goods != null) {

				goods.setSellNum(goods.getSellNum() + orderDetail.getNums());
				goods.setStock(goods.getStock() - orderDetail.getNums());
				goodsService.updateGoods(goods);
			} else {
				System.out.println("goods = null!!!");
			}
		}
		orderService.updateOrder(order, orderDetails);
		return "TestJSP";
//		return "paysuc";
	}

	/*
	 * 进行支付
	 * ？category的goodsNum未修改
	 */
	@RequestMapping("/pay")
	public String pay(HttpSession session, String orderId) {
		Order order = orderService.getOrder(orderId);
		// 这些修改业务是否一起放在service层
		// 更新用户的余额信息
		User user = (User) session.getAttribute("user");
		float money = (user.getMoney() - order.getTotalMoney()) <= 0 ?
                0 : user.getMoney() - order.getTotalMoney();
		user.setMoney(money);
		userService.updateMoney(user.getId(), money);

		// 更新订单和订单详细信息，还有商品的相关信息

		order.setPayTime(new Date());
		order.setStatus("2"); // 修改订单状态

		List<OrderDetail> orderDetails = orderService.getOrderDetailByOrderId(order.getId());
		System.out.println("orderDetails.size(): " + orderDetails.size());
		Goods goods = null;
		for (OrderDetail orderDetail : orderDetails) {// 支付完成后将支付状态设置为1，订单状态设置为2
			System.out.println(orderDetail);
			orderDetail.setPayStatus(1); // 支付状态改为"已支付"--"1"
			orderDetail.setOrderStatus(2); // 订单状态改为"待发货"--"2"
			System.out.println(orderDetail.getGoodsId());
			goods = goodsService.getGoodsById(orderDetail.getGoodsId());
			if(goods != null) {
				System.out.println("goods is changing!!!");
				goods.setSellNum(goods.getSellNum() + orderDetail.getNums());
				goods.setStock(goods.getStock() - orderDetail.getNums());
				goodsService.updateGoods(goods);
			}
		}
		orderService.updateOrder(order, orderDetails);
        return "pay_suc";
//		return "paysuc";
	}

	public boolean isOnline(HttpSession session) {
	    return  session.getAttribute("user") != null;
    }


//	@Override
//	public void setSession(Map<String, Object> arg0) {
//		this.session = arg0;
//	}

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
