package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.dto.CartListDTO;
import com.huaxin.xxshop.dto.OrderDetailListDTO;
import com.huaxin.xxshop.entity.*;
import com.huaxin.xxshop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	@Autowired
    private CartService cartService=null;


	/**
	 * 添加一条订单信息
	 * @param session
	 * @param cartListDTO
	 * @param mv
	 * @return
	 */
	@RequestMapping("/addCastOrder")
	public ModelAndView addCastOrder(HttpSession session, CartListDTO cartListDTO, ModelAndView mv) {
		String userId = ((User) session.getAttribute("user")).getId();
		List<Address> addresses = addressService.getAddress(userId);
		List<Cart> cartList = cartListDTO.getCartList();

		System.out.println("cartList.size(): " + cartList.size());
		// 取出cartList的goodsId和num
		// 然后填入orderDetailList
		//List<OrderDetail> orderDetails = orderService.addOrderDetailFromCast(cartList);
		List<OrderDetail> orderDetails = new ArrayList<>();
		for(Cart cart : cartList) {
			OrderDetail od = new OrderDetail();
			od.setGoodsId(cart.getGoodsId());
			od.setNums(cart.getNum());
			od.setGoods(goodsService.getGoodsById(od.getGoodsId()));
			orderDetails.add(od);
			// 此处删除可能为时尚早
			//System.out.println("cart.id fot delete" + cart.getId());
			cartService.deleteById(cart.getId());
		}

		mv.addObject("addresses", addresses);
		mv.addObject("orderDetails", orderDetails);
		mv.setViewName("order_add");
		return mv;
	}

	/**
	 * 快速购买
	 * @param session
	 * @param goodsId
	 * @param nums
	 * @param model
	 * @return
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

		List<Address> addresses = addressService.getAddress(userId);
		// System.out.println("hash:"+this.hashCode());
		for (OrderDetail od : orderDetails) {
			System.out.println(od.toString());
			od.setGoods(goodsService.getGoodsById(od.getGoodsId()));
		}
		model.addAttribute("addresses", addresses);
		model.addAttribute("orderDetails", orderDetails);
		return "order_add";
	}

	/**
	 * 处理提交订单的页面
	 * @param order
	 * @param orderDetailListDTO
	 * @param session
	 * @param model
	 * @return
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
		System.out.println("Generate a new order: " + order.getId());
		model.addAttribute("order", order);
		model.addAttribute("orderId",order.getId());
        return "order_submit";
	}


	/**
	 * 处理订单的直接支付
	 * @param orderId
	 * @param model
	 * @return
	 */
	@RequestMapping("/resubmit")
	public String resubmit(String orderId,	Model model) {
		Order order = orderService.getOrder(orderId);
		model.addAttribute("order", order);
		return "order_submit";
	}


	/**
	 * 列出所有的订单信息
	 * @param session
	 * @param model
	 * @return
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
	}


	/**
	 * 带有所有商品分类的分页 进行分页查询
	 * @param page
	 * @param order
	 * @param mv
	 * @return
	 */
	@RequestMapping("/listByPage")
	public ModelAndView listByPage(Integer page, Order order, ModelAndView mv) {
//		System.out.println("queryPayStatus: " + queryPayStatus + " querySendStatus: "
//							+ querySendStatus + " orderStatus: " + orderStatus);
		System.out.println("page: " + page + ", " + order);
		if (page==null || page==0) {
			page = new Integer(1);
		}

//		OrderDetail orderDetail = null;
//		if(queryPayStatus!=null && queryPayStatus!=-1) {
//			orderDetail = new OrderDetail();
//			orderDetail.setPayStatus(queryPayStatus);
//			mv.addObject("queryPayStatus",queryPayStatus);
//		}
//		if(querySendStatus!=null && querySendStatus!=-1) {
//			if(orderDetail == null) {
//				orderDetail = new OrderDetail();
//			}
//			orderDetail.setSendStatus(querySendStatus);
//			mv.addObject("querySendStatus", querySendStatus);
//		}
//		if(orderStatus!=null && !orderStatus.equals("-1")) {
//			order.setStatus(orderStatus);
//			mv.addObject("orderStatus", orderStatus);
//		}
//		order.setOrderDetail(orderDetail);
		PageBean<Order> pageBean = orderService.getOrderByPage(page, order);
		mv.addObject("pageBean", pageBean);
		System.out.println("TotalNum: " + pageBean.getTotalNum() +
				           ", TotalPage:" + pageBean.getTotalPage());
		mv.setViewName("admin/order_list");
		return mv;
	}


	/**
	 * 用户中心的首页
	 * @param session
	 * @param model
	 * @return
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

	/**
	 * 支付测试方法
	 * @return
	 */
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


	/**
	 * 进行支付
	 * ？category的goodsNum未修改
	 * @param session
	 * @param orderId
	 * @return
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

		System.out.println("User's money can be updated!");
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

		System.out.println("Ready to update order!");
		orderService.updateOrder(order, orderDetails);
        return "pay_suc";
	}

	/**
	 * 封装测试用户在线的方法
	 * @param session
	 * @return
	 */
	public boolean isOnline(HttpSession session) {
	    return  session.getAttribute("user") != null;
    }

}
