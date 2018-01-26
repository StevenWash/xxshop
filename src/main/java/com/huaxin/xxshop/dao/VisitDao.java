package com.huaxin.xxshop.dao;

import com.huaxin.xxshop.entity.PageBean;
import com.huaxin.xxshop.entity.Visit;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public interface VisitDao {



	public List<Visit> getAllVisit();

	public List<Visit> getVisitByPage(Map<String, Object> params);
	public int getVisitNum();
}
