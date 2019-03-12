package com.baizhi.entity;

import java.io.Serializable;
import java.util.Date;

public class Chapter implements Serializable {
    private String id;
    private String title;
    private String url;
    private String size;
    //时常
    private String duration;
    private Date createTime;
    private String albumId;

    public Chapter(String id, String title, String url, String size, String duration, Date createTime, String albumId) {
        this.id = id;
        this.title = title;
        this.url = url;
        this.size = size;
        this.duration = duration;
        this.createTime = createTime;
        this.albumId = albumId;
    }

    public Chapter() {
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getAlbumId() {
        return albumId;
    }

    public void setAlbumId(String albumId) {
        this.albumId = albumId;
    }

    @Override
    public String toString() {
        return "Chapter{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", url='" + url + '\'' +
                ", size='" + size + '\'' +
                ", duration='" + duration + '\'' +
                ", createTime=" + createTime +
                ", albumId='" + albumId + '\'' +
                '}';
    }
}
