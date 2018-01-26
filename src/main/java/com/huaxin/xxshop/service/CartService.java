package com.huaxin.xxshop.service;

import com.huaxin.xxshop.entity.Cart;

import java.util.List;

public interface CartService {

    /**
     * 查询当前用户的所有购物车记录
     * @param userId
     * @return
     */
    List<Cart> getCartsByUserId(String userId);

    /**
     * 添加购物车记录
     * @param userId
     * @param goodsId
     * @param num
     * @param price
     */
    public void addCart(String userId, String goodsId, int num, float price);

    /**
     * 删除购物车记录
     * @param id
     */
    public void deleteById(String id);
}
