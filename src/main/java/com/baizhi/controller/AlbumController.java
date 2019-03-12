package com.baizhi.controller;


import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AlbumService;
import com.baizhi.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService as;
    @Autowired
    private ChapterService cs;

    @ResponseBody
    @RequestMapping("showAllAlbum")
    public List<Album> showAllAlbum(){
        List<Album> list = as.findAll();
        return list;
    }

    @ResponseBody
    @RequestMapping("showAlbumDetails")
    public Album showAlbumDetails(String id){
        Album album = as.findById(id);
        return album;
    }


    @ResponseBody
    @RequestMapping("addAlbum")
    public void addAlbum(Album album, MultipartFile upfile, HttpSession session){

        //获取原始文件名
        String filename = upfile.getOriginalFilename();
        //通过文件夹的相对路径获取目标的文件夹绝对路径
        String realPath = session.getServletContext().getRealPath("/img");
        // 创建一个服务器上的目标文件
        File descFile = new File(realPath+"/"+filename);
        //上传
        try {
            upfile.transferTo(descFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        album.setId(UUID.randomUUID().toString());
        album.setCoverImg("/img/"+filename);
        album.setReleaseTime(new Date());
        as.saveAlbum(album);
    }

    @ResponseBody
    @RequestMapping("addChapter")
    public void addChapter(Chapter chapter, MultipartFile upfile, HttpSession session){


        chapter.setDuration("5分31秒");

        BigDecimal size = new BigDecimal(upfile.getSize());
        BigDecimal mod = new BigDecimal(1024);
        //除两个1024，保留两位小数，进行四舍五入
        size = size.divide(mod).divide(mod).setScale(2, BigDecimal.ROUND_HALF_UP);

        System.out.println("size:"+size);
        chapter.setSize(size.toString());
        //获取原始文件名
        String filename = upfile.getOriginalFilename();
        //通过文件夹的相对路径获取目标的文件夹绝对路径
        String realPath = session.getServletContext().getRealPath("/audio");
        // 创建一个服务器上的目标文件
        File descFile = new File(realPath+"/"+filename);

        //上传
        try {
            upfile.transferTo(descFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        chapter.setId(UUID.randomUUID().toString());
        chapter.setUrl("/audio/"+filename);
        chapter.setCreateTime(new Date());

        System.out.println(chapter);
        cs.saveChapter(chapter);

    }


    @RequestMapping("downloadAudio")
    public void downloadAudio(String url, HttpSession session,String title,
                              HttpServletResponse res, HttpServletRequest req){
        String realPath = session.getServletContext().getRealPath(url);
        System.out.println(url);
        System.out.println(realPath);
        try {
            FileInputStream in = new FileInputStream(new File(realPath));
            ServletOutputStream out = res.getOutputStream();
            //设置响应类型
            String substring = url.substring(url.lastIndexOf("."));
            res.setContentType(req.getSession().getServletContext().getMimeType(substring));
            //设置响应头
            res.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(title+substring, "utf-8"));
            //响应
            FileCopyUtils.copy(in,out);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
