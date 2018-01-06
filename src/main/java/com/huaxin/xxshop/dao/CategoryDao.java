package com.huaxin.xxshop.dao;

import java.util.List;

import com.huaxin.xxshop.entity.Category;

/**
 * 商品的分类实体类的数据访问接口
 * 
 * @author 没有蜡笔的小新 2015-12-24
 */
public interface CategoryDao {

	/**
	 * 添一个Category实体类的对象
	 * 
	 * @param category
	 */
	public void addCategory(Category category);

	/**
	 * 得到所有的商品分类
	 * 
	 * @return 返回所有商品分类对应的集合
	 */
	public List<Category> getCategories();

	/**
	 * 通过名字得到当前的分类实体
	 * 
	 * @param name
	 *            当前的名字
	 * @return
	 */
	public int getCategoryByName(String name);

	/**
	 * 通过分类的id删除分类
	 * 
	 * @param id
	 *            分类的id
	 */
	public void deleteCategory(String id);

	/**
	 * 通过id来修改当前的商品分类的属性
	 * 
	 * @param id
	 * @param name
	 *            商品的名称
	 */
	public void updateCategory(String id, String name);

	/**
	 * 通过id来修改当前的商品分类的属性
	 * 
	 * @param id
	 * @param goodsNum
	 *            商品的数量
	 */
	public void updateGoodsNum(String id, int goodsNum);

	/**
	 * 通过类别的id来得到当前类别信息
	 * 
	 * @param id
	 *            某一个类别的id
	 * @return 返回当前类别的实体类
	 */
	public Category getCategoryById(String id);

}
