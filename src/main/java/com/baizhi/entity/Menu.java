package com.baizhi.entity;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable {
    private String id;
    private String title;
    private String href;
    private String iconCls;
    private List<Menu> slist;

    public Menu(String id, String title, String href, String iconCls, List<Menu> slist) {
        this.id = id;
        this.title = title;
        this.href = href;
        this.iconCls = iconCls;
        this.slist = slist;
    }

    public Menu() {
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", href='" + href + '\'' +
                ", iconCls='" + iconCls + '\'' +
                ", slist=" + slist +
                '}';
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

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public List<Menu> getSlist() {
        return slist;
    }

    public void setSlist(List<Menu> slist) {
        this.slist = slist;
    }
}
