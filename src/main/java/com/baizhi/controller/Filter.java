package com.baizhi.controller;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Filter implements javax.servlet.Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req1 = (HttpServletRequest)req;
        HttpServletResponse res1 = (HttpServletResponse) res;
        HttpSession session = req1.getSession();
        Object admin = session.getAttribute("admin");
        if(admin==null){
            res1.sendRedirect(req1.getContextPath()+"/login.jsp");
        }else {
            chain.doFilter(req,res);
        }
    }

    @Override
    public void destroy() {

    }
}
