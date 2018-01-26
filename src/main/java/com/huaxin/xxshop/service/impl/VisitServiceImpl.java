package com.huaxin.xxshop.service.impl;


import com.huaxin.xxshop.dao.VisitDao;
import com.huaxin.xxshop.entity.PageBean;
import com.huaxin.xxshop.entity.Visit;
import com.huaxin.xxshop.service.VisitService;
import com.huaxin.xxshop.util.XXShopUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("visitService")
public class VisitServiceImpl implements VisitService {

    @Autowired
    private VisitDao visitDao = null;


    @Override
    public List<Visit> getAllVisit() {
        return visitDao.getAllVisit();
    }

    public PageBean<Visit> getVisitsByPage(Integer page) {
        int pageSize = 6;
        PageBean<Visit> pageBean = new PageBean<>();
        Map<String, Object> params = new HashMap<>();
        params.put("indexPage", (page - 1) * pageSize);
        params.put("pageSize", pageSize);

        List<Visit> data = visitDao.getVisitByPage(params);
        System.out.println(params);
        System.out.println(data);

        pageBean.setData(data);
        pageBean.setPage(page);
        pageBean.setPageSize(pageSize);
        pageBean.setActualPageSize(data.size());
        int totalNum = visitDao.getVisitNum();
        pageBean.setTotalNum(totalNum);
        int totalPage = totalNum % pageSize == 0 ? totalNum / pageSize
                : totalNum / pageSize + 1;
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }
}

