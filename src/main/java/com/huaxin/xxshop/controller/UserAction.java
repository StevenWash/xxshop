package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Goods;
import com.huaxin.xxshop.entity.Order;
import com.huaxin.xxshop.entity.User;
import com.huaxin.xxshop.service.CategoryService;
import com.huaxin.xxshop.service.GoodsService;
import com.huaxin.xxshop.service.OrderService;
import com.huaxin.xxshop.service.UserService;
import com.huaxin.xxshop.service.impl.UserServiceImpl;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * 用于处理控制前台的用户请求的Action
 * @author 没有蜡笔的小新 2015-12-22
 */

@Controller
@RequestMapping("/user")
public class UserAction {
//public class UserAction implements SessionAware {
//	@Resource(name="userService")
    @Autowired
    private UserService userService = null;
	@Autowired
    private CategoryService categoryService = null;
    @Autowired
	private GoodsService goodsService = null;

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
     * 进行登陆操作 判断当前的用户名和密码是否正确，如果验证正确还需要将
     * 用户信息存放在session里面
     * @return 返回对应result
     */
    @RequestMapping(value = "/login", method= RequestMethod.POST)
    public String login(String name, String password, HttpSession session, Model model) {
    	User user = userService.findUser(name, password);
        if (user == null || user.getStatus() == 2) {
            return "login";
        } else {
            user.setStatus(1);
            userService.updateStatus(user.getId(), user.getStatus());
            session.setAttribute("user", user);

//            int MAX = 4;
//            List<Goods> hotGoodses = goodsService.getGoodsBySellNum(MAX);
//            session.setAttribute("hotGoodses", hotGoodses);
//            List<Goods> goodsesLasted = goodsService.getGoodsBySellTime(MAX);            session.setAttribute("goodsesLasted", goodsesLasted);
//            model.addAttribute("categories", categoryService.getCategories());

            // 重定向到 index 资源
            return "redirect:/index"; // 报错："Request method 'GET' not supported"

//            return "index"; // 这样返回，session仍在??
        }
    }
//    public String login() {
//        if(userService == null) {
//            System.out.println("Still not work!");
//            userService = new UserServiceImpl();
//            return "login";
//        }
//
//        User user1 = userService.login(user.getName(), user.getPassword());
//        if (user == null || user.getStatus() == 2) {
//            return "redirect:login";
//        } else {
//            user1.setStatus(1);
//            userService.updateStatus(user1.getId(), user1.getStatus());
//            System.out.println(user1.toString());
//            session.put("user", user1);
//            // 重定向到 index 资源
//            return "redirect:index";
////			return "index";
//        }
//    }


	/**
	 * 实现用户注册的方法
	 * @return
	 */
	@RequestMapping("/register")
    public String register(User user) {
	    userService.register(user);
	    return "login";
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
//			e.printStackTrace();
		} finally {
			write.close();
		}
	}


	/**
	 * 实现上传头像的功能 使用了 org.apache.commons.io.FileUtils 中的静态方法copyFile()
	 * @return 返回struts的对应result
	 */
	@RequestMapping("uploadAvatar")
	public String uploadAvatar(HttpSession session, File avatar) {
		String userId = ((User) session.getAttribute("user")).getId();
		/*
		 * dir 获取当前文件存放的目录地址 suffix 用来获取当前上传的文件的扩展名
		 */
		String dir = ServletActionContext.getServletContext().getRealPath(
				"/useravatars");
		String suffix = "";
		if (avatar != null) {
			suffix = avatarFileName.substring(avatarFileName.lastIndexOf("."));
			// 组装成最后需要保存的文件的地址(包括文件的扩展名)
			File saveFile = new File(new File(dir), userId + suffix);
			try {
				// 上传文件 org.apache.commons.io.FileUtils 既可以实现将文件上传到服务器上对应的文件夹下面
				FileUtils.copyFile(avatar, saveFile);
			} catch (IOException e) {
				//e.printStackTrace();
			}
		}
		// 将对应的文件地址信息存放到数据库中去
		userService.updateAvatar(userId, "useravatars/" + userId + suffix);
		((User) session.getAttribute("user"))
				.setAvatar("useravatars/" + userId + suffix);
//		return "usercenter";
        return "/usercenter/index";
	}

	/*
	 * 实现在线充值的功能
	 */
	@RequestMapping("/recharge")
	public String recharge(HttpSession session) {
		float money = ((User) session.getAttribute("user")).getMoney()
				+ Float.parseFloat(recharge);
		((User) session.getAttribute("user")).setMoney(money);
		userService.updateMoney(((User) session.getAttribute("user")).getId(), money);
		return "/usercenter/account_log";
	}


    /**
     * 后台管理员登录
     * @param name 管理员用户姓名
     * @param password 管理员用户密码
     * @param captcha 登录输入验证码
     * @return 判断后，返回对应视图名
     * note 还有验证码的验证没有实现
     */
	@RequestMapping("/adminLogin")
	public String adminLogin(String name, String password, String captcha, HttpSession session) {
		// 验证码的验证似乎应该在前台比较好
	    String verifyCode = "uwv6";
	    if(!captcha.toLowerCase().equals(verifyCode)) {
	        //msg = "验证码不对";
	        return "admin/login";
        }
        User adminUser = userService.findUser(name, password);
//		User adminUser = userService.findUser(user.getName(), user.getPassword());
		if (adminUser == null) {
			//msg = "用户名或密码不正确";
			return "/admin/login";
		}
		if (!adminUser.getRole().equals("a")) {
			//msg = "您的权限不足";
			return "/admin/login";
		}
		session.setAttribute("user", adminUser);
		return "/admin/index";
	}

	/*
	 * 得到当前所有的用户信息，并显示到用户的信息栏中
	 */
	@RequestMapping("/member")
	public String member(Model model) {
        List<User> userList = userService.getAllUser();
		model.addAttribute("userList", userList);
		return "/admin/member_list";
	}

	/*
	 * 删除一个用户
	 */
	@RequestMapping("/delete")
	public String delete() {
		String id = user.getId();
		if (userService.getUser(id) != null) {
			userService.deleteUser(id);// 实际上是将用户的状态信息设置为2
		}
//		return "opersuc";
        // 重定向到 /hello 资源
        return "redirect:/user/member";
	}

	/*
	 * 检验当前用户余额是否足够
	 */
	public void moneyLeftEnough(Order order, HttpSession session) {
	    User user = ((User) session.getAttribute("user"));
		order = orderService.getOrder(order.getId());
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
		    //e.printStackTrace();
//		    e.printStackTrace();
		} finally {
			write.close();
		}
	}

    /**
     * 用户登出
     * @return 返回登录界面
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        User user = (User) session.getAttribute("user");
        user.setStatus(0); // status=0表示不在线
        userService.updateStatus(user.getId(), user.getStatus());
        session.removeAttribute("user"); // 清空session
        //System.out.println("用户退出了!");
        return "login";
    }

    /**
     * 向用户登录页面跳转
     * @return
     */
    @RequestMapping(value="/toLogin")
    public String toLogin() {
        return "login";
    }
    /**
     * 向用户注册页面跳转
     * @return
     */
    @RequestMapping(value="/toRegister")
    public String toRegister() {
        return "register";
    }
    /**
     * 向后台管理员登录页面跳转
     * @return
     */
    @RequestMapping(value="/toAdminLogin")
    public String toAdminLogin() {
        return "/admin/login";
    }

    /**
     * 向用户中心账户余额页面跳转
     * @return
     */
    @RequestMapping(value="/usercenter/toAccountLog")
    public String toAccountLog() {
        return "/usercenter/account_log";
    }
    /**
     * 向用户中心在线充值页面跳转
     * @return
     */
    @RequestMapping(value="/usercenter/toOnlineRecharge")
    public String toOnlineRecharge() {
        return "/usercenter/online_recharge";
    }

    @RequestMapping(value="/usercenter/toAvatarChange")
	public String toAvatarChange() { return "usercenter/user_avatar";}

	@RequestMapping("toCart")
	public String toCart() {
    	return "cart";
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
