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
import java.util.List;

@WebServlet(
        name = "UserServlet",
        urlPatterns = "/UserServlet"
)
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession();

        UserDaoImpl udi = new UserDaoImpl();

        List<User> userList = udi.list();

        session.setAttribute("userlist", userList);

        response.sendRedirect("admin/list_user.jsp");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
