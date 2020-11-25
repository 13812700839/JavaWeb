package com.digitalweb.servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(
        filterName = "AuthorityFilter",
        urlPatterns = { "/buy/*" }
)
public class AuthorityFilter implements Filter {

    private FilterConfig filterConfig=null;

    public void destroy() {
        System.out.println("访问限制过滤器进行销毁");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("访问限制过滤器进行过滤");

        // 获取Session的值，判断用户是否已经登录，如果没有登录跳转到首页进行登录，否则执行原操作
        HttpSession session=((HttpServletRequest)req).getSession();
        if (session.getAttribute("user")==null){

            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");

            // 弹出提醒并跳转到index.jsp
            PrintWriter out= resp.getWriter();
            out.print("<script>alert('请先登录！');</script>");
            ((HttpServletResponse)resp).setHeader("refresh","2,URL=../index.jsp");

        }else
            chain.doFilter(req, resp);

    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("访问限制过滤器进行初始化");
        this.filterConfig=config;
    }

}
