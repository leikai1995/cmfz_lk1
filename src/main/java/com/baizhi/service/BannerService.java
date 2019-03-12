package com.baizhi.service;

import com.baizhi.entity.Banner;

import java.util.List;

public interface BannerService {
    List<Banner> findAll();
    void addImg(Banner banner);
    void deleteImgs(List<String> ids);
    void updateImg(Banner banner);
}
