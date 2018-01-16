package com.huaxin.xxshop.service.impl;

import java.util.List;

import com.huaxin.xxshop.dao.AddressDao;
import com.huaxin.xxshop.entity.Address;
import com.huaxin.xxshop.service.AddressService;
import com.huaxin.xxshop.util.XXShopUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("addressService")
public class AddressServiceImpl implements AddressService {
	@Autowired
	private AddressDao addressDao = null;

	// getter 和setter
	public AddressDao getAddressDao() {
		return addressDao;
	}

	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}

	@Override
	public void addAddress(Address address) {
		address.setId(XXShopUtil.getId());
		if (address.getIsDefault() == null) {
			// 是设置为一个约定的数，表示不是默认值
			address.setIsDefault("2");
		} else {
			addressDao.setNotDefault(address.getUserId());
		}
		addressDao.addAddress(address);
	}

	@Override
	public List<Address> getAddress(String userId) {
		return addressDao.getAddress(userId);
	}

	@Override
	public void setDefault(Address address) {
		// TODO Auto-generated method stub
		// 首先将所有的地址都设置为非默认
		addressDao.setNotDefault(address.getUserId());
		// 再判断如果操作是设置默认，则将对应的地址信息设置为默认即可，若操作是取消默认，则已经取消所有的默认
		if (address.getIsDefault().equals("1")) {
			addressDao.setDefault(address.getId());
		}
	}

	@Override
	public void deleteAddress(Address address) {
		addressDao.deleteAddress(address.getId());
	}

}
