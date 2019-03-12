package com.baizhi.entity;


import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Banner implements Serializable {
    private String id;
    private String title;
    private String img_Path;
    private String description;
    private Integer status;
    @DateTimeFormat(pattern = "yyyy-MM-dd")

    private Date createTime;
    @Override
    public String toString() {
        return "Banner{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", img_Path='" + img_Path + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", createTime=" + createTime +
                '}';
    }

    public Banner(String id, String title, String img_Path, String description, Integer status, Date createTime) {
        this.id = id;
        this.title = title;
        this.img_Path = img_Path;
        this.description = description;
        this.status = status;
        this.createTime = createTime;
    }

    public Banner() {
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

    public String getImg_Path() {
        return img_Path;
    }

    public void setImg_Path(String img_Path) {
        this.img_Path = img_Path;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
