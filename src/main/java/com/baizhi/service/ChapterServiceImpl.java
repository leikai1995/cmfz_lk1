package com.baizhi.service;

import com.baizhi.dao.ChapterDao;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ChapterServiceImpl implements ChapterService {
    @Autowired
    private ChapterDao cd;
    @Override
    public void saveChapter(Chapter chapter) {
        cd.insertItem(chapter);
    }
}
