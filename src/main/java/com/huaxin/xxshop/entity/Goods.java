package com.huaxin.xxshop.entity;

import java.io.Serializable;

public class Goods implements Serializable {
	private String id;
	private String name;
	private String goodsNo;
	private String categoryId;
	private float price1;
	private float price2;
	private int stock;
	private String thumbnail;
	private String description;
	private int role;
	private int sellTime;
	private int sellNum;
	private float score;

	private Category category;

	public Goods() {
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

	public String getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public float getPrice1() {
		return price1;
	}

	public void setPrice1(float price1) {
		this.price1 = price1;
	}

	public float getPrice2() {
		return price2;
	}

	public void setPrice2(float price2) {
		this.price2 = price2;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getSellTime() {
		return sellTime;
	}

	public void setSellTime(int sellTime) {
		this.sellTime = sellTime;
	}

	public int getSellNum() {
		return sellNum;
	}

	public void setSellNum(int sellNum) {
		this.sellNum = sellNum;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Goods [id=" + id + ", name=" + name + ", goodsNo=" + goodsNo
				+ ", categoryId=" + categoryId + ", price1=" + price1
				+ ", price2=" + price2 + ", stock=" + stock + ", thumbnail="
				+ thumbnail + ", description=" + description + ", role=" + role
				+ ", sellTime=" + sellTime + ", sellNum=" + sellNum
				+ ", score=" + score + ", category=" + category + "]";
	}

}
