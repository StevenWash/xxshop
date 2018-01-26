package com.huaxin.xxshop.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 商品分类的实体类
 * 
 * @author 没有蜡笔的小新 2015-12-24
 */
public class Category implements Serializable {
	private String id;
	private String name;
	private int goodsNum;
	//为了在得到类别的时候得到该类别下面的商品
	private List<Goods> goodses;

	public Category() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}


	public List<Goods> getGoodses() {
		return goodses;
	}

	public void setGoodses(List<Goods> goodses) {
		this.goodses = goodses;
	}

}
