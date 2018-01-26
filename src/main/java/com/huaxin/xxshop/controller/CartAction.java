package com.huaxin.xxshop.controller;


import com.huaxin.xxshop.entity.Cart;
import com.huaxin.xxshop.entity.User;
import com.huaxin.xxshop.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/cart")
public class CartAction {
    @Autowired
    CartService cartService = null;


    /**
     * 删除购物车记录
     * @param cartId
     * @param mv
     * @param session
     * @return
     */
    @RequestMapping("/deleteById")
    public ModelAndView deleteById(String cartId, ModelAndView mv, HttpSession session) {
        cartService.deleteById(cartId);
        mv.setViewName("redirect:/cart/listByUser");
        return mv;
    }

    /**
     * 以用户为单位查询购物车记录
     * @param session
     * @param mv
     * @return
     */
    @RequestMapping("/listByUser")
    public ModelAndView list(HttpSession session, ModelAndView mv) {
        String userId = ((User) session.getAttribute("user")).getId();
        List<Cart> cartList = cartService.getCartsByUserId(userId);
//        System.out.println(cartList.size());
//        if(cartList.size() > 0) {
//            System.out.println(cartList.get(0));
//        }
        mv.addObject("cartList", cartList);
        mv.setViewName("cart");
        return mv;
    }

    /**
     * 增加购物车记录
     * @param session
     * @param goodsId
     * @param num
     * @param price
     * @param mv
     * @return 返回到购物车列表展示界面
     */
    @RequestMapping("/add")
    public ModelAndView addCart(HttpSession session, String goodsId,
                                Integer num, Float price, ModelAndView mv) {
//        System.out.println(goodsId + " " + num + " " + price);
        cartService.addCart(((User)session.getAttribute("user")).getId(),
                goodsId, num, price);
        // 进入之后的下单页面order/add需要goodsId和num
        mv.addObject("goodsId", goodsId);
        mv.addObject("num", num);
        mv.setViewName("redirect:/cart/listByUser");
        return mv;
    }

}
