package com.huaxin.xxshop.service.impl;

import java.util.List;

import com.huaxin.xxshop.dao.CategoryDao;
import com.huaxin.xxshop.dao.GoodsDao;
import com.huaxin.xxshop.entity.Category;
import com.huaxin.xxshop.service.CategoryService;
import com.huaxin.xxshop.util.XXShopUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 商品分类服务接口的实现
 * 
 * @author 没有蜡笔的小新 2015-12-24
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao categoryDao = null;
	@Autowired
	private GoodsDao goodsDao = null;

	@Override
	public void addCategory(Category category) {
		category.setId(XXShopUtil.getId());
		categoryDao.addCategory(category);
	}

	@Override
	public List<Category> getCategories() {
		return categoryDao.getCategories();
	}

	@Override
	public boolean getCategoryByName(String name) {
		int num = categoryDao.getCategoryByName(name);
		return num != 0;
	}

	@Override
	public void deleteCategory(String id) {
		categoryDao.deleteCategory(id);
	}

	@Override
	public void updateCategory(String id, String name) {
		categoryDao.updateCategory(id, name);
	}

	@Override
	public List<Category> getCategoriesForIndex() {
		List<Category> categories = categoryDao.getCategories();
		for (Category category : categories) {
			System.out.println("category:" + category.getId());
			category.setGoodses(goodsDao.getGoodsByCateId(category.getId(), 4));
		}
		return categories;
	}

	@Override
	public Category getCategoryById(String id) {
		return categoryDao.getCategoryById(id);
	}

	// setter 和getter
	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

}
