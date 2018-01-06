package com.huaxin.xxshop.dao;

import java.util.List;
import java.util.Map;

import com.huaxin.xxshop.entity.Goods;

/**
 * 商品实体类的数据访问接口
 * 
 * @author 没有蜡笔的小新 2015-12-26
 */
public interface GoodsDao {

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
	 * 用于分页查询
	 * 
	 * @param params
	 * @return
	 */
	public List<Goods> getGoodsByPage(Map<String, Object> params);

	/**
	 * 查询商品的数量
	 * 
	 * @param goods
	 * @return
	 */
	public int getGoodsNum(Goods goods);

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
	public void deleteGoods(String id);

	/**
	 * 通过分类的id来得到商品
	 * 
	 * @param cateId
	 *            某个分类的id
	 * @param num
	 *            需要得到的商品的条数
	 * @return 返回一个带有Goods的集合
	 */
	public List<Goods> getGoodsByCateId(String cateId, int num);

	/**
	 * 通过对商品的热度进行排序，得到前若干条
	 * 
	 * @param num
	 *            得到的条数
	 * @return 返回一个带有Goods的集合
	 */
	public List<Goods> getGoodsByRole(int num);

	/**
	 * 通过对商品的推出时间进行排序，取前若干项
	 * 
	 * @param num
	 *            得到的条数
	 * @return 返回一个带有Goods的集合
	 */
	public List<Goods> getGoodsBySellTime(int num);

	/**
	 * 通过对商品的推出时间进行排序，取前若干项
	 * 
	 * @param num
	 *            得到的条数
	 * @return 返回一个带有Goods的集合
	 */
	public List<Goods> getGoodsBySellNum(int num);

	/**
	 * 通过一个goodsId的数组来获取一个goods的集合
	 * 
	 * @param ids
	 *            一个含有goodsid 的集合
	 * @return 返回含有Goods的集合
	 */
	public List<Goods> getGoodsByIds(String[] ids);

	/**
	 * 通过order的排序条件进行排序
	 * 
	 * @param order
	 *            排序的条件
	 * @param num
	 *            取得条数
	 * @return 一个带有Goods的集合
	 */
	public List<Goods> getGoodsByOrder(Map<String, Object> params);

}
