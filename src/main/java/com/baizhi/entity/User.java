package com.baizhi.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {

    private String id;
    private String photo;
    @Excel(name = "法名")
    private String dharmaName;
    @Excel(name = "真实姓名")
    private String realname;
    @Excel(name = "性别")
    private String sex;
    @Excel(name = "省份")
    private String province;
    @Excel(name = "城市")
    private String city;

    private String sign;
    @Excel(name = "手机号")
    private String phone;
    private String password;
    private String salt;
    @Excel(name = "创建时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    @Excel(name = "用户状态")
    private Integer status;

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", photo='" + photo + '\'' +
                ", dharmaName='" + dharmaName + '\'' +
                ", realname='" + realname + '\'' +
                ", sex='" + sex + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", sign='" + sign + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", createTime=" + createTime +
                ", status=" + status +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDharmaName() {
        return dharmaName;
    }

    public void setDharmaName(String dharmaName) {
        this.dharmaName = dharmaName;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public User(String id, String photo, String dharmaName, String realname, String sex, String province, String city, String sign, String phone, String password, String salt, Date createTime, Integer status) {
        this.id = id;
        this.photo = photo;
        this.dharmaName = dharmaName;
        this.realname = realname;
        this.sex = sex;
        this.province = province;
        this.city = city;
        this.sign = sign;
        this.phone = phone;
        this.password = password;
        this.salt = salt;
        this.createTime = createTime;
        this.status = status;
    }

    public User() {
    }
}
