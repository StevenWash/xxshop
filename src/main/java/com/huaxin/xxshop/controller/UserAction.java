package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Order;
import com.huaxin.xxshop.entity.User;
import com.huaxin.xxshop.service.OrderService;
import com.huaxin.xxshop.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * 用于处理控制前台的用户请求的Action
 * 
 * @author 没有蜡笔的小新 2015-12-22
 */

@Controller
@RequestMapping("/user")
public class UserAction {
//public class UserAction implements SessionAware {
	private UserService userService;
	private User user;
	private List<User> userList;
	private OrderService orderService;
	private Order order;

	private String recharge;

	// 定义文件变量和文件名，用来接收来自前台页面的数据
	private File avatar;
	private String avatarFileName;

	// 使用实现aware方法来获得一个session
	private Map<String, Object> session = null;

	// 在adminLogin方法中用来传递信息
	private String msg;

	/**
	 * 实现用户注册的方法
	 * @return
	 */
	@RequestMapping("/reister)
	public String reg() {
		userService.register(user);
		return "regsuc";
	}

	/**
	 * 判断是否存在当前的用户信息，用于相应Ajax的方法
	 */
	public void isexist() {
		boolean isexist = userService.isexist(user.getName());
		PrintWriter write = null;
		try {
			write = ServletActionContext.getResponse().getWriter();
			write.print(isexist);
			write.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			write.close();
		}
	}

	/**
	 * 进行登陆操作 判断当前的用户名和密码是否正确，如果验证正确还需要将
	 * 用户信息存放在session里面
	 * 
	 * @return 返回struts的对应result
	 */
	@RequestMapping("/login")
	public String login() {
		User user1 = userService.login(user.getName(), user.getPassword());
		if (user == null || user.getStatus() == 2) {
			return "loginfail";
		} else {
			user1.setStatus(1);
			userService.updateStatus(user1.getId(), user1.getStatus());
			System.out.println(user1.toString());
			session.put("user", user1);
			return "loginsuc";
		}
	}

	/**
	 * 用于进行用户登出
	 * @return 返回struts的对应result
	 */
	public String logout() {
		// 清空session
		user = ((User) session.get("user"));// 表示不在线
		user.setStatus(0);
		userService.updateStatus(user.getId(), user.getStatus());
		session.clear();
		System.out.println("用户退出了。。。。。");
		return "login";
	}

	/**
	 * 实现上传头像的功能 使用了 org.apache.commons.io.FileUtils 中的静态方法copyFile()
	 * 
	 * @return 返回struts的对应result
	 */
	public String uploadAvatar() {
		String userId = ((User) session.get("user")).getId();
		/*
		 * dir 获取当前文件存放的目录地址 suffix 用来获取当前上传的文件的扩展名
		 */
		String dir = ServletActionContext.getServletContext().getRealPath(
				"/useravatars");
		String suffix = "";
		if (avatar != null) {
			suffix = avatarFileName.substring(avatarFileName.lastIndexOf("."));
			// 组装成最后需要保存的文件的地址（包括文件的扩展名）
			File saveFile = new File(new File(dir), userId + suffix);
			try {
				// 上传文件 org.apache.commons.io.FileUtils 既可以实现将文件上传到服务器上对应的文件夹下面
				FileUtils.copyFile(avatar, saveFile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 将对应的文件地址信息存放到数据库中去
		userService.updateAvatar(userId, "useravatars/" + userId + suffix);
		((User) session.get("user"))
				.setAvatar("useravatars/" + userId + suffix);
		return "usercenter";
	}

	/*
	 * 实现在线充值的功能
	 */
	public String recharge() {
		float money = ((User) session.get("user")).getMoney()
				+ Float.parseFloat(recharge);
		((User) session.get("user")).setMoney(money);
		userService.updateMoney(((User) session.get("user")).getId(), money);
		return "rechargesuc";
	}

	/*
	 * 超级管理员的登录 注释：还有验证码的验证没有实现
	 */
	public String adminLogin() {
		User adminUser = userService.login(user.getName(), user.getPassword());
		if (adminUser == null) {
			msg = "用户名或密码不正确";
			return "adminLogin";
		}
		if (!adminUser.getRole().equals("a")) {
			msg = "您的权限不足";
			return "adminLogin";
		}
		session.put("user", adminUser);
		return "adminIndex";
	}

	/*
	 * 得到当前所有的用户信息，并显示到用户的信息栏中
	 */
	public String member() {
		userList = userService.getAllUser();
		return "member";
	}

	/*
	 * 删除一个用户
	 */
	public String delete() {
		String id = user.getId();
		if (userService.getUser(id) != null) {
			userService.deleteUser(id);// 实际上是将用户的状态信息设置为2
		}
		return "opersuc";
	}

	/*
	 * 检验当前用户余额是否足够
	 */
	public void moneyLeftEnough() {
		user = ((User) session.get("user"));
		System.out.println(order.getId());
		order = orderService.getOrder(order.getId());
		System.out.println(order);
		PrintWriter write = null;
		try {
			write = ServletActionContext.getResponse().getWriter();
			if (order.getTotalMoney() <= user.getMoney()) {
				write.print(1);
			} else {
				write.print(0);
			}
			write.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			write.close();
		}
	}

	/* getter 和 setter方法 */
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

	public File getAvatar() {
		return avatar;
	}

	public void setAvatar(File avatar) {
		this.avatar = avatar;
	}

	public String getAvatarFileName() {
		return avatarFileName;
	}

	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}

	public String getRecharge() {
		return recharge;
	}

	public void setRecharge(String recharge) {
		this.recharge = recharge;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
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

//	@Override
//	public void setSession(Map<String, Object> arg0) {
//		// TODO Auto-generated method stub
//		this.session = arg0;
//	}
}
