package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Address;
import com.huaxin.xxshop.entity.User;
import com.huaxin.xxshop.service.AddressService;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/usercenter/address")
public class AddressAction {
    @Autowired
    private AddressService addressService;

    // 定义一个session
	Map<String, Object> session;
	List<Address> addressList;
	private Address address;

	/*
	 * 增加地址信息
	 */
	@RequestMapping("/add")
	public String add(HttpSession session, Address address) {
		String userId = ((User) session.getAttribute("user")).getId();
		address.setUserId(userId);
		addressService.addAddress(address);
		return "/usercenter/address_list";
	}

	/*
	 * 显示所有已经保存的地址信息
	 */
	@RequestMapping("/list")
	public String list(HttpSession session, Model model) {
		String userId = ((User) session.getAttribute("user")).getId();
		List<Address> addressList = addressService.getAddress(userId);
		model.addAttribute("addressList", addressList);
		return "/usercenter/address_list";
//		return "list";
	}

	/*
	 * 响应设置默认地址的方法
	 */
    @RequestMapping("/setDefault")
	public String setDefault(HttpSession session, Address address) {
		String userId = ((User) session.getAttribute("user")).getId();
		address.setUserId(userId);
		addressService.setDefault(address);
        return "/usercenter/address_list";
    }

	/*
	 * 响应删除地址的方法
	 */
	@RequestMapping("/delete")
	public String delete(HttpSession session, Address address) {
		String userId = ((User) session.getAttribute("user")).getId();
		address.setUserId(userId);
		addressService.deleteAddress(address);
		return "/usercenter/address_list";
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public AddressService getAddressService() {
		return addressService;
	}

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}

	public List<Address> getAddressList() {
		return addressList;
	}

//	@Override
//	public void setSession(Map<String, Object> arg0) {
//		// TODO Auto-generated method stub
//		this.session = arg0;
//	}
}
