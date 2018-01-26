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


	/**
	 * 增加地址信息
	 * @param session
	 * @param address
	 * @return
	 */
	@RequestMapping("/add")
	public String add(HttpSession session, Address address) {
		String userId = ((User) session.getAttribute("user")).getId();
		address.setUserId(userId);
		addressService.addAddress(address);
//		return "/usercenter/address_list";
        return "redirect:/usercenter/address/list";
	}

	/**
	 * 显示所有已保存的地址信息
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpSession session, Model model) {
		String userId = ((User) session.getAttribute("user")).getId();
		List<Address> addressList = addressService.getAddress(userId);
		model.addAttribute("addressList", addressList);
		return "/usercenter/address_list";
//		return "list";
	}

	/**
	 * 响应设置默认地址的方法
	 * 默认地址值："1"
	 * @param addressId
	 * @param addressIsDefault
	 * @return
	 */
    @RequestMapping("/setDefault")
	public String setDefault(String addressId, String addressIsDefault) {
        System.out.println(addressIsDefault.getClass());
        Address address = addressService.getAddressById(addressId);
        address.setIsDefault(addressIsDefault);
        addressService.setDefault(address);
//        return "/usercenter/address_list";
        return "redirect:/usercenter/address/list";
    }


	/**
	 * 响应删除地址的方法
	 * @param addressId
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(String addressId) {
        //	public String delete(HttpSession session, Address address) {
//		String userId = ((User) session.getAttribute("user")).getId();
//		address.setUserId(userId);
//		addressService.deleteAddress(address);
        // 此处考虑检验session的userId吗
        addressService.deleteAddress(addressId);
        return "redirect:/usercenter/address/list";
	}

}
