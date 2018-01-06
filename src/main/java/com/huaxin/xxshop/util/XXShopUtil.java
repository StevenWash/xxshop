package com.huaxin.xxshop.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 工具类，提供常用的工具方法
 * 
 * @author 没有蜡笔的小新 2015-12-21
 */
public class XXShopUtil {

	/**
	 * 使用UUID类提供的静态方法randomUUID() 得到一个id
	 * 
	 * @return 以恶搞随机id
	 */
	public static String getId() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replace("-", "");
	}

	/**
	 * 得到当前的时间
	 * 
	 * @return
	 */
	public static String getNow() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		return sdf.format(new Date());
	}

	/**
	 * 得到商品的货号，用时间作为产生的方法
	 * @return
	 */
	public static String getGoodsNo() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssms");
		return sdf.format(new Date());
	}
}
