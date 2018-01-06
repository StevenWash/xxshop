package com.huaxin.xxshop.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huaxin.xxshop.dao.CategoryDao;
import com.huaxin.xxshop.dao.GoodsDao;
import com.huaxin.xxshop.entity.Goods;
import com.huaxin.xxshop.entity.PageBean;
import com.huaxin.xxshop.service.GoodsService;
import com.huaxin.xxshop.util.XXShopUtil;

/**
 * 商品实体类对应的服务层实现
 * 
 * @author 没有蜡笔的小新 2015-12-26
 */
public class GoodsServiceImpl implements GoodsService {
	private GoodsDao goodsDao;
	private CategoryDao categoryDao;

	@Override
	public void addGoods(Goods goods) {
		goods.setId(XXShopUtil.getId());
		goodsDao.addGoods(goods);
		categoryDao.updateGoodsNum(goods.getCategoryId(), categoryDao
				.getCategoryById(goods.getCategoryId()).getGoodsNum() + 1);
	}

	@Override
	public List<Goods> getGoods(Goods goods) {
		return goodsDao.getGoods(goods);
	}

	@Override
	public Goods getGoodsById(String id) {
		return goodsDao.getGoodsById(id);
	}

	@Override
	public PageBean<Goods> getGoodsByPage(int page, Goods goods) {
		// 页面的大小
		int pageSize = 6;
		PageBean<Goods> pageBean = new PageBean<>();
		Map<String, Object> params = new HashMap<>();
		params.put("indexPage", (page - 1) * pageSize);
		params.put("pageSize", pageSize);
		params.put("goods", goods);

		List<Goods> data = goodsDao.getGoodsByPage(params);

		pageBean.setData(data);
		pageBean.setPage(page);
		pageBean.setPageSize(pageSize);
		pageBean.setActualPageSize(data.size());
		int totalNum = goodsDao.getGoodsNum(goods);
		pageBean.setTotalNum(totalNum);
		int totalPage = totalNum % pageSize == 0 ? totalNum / pageSize
				: totalNum / pageSize + 1;
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	@Override
	public void updateGoods(Goods goods) {
		Goods oldGoods = goodsDao.getGoodsById(goods.getId());
		oldGoods.setName(goods.getName());
		oldGoods.setStock(goods.getStock());
		oldGoods.setPrice1(goods.getPrice1());
		oldGoods.setPrice2(goods.getPrice2());
		oldGoods.setThumbnail(goods.getThumbnail());
		oldGoods.setDescription(goods.getDescription());

		goodsDao.updateGoods(oldGoods);
	}

	@Override
	public void deleteGoods(Goods goods) {
		goodsDao.deleteGoods(goods.getId());
		categoryDao.updateGoodsNum(goods.getCategoryId(), categoryDao
				.getCategoryById(goods.getCategoryId()).getGoodsNum() - 1);
	}

	@Override
	public List<Goods> getGoodsByCateId(String cateId) {
		return goodsDao.getGoodsByCateId(cateId, 6);// 6表示显示的条数为6
	}

	@Override
	public List<Goods> getGoodsByIds(String... ids) {
		return goodsDao.getGoodsByIds(ids);
	}

	@Override
	public List<Goods> getGoodsByOrder(String order, int num, String cateId) {
		Map<String, Object> params = new HashMap<>();
		params.put("order", order);
		params.put("num", num);
		params.put("cateId", cateId);
		return goodsDao.getGoodsByOrder(params);
	}

	@Override
	public List<Goods> getGoodsBySellNum(int num) {
		return goodsDao.getGoodsBySellNum(10);
	}

	@Override
	public List<Goods> getGoodsBySellTime(int num) {
		return goodsDao.getGoodsBySellTime(num);
	}

	@Override
	public List<Goods> getGoodsByRole(int num) {
		return goodsDao.getGoodsByRole(10);
	}

	// getter 和setter
	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

}
