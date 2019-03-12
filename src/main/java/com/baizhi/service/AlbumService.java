package com.baizhi.service;

import com.baizhi.entity.Album;

import java.util.List;

public interface AlbumService {
    List<Album> findAll();
    Album findById(String id);
    void saveAlbum(Album album);
}
