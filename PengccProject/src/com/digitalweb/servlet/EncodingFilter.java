package com.digitalweb.servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;

@WebFilter(
        filterName = "EncodingFilter",
        urlPatterns = { "/*" },
        initParams = {
                @WebInitParam(name="Encoding", value="utf-8"),
                @WebInitParam(name="ignore", value = "true")
        }
)
public class EncodingFilter implements Filter {

    // 接收字符编码方式
    protected String encoding=null;
    // 初始化配置
    protected FilterConfig filterConfig=null;
    // 是否忽略大小写
    protected boolean ignore=true;

    public void destroy() {
        System.out.println("过滤器进行销毁");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("过滤器进行过滤");
        if (this.ignore||req.getCharacterEncoding()==null){
            if (this.encoding!=null)
                // 设置当前编码为初始化的值
                req.setCharacterEncoding(this.encoding);
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("过滤器进行初始化");
        this.filterConfig=config;
        // 获取初始化的参数
        this.encoding=filterConfig.getInitParameter("Encoding");
        String value=filterConfig.getInitParameter("ignore");

        if (value==null)
            this.ignore=true;
        else if (value.equalsIgnoreCase("true"))
            this.ignore=true;
        else if (value.equalsIgnoreCase("false"))
            this.ignore=false;
    }

}
