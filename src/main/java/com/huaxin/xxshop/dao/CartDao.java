package com.huaxin.xxshop.dao;

import com.huaxin.xxshop.entity.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartDao {

    /**
     * 添加购物车记录
     * @param cart
     */
    public void addCart(Cart cart);

    /**
     * 查询当前用户的所有购物车记录
     * @param userId
     * @return
     */
    public List<Cart> getCartsByUserId(String userId);

    public void deleteById(String id);
}
