package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.User;
import com.huaxin.xxshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminAction {
    @Autowired
    private UserService userService = null;

    @RequestMapping("/authorityList")
    public ModelAndView authorityList(ModelAndView mv) {
        List<User> userList = userService.getAllUser();
        // 全部都返回还是只返回管理员
        mv.addObject("userList", userList);
        mv.setViewName("/admin/authority_list");
        return mv;
    }

    @RequestMapping("/memberUpdate")
    public ModelAndView memberUpdate(String memberId, ModelAndView mv) {
        User member = userService.getUser(memberId);
        mv.addObject("member", member);
        mv.setViewName("admin/member_update");
        return mv;
    }

    @RequestMapping("/memberUpdateOper")
    public ModelAndView memberUpdateOper(Integer status, String memberId, String password,
                                         String role, ModelAndView mv) {
        System.out.println("password: " + password + ", role:" + role + ", status:" + status);
//        User member = userService.getUser(memberId);
//        member.setPassword(password);
//        member.setRole(role);
//        member.setStatus(status);
        userService.updateMember(memberId, status, memberId, password, role);
//        mv.addObject("member", member);
//        mv.setViewName("redirect:/user/member");
        mv.setViewName("admin/index");
        return mv;
    }

    /**
     * 向评论列表页面跳转
     * @return
     */
    @RequestMapping("toCommentList")
    public String toCommentList() {
        return "admin/comment_list";
    }

    /**
     * 向评论详细信息页面跳转
     * @return
     */
    @RequestMapping("toCommentView")
    public String toCommentView() {
        return "admin/comment_view";
    }


    /**
     * 向种类添加页面跳转
     * @return
     */
    @RequestMapping("/toCategoryAdd")
    public String toCategoryAdd() {
        return "admin/category_add";
    }

    /**
     * 向admin主页跳转
     * @return
     */
    @RequestMapping("/toIndex")
    public String toIndex() {
        return "admin/index";
    }

    /**
     * 向订单查看页面跳转
     * @return
     */
    @RequestMapping("/toOrderView")
    public String toOrderView() {
        return "admin/order_view";
    }
}
