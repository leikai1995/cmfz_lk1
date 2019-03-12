package com.baizhi.dao;

import com.baizhi.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao extends BaseDao<Admin> {
    Admin queryByNameAndPassword(@Param("name") String name, @Param("password") String password);
    Admin queryByName(String name);
}
