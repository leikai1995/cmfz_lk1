package com.baizhi.controller;


import com.baizhi.entity.Album;
import com.baizhi.entity.Article;
import com.baizhi.entity.Banner;
import com.baizhi.service.AlbumService;
import com.baizhi.service.ArticleService;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class FirstPageController {

    @Autowired
    private BannerService bs;
    @Autowired
    private AlbumService as;
    @Autowired
    private ArticleService acs;

    @ResponseBody
    @RequestMapping("first_page")
    public Map<String ,Object> first_page(String type,String uid,String sub_type){

        Map<String, Object> map = new HashMap<>();
        if(type=="all"){
            List<Banner> banners = bs.findAll();
            List<Album> albums = as.findAll();
            List<Article> articles = acs.FindArticle(uid);
            map.put("header",banners);
            map.put("album",albums);
            map.put("article",articles);
        }else if(type=="wen"){
            List<Album> albums = as.findAll();
            map.put("album",albums);

        }else if(type=="si"){
            if(sub_type=="ssyj"){
                List<Article> articles = acs.FindArticle(uid);
                map.put("article",articles);
            }else if(sub_type=="xmfy"){
                List<Article> articles = acs.FindArticle(null);
                map.put("article",articles);
            }

        }
        return map;
    }

}
