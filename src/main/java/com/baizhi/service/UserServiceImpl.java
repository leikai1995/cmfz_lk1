package com.baizhi.service;


import com.baizhi.dao.UserDao;
import com.baizhi.entity.City;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao ud;

    @Override
    public Map<String,Object> findAll(Integer page,Integer rows) {
        Integer begin= (page-1)*rows;
        List<User> list = ud.queryAll(begin,rows);
        Map<String, Object> map = new HashMap<>();
        map.put("rows",list);
        map.put("total",ud.queryPageCount());
        return map;
    }

    @Override
    public List<User> findAll1() {
        List<User> list = ud.queryAll1();
        return list;
    }


    @Override
    public Map<String,Object> findMonth(){
        Map<String , Object> map = new HashMap<>();
        List<String> monthlist = new ArrayList<>();
        List<Integer> manlist = new ArrayList<>();
        List<Integer> wmanlist = new ArrayList<>();
        for(Integer i =1; i<=12; i++){
            if(i<10){
                monthlist.add("0"+i);
            }else {
                monthlist.add(i.toString());
            }
        }
        for (String moth:monthlist) {
            manlist.add(ud.queryMonth("m",moth));
            wmanlist.add(ud.queryMonth("w",moth));
        }
        map.put("manlist",manlist);
        map.put("wmanlist",wmanlist);
        map.put("monthlist",monthlist);

        return map;
    }

    public List<City> findCity() {
        return ud.queryCity();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void register(User user) {
        ud.insertItem(user);
    }
}
