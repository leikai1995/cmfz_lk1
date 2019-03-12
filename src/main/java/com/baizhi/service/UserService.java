package com.baizhi.service;

import com.baizhi.entity.City;
import com.baizhi.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    Map<String,Object> findAll(Integer begin, Integer rows);
    List<User> findAll1();
    Map<String, Object> findMonth();
    List<City> findCity();
    void register(User user);
}
