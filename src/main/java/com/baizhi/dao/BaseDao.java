package com.baizhi.dao;

import java.util.List;

public interface BaseDao<T> {
    void insertItem(T t);
    List<T> queryAll();
    T queryById(String id);
    void updateItem(T t);
    void deleteItem(Integer id);
}
