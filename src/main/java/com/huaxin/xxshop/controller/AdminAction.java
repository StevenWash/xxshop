package com.huaxin.xxshop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminAction {


    /**
     * 向评论列表页面跳转
     * @return
     */
    @RequestMapping("toCommentList")
    public String toCommentList() {
        return "admin/comment_list";
    }

    /**
     * 向种类添加页面跳转
     * @return
     */
    @RequestMapping("/toCategoryAdd")
    public String toCategoryAdd() {
        return "admin/category_add";
    }
}
