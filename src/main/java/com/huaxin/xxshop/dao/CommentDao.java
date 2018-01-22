package com.huaxin.xxshop.dao;

import com.huaxin.xxshop.entity.Comment;
import java.util.List;

public interface CommentDao {

    /**
     * 获得针对目标Id的评论
     * @param targetId
     * @return
     */
    public List<Comment> getCommentsByTargetId(String targetId);

    /**
     * 获得传入用户的评论列表
     * @param ownerId
     * @return
     */
    public List<Comment> getCommentsByOwnerId(String ownerId);

    /**
     * 增加评价
     * @param comment
     */
    public void addComment(Comment comment);

    /**
     * 获得按时间排序的所有评价
     * 时间为按照"年月日-时分秒"格式的字符串，字符串排序即时间排序
     * @return
     */
    public List<Comment> getCommentsInOrder();

    /**
     * 按id查询评论id
     * @param commentId
     * @return
     */
    public Comment getCommentById(String commentId);
}
