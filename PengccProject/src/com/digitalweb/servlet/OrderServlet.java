package com.digitalweb.servlet;

import com.digitalweb.impl.OrderDaoImpl;
import com.digitalweb.model.Cart;
import com.digitalweb.model.Order;
import com.digitalweb.model.OrderDetail;
import com.digitalweb.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

@WebServlet(
        name = "OrderServlet",
        urlPatterns = {"/OrderServlet"}
)
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        Map<String, String[]> map = request.getParameterMap();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        OrderDaoImpl odi = new OrderDaoImpl();

        PrintWriter out = response.getWriter();

        String direct = "buy/list_order.jsp";
        boolean flag = true;

        if (map.get("flag")[0].equals("add")){

            // 将当前登录的用户信息提取出来，当前用户购物车中信息提取出来
            User user = (User) session.getAttribute("user");
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartlist");
            ArrayList<OrderDetail> detailList = new ArrayList<OrderDetail>();

            for (Cart c : cartList){

                OrderDetail detail = new OrderDetail();

                detail.setPid(c.getId());
                detail.setPname(c.getName());
                detail.setPrice(c.getPrice());
                detail.setSale(c.getSale());
                detail.setNum(c.getNum());
                detail.setPic(c.getPic());

                detailList.add(detail);

            }

            // 将要添加到订单信息封装到order对象中
            Order order = new Order();

            order.setUserId(user.getId());
            order.setUserName(user.getUserName());
            order.setAddress(user.getAddress());
            order.setStatus("已确认");
            order.setOrdertime(sdf.format(new Date()));
            order.setDetailList(detailList);

            flag = odi.add(order);

            if (!flag)
                out.print("<scritp>alert('订单生成失败！');</script>");

        }

        response.sendRedirect(direct);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
