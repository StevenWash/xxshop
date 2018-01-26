package com.huaxin.xxshop.service.impl;

import com.huaxin.xxshop.dao.CommentDao;
import com.huaxin.xxshop.entity.Comment;
import com.huaxin.xxshop.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("commentService")
public class CommentServiceImpl implements CommentService {

    /**
     * 添加评论
     * @param comment
     */
    @Override
    public void addComment(Comment comment) {
        commentDao.addComment(comment);
    }

    /**
     * 查询所有评论
     * @return
     */
    @Override
    public List<Comment> getComments() {
        return commentDao.getCommentsInOrder();
    }

    /**
     * 按id查找评论
     * @param commentId
     * @return
     */
    @Override
    public Comment getCommentById(String commentId) {
        return commentDao.getCommentById(commentId);
    }

    /**
     * 删除某条评价
     * @param commentId 评价在数据库里的id
     */
    @Override
    public void deleteById(String commentId) {
        Comment comment = commentDao.getCommentById(commentId);
        // 删除针对商品的评价(statusNum=0)
        // 需要删除对该回复的回复
        if(comment.getStatusnum() == 0) {
            List<Comment> reCommentList = commentDao.getCommentsByTargetId(commentId);
            for(Comment c : reCommentList) {
                commentDao.deleteById(c.getId());
            }
        }
        commentDao.deleteById(commentId);
    }


    @Autowired
    private CommentDao commentDao = null;

    @Override
    public List<Comment> getCommentsByGoodsId(String goodsId) {
        return commentDao.getCommentsByTargetId(goodsId);
    }

    @Override
    public List<Comment> getCommentsByOwnerId(String ownerId) {
        return commentDao.getCommentsByOwnerId(ownerId);
    }
}
