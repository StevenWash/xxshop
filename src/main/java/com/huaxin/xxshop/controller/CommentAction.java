package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Comment;
import com.huaxin.xxshop.entity.User;
import com.huaxin.xxshop.service.CommentService;
import com.huaxin.xxshop.util.XXShopUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/comment")
public class CommentAction {
    @Autowired
    private CommentService commentService = null;

    @RequestMapping("/view")
    public ModelAndView view(String commentId, ModelAndView mv) {
        System.out.println(commentId);
        Comment comment = commentService.getCommentById(commentId);
        System.out.println(comment);
        mv.addObject("comment", comment);
        mv.setViewName("admin/comment_view");
        return mv;
    }

    /**
     * 列出所有评论
     * @param mv
     * @return
     */
    @RequestMapping("/list")
    public ModelAndView list(ModelAndView mv) {
        List<Comment> commentList = commentService.getComments();
        System.out.println(commentList.get(0));
        mv.addObject("commentList", commentList);
        mv.setViewName("admin/comment_list");
        return mv;
    }

    @RequestMapping("/listByUser")
    public ModelAndView listByUser(HttpSession session, ModelAndView mv) {
        String userId = ((User) session.getAttribute("user")).getId();
        List<Comment> commentList = commentService.getCommentsByOwnerId(userId);
//        System.out.println(commentList.get(0).getGoods().getName());
        mv.addObject("commentList", commentList);
        mv.setViewName("/usercenter/comment_list");
        return mv;
    }

    @RequestMapping("/getCommentsByGoodsId")
    @ResponseBody
    public Map<String, Object> getCommentsByGoodsId(String goodsId) {
//        System.out.println(goodsId);
        Map<String, Object> commentsInfo = new HashMap<>();
        List<Comment> comments = commentService.getCommentsByGoodsId(goodsId);
        commentsInfo.put("comments", comments);
        return commentsInfo;
    }

    @RequestMapping("/addComment")
    public ModelAndView addComment(HttpSession session, Comment comment,
                                   String statusNum, ModelAndView mv,
                                   String targetId, String score) {
        comment.setId(XXShopUtil.getId());
//        comment.setOwnerid("15bbe9543c474f119c6d00ed27fad6fe");
        comment.setOwnerid(((User)session.getAttribute("user")).getId());
        comment.setTargetid(targetId);
        comment.setStatusnum(Integer.parseInt(statusNum));
        comment.setScore(Integer.parseInt(score));
        comment.setCreatetime(XXShopUtil.getNow());
        System.out.println(comment);

        commentService.addComment(comment);
//        mv.setViewName("redirect:/goods_view");
        mv.addObject("goodsId", targetId);
        mv.setViewName("redirect:/goods/view");
        return mv;
    }

}
