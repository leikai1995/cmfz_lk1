package com.baizhi.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Album implements Serializable {
    private String id;
    private String title;
    private Double score;
    //播音
    private String brodcast;
    private String author;
    //简介
    private String brief;
    //上传时间
    private Date releaseTime;
    private String coverImg;
    private Integer status;
    private Integer count;
    private List<Chapter> children;

    public Album(String id, String title, Double score, String brodcast, String author, String brief, Date releaseTime, String coverImg, Integer status, Integer count, List<Chapter> children) {
        this.id = id;
        this.title = title;
        this.score = score;
        this.brodcast = brodcast;
        this.author = author;
        this.brief = brief;
        this.releaseTime = releaseTime;
        this.coverImg = coverImg;
        this.status = status;
        this.count = count;
        this.children = children;
    }

    public Album() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getBrodcast() {
        return brodcast;
    }

    public void setBrodcast(String brodcast) {
        this.brodcast = brodcast;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getCoverImg() {
        return coverImg;
    }

    public void setCoverImg(String coverImg) {
        this.coverImg = coverImg;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<Chapter> getChildren() {
        return children;
    }

    public void setChildren(List<Chapter> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Album{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", score=" + score +
                ", brodcast='" + brodcast + '\'' +
                ", author='" + author + '\'' +
                ", brief='" + brief + '\'' +
                ", releaseTime=" + releaseTime +
                ", coverImg='" + coverImg + '\'' +
                ", status=" + status +
                ", count=" + count +
                ", children=" + children +
                '}';
    }
}
