package com.baizhi.service;

import com.baizhi.entity.Article;

import java.util.List;

public interface ArticleService {

    List<Article> FindArticle(String uid);

}
