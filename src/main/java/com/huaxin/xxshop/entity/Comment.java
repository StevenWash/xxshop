package com.huaxin.xxshop.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 评论实体类
 * @author 没有蜡笔的小新 2015-12-23
 */
public class Comment implements Serializable {
	private String id;
	private String ownerid;
	private String targetid;
	private int statusnum;
	private String remark;
	private String createtime;
	private int score;

	private User user;
	private Goods goods;

	public Comment() {
		super();
	}

	@Override
	public String toString() {
		return "Comment{" +
				"id='" + id + '\'' +
				", ownerid='" + ownerid + '\'' +
				", targetid='" + targetid + '\'' +
				", statusnum=" + statusnum +
				", remark='" + remark + '\'' +
				", createtime='" + createtime + '\'' +
				", score=" + score +
				", user=" + user +
				", goods=" + goods +
				'}';
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOwnerid() {
		return ownerid;
	}

	public void setOwnerid(String ownerid) {
		this.ownerid = ownerid;
	}

	public String getTargetid() {
		return targetid;
	}

	public void setTargetid(String targetid) {
		this.targetid = targetid;
	}

	public int getStatusnum() {
		return statusnum;
	}

	public void setStatusnum(int statusnum) {
		this.statusnum = statusnum;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}
