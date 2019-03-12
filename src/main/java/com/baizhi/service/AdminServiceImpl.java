package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;


@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao ad;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void register(Admin admin) {
        ad.insertItem(admin);
    }

    @Override
    public Admin checkName(String name) {
        Admin admin = ad.queryByName(name);
        return admin;
    }

    @Override
    public void login(String name, String password, Map<String, Object> map) {

        Admin admin = ad.queryByName(name);
        if(admin==null){
            map.put("status","300");
            map.put("msg","用户名不存在");
        }else  if(!admin.getPassword().equals(password)){
            map.put("status","400");
            map.put("msg","密码错误");
        }else {
            map.put("status","200");
            map.put("msg",admin);
        }


    }
}
