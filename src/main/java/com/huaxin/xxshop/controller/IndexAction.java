package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Category;
import com.huaxin.xxshop.entity.Goods;
import com.huaxin.xxshop.service.CategoryService;
import com.huaxin.xxshop.service.GoodsService;

import java.util.List;

public class IndexAction {
	public CategoryService categoryService;
	public GoodsService goodsService;
	// 用来接收数据并传递到前台页面
	public List<Category> categories;
	public List<Goods> goodses;
	public List<Goods> goodsesLasted;

	public String execute() {
		goodses = goodsService.getGoodsByRole(8);
		goodsesLasted = goodsService.getGoodsBySellTime(8);
		categories = categoryService.getCategoriesForIndex();
		return "index";
	}

	// getter 和setter
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

}
