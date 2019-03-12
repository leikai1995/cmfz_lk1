package com.baizhi.service;

import com.baizhi.entity.Admin;

import java.util.Map;

public interface AdminService {
    void register(Admin admin);
    Admin checkName(String name);
    void login(String name, String password, Map<String, Object> map);
}
