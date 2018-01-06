package com.huaxin.xxshop.entity;

/**
 * 商品明细表对应的实体类
 * 
 * @author 没有蜡笔的小新 2015-12-29
 */
public class OrderDetail {
	private String id;
	private String orderId;
	private String goodsId;
	private int nums;
	private int payStatus;
	private int sendStatus;
	private int orderStatus;

	private Goods goods;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public int getNums() {
		return nums;
	}

	public void setNums(int nums) {
		this.nums = nums;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public int getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}

	public int getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(int sendStatus) {
		this.sendStatus = sendStatus;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", orderId=" + orderId + ", goodsId="
				+ goodsId + ", nums=" + nums + ", goods=" + goods
				+ ", payStatus=" + payStatus + ", sendStatus=" + sendStatus
				+ ", orderStatus=" + orderStatus + "]";
	}

}
