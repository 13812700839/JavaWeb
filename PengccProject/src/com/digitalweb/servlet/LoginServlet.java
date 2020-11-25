package com.digitalweb.servlet;

import com.digitalweb.impl.UserDaoImpl;
import com.digitalweb.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

        HashMap<String, String[]> map = (HashMap<String, String[]>) request.getParameterMap();

        String username = request.getParameter("txtUser");
        String password = request.getParameter("txtPassword");

        UserDaoImpl udi = new UserDaoImpl();
        int flag = udi.verify(username, password);
        String logininfo = "";

        if (flag == 1)
            logininfo = "用户名不存在！";
        else if (flag == 2)
            logininfo = "密码错误！";
        else if (flag == 3) {
            logininfo = "登录成功！";
            User user =udi.getUserByName(username);
            session.setAttribute("user", user);
        }

        session.setAttribute("logininfo", logininfo);

        response.sendRedirect("index.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
