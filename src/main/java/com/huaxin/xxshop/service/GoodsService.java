package com.huaxin.xxshop.service;

import java.util.List;

import com.huaxin.xxshop.entity.Goods;
import com.huaxin.xxshop.entity.PageBean;

/**
 * 商品实体类对应的服务层接口
 * 
 * @author 没有蜡笔的小新 2015-12-26
 */
public interface GoodsService {
	/**
	 * 添加商品
	 * 
	 * @param goods
	 */
	public void addGoods(Goods goods);

	/**
	 * 得到所有的商品
	 * 
	 * @return
	 */
	public List<Goods> getGoods(Goods goods);

	/**
	 * 通过参数得到一个含有Goods实体类的PageBean
	 * 
	 * @param page
	 *            当前的页数
	 * @param goods
	 *            PageBean包含的实体类
	 * @return
	 */
	public PageBean<Goods> getGoodsByPage(int page, Goods goods);

	/**
	 * 通过商品的id得到商品的信息
	 * 
	 * @param id
	 *            商品的id
	 * @return 返回整个商品的信息
	 */
	public Goods getGoodsById(String id);

	/**
	 * 更新商品的操作
	 * 
	 * @param goods
	 *            封装的 Goods参数
	 */
	public void updateGoods(Goods goods);

	/**
	 * 通过id来删除一个商品
	 * 
	 * @param id
	 *            删除商品的id
	 */
	public void deleteGoods(Goods goods);

	/**
	 * 通过order的排序条件进行排序
	 * 
	 * @param order
	 *            排序的条件
	 * @param num
	 *            取得条数
	 * @param cateId
	 *            商品的id
	 * @return 一个带有Goods的集合
	 */
	public List<Goods> getGoodsByOrder(String order, int num, String cateId);

	/**
	 * 通过order的排序条件进行排序
	 * 
	 * @param order
	 *            排序的条件
	 * @param num
	 *            取得条数
	 * @return 一个带有Goods的集合
	 */
	public List<Goods> getGoodsBySellNum(int num);

	/**
	 * 通过order的排序条件进行排序
	 * 
	 * @param order
	 *            排序的条件
	 * @param num
	 *            取得条数
	 * @return 一个带有Goods的集合
	 */
	public List<Goods> getGoodsByRole(int num);

	/**
	 * 通过order的排序条件进行排序
	 * 
	 * @param order
	 *            排序的条件
	 * @param num
	 *            取得条数
	 * @return 一个带有Goods的集合
	 */
	public List<Goods> getGoodsBySellTime(int num);

	/**
	 * 通过分类的id来得到商品
	 * 
	 * @param cateId
	 *            某个分类的id
	 * @return 返回一个带有Goods的集合
	 */
	public List<Goods> getGoodsByCateId(String cateId);

	/**
	 * 通过一个goodsId的数组来获取一个goods的集合
	 * 
	 * @param ids
	 *            一个可变长度的参数的类型
	 * @return 返回含有Goods的集合
	 */
	public List<Goods> getGoodsByIds(String... ids);

}
