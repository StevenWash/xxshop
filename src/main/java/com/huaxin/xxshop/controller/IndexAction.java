package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Category;
import com.huaxin.xxshop.entity.Goods;
import com.huaxin.xxshop.service.CategoryService;
import com.huaxin.xxshop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
@Controller
public class IndexAction {
	@Autowired
	public CategoryService categoryService;
	@Autowired
	public GoodsService goodsService;

	// 用来接收数据并传递到前台页面
	public List<Category> categories;
	public List<Goods> hotGoodses;
	public List<Goods> goodsesLasted;

	@RequestMapping("/index")
	public String execute(Model model) {
		int MAX = 8;
        List<Goods> hotGoodses = goodsService.getGoodsByRole(MAX);
        List<Goods> goodsesLasted = goodsService.getGoodsBySellTime(MAX);
        List<Category> categories = categoryService.getCategoriesForIndex();
		model.addAttribute("hotGoodses", hotGoodses);
		model.addAttribute("goodsesLasted", goodsesLasted);
		model.addAttribute("categories", categories);
		return "index";
	}


	// getter和setter
	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

    public List<Goods> getHotGoodses() {
        return hotGoodses;
    }

    public void setHotGoodses(List<Goods> hotGoodses) {
        this.hotGoodses = hotGoodses;
    }

    public List<Goods> getGoodsesLasted() {
        return goodsesLasted;
    }

    public void setGoodsesLasted(List<Goods> goodsesLasted) {
        this.goodsesLasted = goodsesLasted;
    }
}
