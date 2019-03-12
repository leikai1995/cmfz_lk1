package com.baizhi.dao;

import com.baizhi.entity.City;
import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao extends BaseDao<User>{
    List<User> queryAll1();
    List<User> queryAll(@Param("begin") Integer begin, @Param("rows") Integer rows);
    Integer queryMonth(@Param("sex") String sex, @Param("month") String month);
    List<City> queryCity();
    Integer queryPageCount();


}
