package com.baizhi.controller;


import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.alibaba.fastjson.JSONObject;
import com.baizhi.entity.City;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import io.goeasy.GoEasy;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService us;

    @RequestMapping("showUser")
    @ResponseBody
    public Map<String,Object> showUser(Integer page,Integer rows){
        Map<String,Object> map = us.findAll(page,rows);
        return map;

    }

    @RequestMapping("findmonth")
    @ResponseBody
    public Map<String, Object> findMonth(){

        return us.findMonth();
    }

    @RequestMapping("city")
    @ResponseBody
    public List<City> findCity(){
        List<City> city = us.findCity();
        return city;
    }

    @RequestMapping("register")
    public String register(User user){
        user.setId(UUID.randomUUID().toString());
        user.setCreateTime(new Date());
        user.setStatus(1);
        us.register(user);


        GoEasy goEasy = new GoEasy("http://rest-hangzhou.goeasy.io", "BC-d45c50afd6d9466c98c0fd12a985d432");
        List<City> city = us.findCity();
        Map<String, Object> month = us.findMonth();
        String s = JSONObject.toJSONString(city);
        String s1 = JSONObject.toJSONString(month);
        goEasy.publish("citys", s);
        goEasy.publish("months", s1);

        return "redirect:/login.jsp";
    }


    @RequestMapping("download")
    public void download(HttpServletResponse res, HttpServletRequest req){

        try {
            ServletOutputStream out = res.getOutputStream();
            //设置响应类型
            res.setContentType(req.getSession().getServletContext().getMimeType("xls"));
            res.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode("用户信息.xls", "utf-8"));
            Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("用户信息统计","用户"),
                    User.class, us.findAll1());
            workbook.write(out);
        }catch (Exception e){
            e.printStackTrace();
        }

    }



}
