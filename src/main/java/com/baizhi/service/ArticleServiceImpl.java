package com.baizhi.service;

import com.baizhi.entity.Article;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class ArticleServiceImpl implements ArticleService {
    @Override
    public List<Article> FindArticle(String uid) {
        return null;
    }
}
