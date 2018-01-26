package com.huaxin.xxshop.service;

import com.huaxin.xxshop.entity.PageBean;
import com.huaxin.xxshop.entity.Visit;

import java.util.List;

/**
 * 地址实体类对应的服务接口
 * @author 没有蜡笔的小新 2015-12-23
 */
public interface VisitService {

	public List<Visit> getAllVisit();
	public PageBean<Visit> getVisitsByPage(Integer page);
}
