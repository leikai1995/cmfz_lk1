package com.baizhi.service;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDao bd;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Banner> findAll() {
        List<Banner> list = bd.queryAll();
        return list;
    }

    @Override
    public void addImg(Banner banner) {
        bd.insertItem(banner);
    }

    @Override
    public void deleteImgs(List<String> ids) {
        bd.deleteItems(ids);
    }

    @Override
    public void updateImg(Banner banner) {
        System.out.println(banner);
        bd.updateItem(banner);
    }
}
