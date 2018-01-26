package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Category;
import com.huaxin.xxshop.entity.Goods;
import com.huaxin.xxshop.service.CategoryService;
import com.huaxin.xxshop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static org.apache.struts2.ServletActionContext.getServletContext;

@Controller
public class IndexAction {
	@Autowired
	public CategoryService categoryService;
	@Autowired
	public GoodsService goodsService;

	/**
	 *
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/index")
	public String execute(Model model, HttpSession session) {
		int MAX = 8;
        List<Goods> hotGoodses = goodsService.getGoodsByRole(MAX);
        List<Goods> goodsesLasted = goodsService.getGoodsBySellTime(MAX);
        List<Category> categories = categoryService.getCategoriesForIndex();
		model.addAttribute("hotGoodses", hotGoodses);
		model.addAttribute("goodsesLasted", goodsesLasted);
		model.addAttribute("categories", categories);

		session.setAttribute("base", session.getServletContext().getContextPath());
		session.setAttribute("site", "灵微网上商城");
		return "index";
	}
}
