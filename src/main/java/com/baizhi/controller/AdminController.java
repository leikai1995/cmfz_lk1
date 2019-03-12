package com.baizhi.controller;


import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService as;

    @Autowired
    private UserService us;


    @ResponseBody
    @RequestMapping(value = "login")
    public Map<String,Object> login(String name, String password,String code, HttpSession session){

        Map<String, Object> map = new HashMap<>();
        String code1 = (String) session.getAttribute("code");
        as.login(name,password,map);
        if (code1.equals(code)){

            if(map.get("status")=="200"){
                session.setAttribute("admin",map.get("msg"));
            }

        }else {
            map.put("status","500");
            map.put("msg","验证码错误");
        }

        return map;


    }


    @ResponseBody
    @RequestMapping("checkName")
    public boolean checkName(String name){
        Admin admin = as.checkName(name);
        if(admin ==null){
            return true;
        }else {
            return false;
        }
    }


    @RequestMapping("register")
    public String register(Admin admin){
        as.register(admin);
        return "redirect:/login.jsp";
    }


}
