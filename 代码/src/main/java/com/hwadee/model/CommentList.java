package com.hwadee.model;

public class CommentList {


    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public int getIfSatisfied() {
        return ifSatisfied;
    }

    public void setIfSatisfied(int ifSatisfied) {
        this.ifSatisfied = ifSatisfied;
    }

    private int commentId;
    private int ifSatisfied;
    private String userId;
    private String commentContent;
    private String commentTime;


    public CommentList(int commentId, String userId,  String commentContent, String commentTime,int ifSatisfied) {
        this.commentId=commentId;
        this.userId=userId;
        this.ifSatisfied=ifSatisfied;
        this.commentContent=commentContent;
        this.commentTime=commentTime;

    }

    public CommentList(){}

}
