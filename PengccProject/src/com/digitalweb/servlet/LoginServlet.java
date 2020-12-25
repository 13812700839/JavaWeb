package com.digitalweb.servlet;

import com.digitalweb.impl.UserDaoImpl;
import com.digitalweb.model.User;
import javafx.application.Application;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspApplicationContext;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(
        urlPatterns = {"/LoginServlet"},
        name = "LoginServlet"
)
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        // 获取Application
        ServletContext application = this.getServletContext();

        Map<String, String[]> map = request.getParameterMap();

        if (map.get("flag")[0].equals("login")) {

            String username = map.get("txtUser")[0];
            String password = map.get("txtPassword")[0];

            UserDaoImpl udi = new UserDaoImpl();
            int flag = udi.verify(username, password);
            String logininfo = "";

            if (flag == 1)
                logininfo = "用户名不存在！";
            else if (flag == 2)
                logininfo = "密码错误！";
            else if (flag == 3) {
                logininfo = "登录成功！";
                User user = udi.getUserByName(username);
                session.setAttribute("user", user);
            }

            session.setAttribute("logininfo", logininfo);
        } else if (map.get("flag")[0].equals("loginout")){

            User user=(User)session.getAttribute("user");
            HashMap<String, User> userMap=(HashMap<String, User>)application.getAttribute("userMap");
            if(userMap!=null&&userMap.size()!=0)
                //根据当前的用户名删除指定用户信息
                userMap.remove(user.getUserName());
            session.invalidate();

        }

        response.sendRedirect("index.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
