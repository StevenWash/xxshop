package com.huaxin.xxshop.web;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.huaxin.xxshop.entity.Address;
import com.huaxin.xxshop.entity.User;
import com.huaxin.xxshop.service.AddressService;

public class AddressAction implements SessionAware {
	// 定义一个session
	Map<String, Object> session;

	List<Address> addressList;

	private Address address;
	private AddressService addressService;

	/*
	 * 增加地址信息
	 */
	public String add() {
		String userId = ((User) session.get("user")).getId();
		address.setUserId(userId);
		addressService.addAddress(address);
		return "opersuc";
	}

	/*
	 * 显示所有已经保存的地址信息
	 */
	public String list() {
		String userId = ((User) session.get("user")).getId();
		addressList = addressService.getAddress(userId);

		return "list";
	}

	/*
	 * 响应设置默认地址的方法
	 */
	public String setDefault() {
		String userId = ((User) session.get("user")).getId();
		address.setUserId(userId);
		addressService.setDefault(address);
		return "opersuc";
	}

	/*
	 * 响应删除地址的方法
	 */
	public String delete() {
		String userId = ((User) session.get("user")).getId();
		address.setUserId(userId);
		addressService.deleteAddress(address);
		return "opersuc";
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

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = arg0;
	}

}
