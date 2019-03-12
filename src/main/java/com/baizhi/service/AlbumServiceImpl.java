package com.baizhi.service;

import com.baizhi.dao.AlbumDao;
import com.baizhi.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumDao ad;

    @Override
    public List<Album> findAll() {
        List<Album> list = ad.queryAll();
        return list;
    }

    @Override
    public Album findById(String id) {
        Album album = ad.queryById(id);
        album.setCount(album.getChildren().size());
        return album;
    }
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void saveAlbum(Album album) {
        ad.insertItem(album);
    }
}
