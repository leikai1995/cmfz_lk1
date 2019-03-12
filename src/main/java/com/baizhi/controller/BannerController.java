package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bs;

    @ResponseBody
    @RequestMapping("showBanner")
    public List<Banner> showBanner(){
        List<Banner> list = bs.findAll();
        return list;
    }

    @ResponseBody
    @RequestMapping("updateImg")
    public void updateImg(Banner banner){

        bs.updateImg(banner);
    }

   @ResponseBody
    @RequestMapping("addImg")
    public void addImg(Banner banner, MultipartFile upfile, HttpSession session
                         ){
        //获取原始文件名
        String filename = upfile.getOriginalFilename();
        //通过文件夹的相对路径获取目标的文件夹绝对路径
        String realPath = session.getServletContext().getRealPath("/upload");
        // 创建一个服务器上的目标文件
        File descFile = new File(realPath+"/"+filename);
        //上传
        try {
            upfile.transferTo(descFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        banner.setId(UUID.randomUUID().toString());
        banner.setImg_Path("/upload/"+filename);
        banner.setCreateTime(new Date());
        bs.addImg(banner);
    }

    @ResponseBody
    @RequestMapping("deleteImg")
    public void deleteImg(@RequestBody List<String> ids){

        bs.deleteImgs(ids);
    }

}
