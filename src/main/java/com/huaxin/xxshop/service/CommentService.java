package com.huaxin.xxshop.service;

import com.huaxin.xxshop.entity.Comment;

import java.util.List;

public interface CommentService {

    public List<Comment> getCommentsByGoodsId(String goodsId);

    public List<Comment> getCommentsByOwnerId(String ownerId);

    public void addComment(Comment comment);

    /**
     * 查询数据库中的所有评价
     * @return
     */
    public List<Comment> getComments();

    /**
     * 按评论id查找评论
     * @param commentId
     * @return
     */
    Comment getCommentById(String commentId);
}
