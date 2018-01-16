package com.huaxin.xxshop.service;

import java.util.List;

import com.huaxin.xxshop.entity.Category;

/**
 * 商品分类的服务接口
 * @author 没有蜡笔的小新
 *
 */
public interface CategoryService {

	/**
	 * 添加一个商品分类
	 * @param category 分类的实体类对象 2015-12-24
	 */
	public void addCategory(Category category);

	/**
	 * 得到当前所有的分类
	 * @return 返回所有分类的集合
	 */
	public List<Category> getCategories();

	/**
	 * 通过名字得到当前的分类实体
	 * @param name 当前的名字
	 * @return
	 */
	public boolean getCategoryByName(String name);

	/**
	 * 通过分类的id删除分类
	 * @param id 分类的id
	 */
	public void deleteCategory(String id);

	/**
	 * 通过id来修改当前的商品分类的属性
	 * @param id 当前商品的商品idａ
	 */
	public void updateCategory(String id, String name);

	/**
	 * 主要为首页来得到Categories
	 * @return 带有Categories 的集合List
	 */
	public List<Category> getCategoriesForIndex();

	/**
	 * 通过类别的id来得到当前类别信息
	 * @param id 某一个类别的id
	 * @return 返回当前类别的实体类
	 */
	public Category getCategoryById(String id);

}
