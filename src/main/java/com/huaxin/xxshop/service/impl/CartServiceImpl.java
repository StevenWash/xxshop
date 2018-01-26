package com.huaxin.xxshop.service.impl;

import com.huaxin.xxshop.dao.CartDao;
import com.huaxin.xxshop.entity.Cart;
import com.huaxin.xxshop.service.CartService;
import com.huaxin.xxshop.util.XXShopUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("cartService")
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao = null;

    /**
     * 查询当前用户的所有购物车记录
     * @param userId
     * @return
     */
    @Override
    public List<Cart> getCartsByUserId(String userId) {
        return cartDao.getCartsByUserId(userId);
    }

    /**
     *
     * @param userId
     * @param goodsId
     * @param num
     * @param price
     */
    @Override
    public void addCart(String userId, String goodsId, int num, float price) {
        Cart cart = new Cart();
        cart.setId(XXShopUtil.getId());
        cart.setUserId(userId);
        cart.setGoodsId(goodsId);
        cart.setNum(num);
        cart.setPrice(price);
        cartDao.addCart(cart);
    }

    @Override
    public void deleteById(String id) {
        cartDao.deleteById(id);
    }
}
