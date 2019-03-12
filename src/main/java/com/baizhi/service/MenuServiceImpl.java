package com.baizhi.service;

import com.baizhi.dao.MenuDao;
import com.baizhi.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDao md;
    @Override
    public List<Menu> findAll() {
        List<Menu> list = md.queryAll();
        return list;
    }
}
