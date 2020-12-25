package com.digitalweb.servlet;

import com.digitalweb.impl.OrderDaoImpl;
import com.digitalweb.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet(
        name = "OrderAdminServlet",
        urlPatterns = {"/OrderAdminServlet"}
)
public class OrderAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // TODO 根据用户提交的请求类型进行相应的操作

        OrderDaoImpl odi = new OrderDaoImpl();

        Map<String, String[]> map = request.getParameterMap();
        HttpSession session = request.getSession();

        String direct="admin/list_order.jsp";


        if (map.get("flag")[0].equals("list")){

            // TODO 如果是列表的请求，则调用操作类进行操作
            ArrayList<Order> orderList = odi.list();

            session.setAttribute("orderList", orderList);

        } else if (map.get("flag")[0].equals("detail")){

        }

        response.sendRedirect(direct);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
