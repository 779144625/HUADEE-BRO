package com.hwadee.model;

public class NewsList {

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getNewsType() {
        return newsType;
    }

    public void setNewsType(String newsType) {
        this.newsType = newsType;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    public String getNewsTime() {
        return newsTime;
    }

    public void setNewsTime(String newsTime) {
        this.newsTime = newsTime;
    }

    private int newsId;
    private String newsType;
    private String newsContent;
    private String newsTime;

    public NewsList(String newsType, String newsContent, String newsTime, String userId, int newsId) {
        this.newsContent = newsContent;
        this.newsId = newsId;
        this.newsTime = newsTime;
        this.newsType = newsType;
    }

    public NewsList() {
    }
}
