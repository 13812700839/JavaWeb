package com.digitalweb.servlet;

import com.digitalweb.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置当前中文显示编辑
        request.setCharacterEncoding("UTF-8");


        HttpSession session = request.getSession();

        // 将所有参数都获取出来存放在HashMap
        HashMap<String, String[]> map = (HashMap<String, String[]>) request.getParameterMap();

        // 存放购物车的数据列表cartlist
        // 先判断购物车是否存在
        ArrayList<Cart> cartlist = (ArrayList<Cart>) session.getAttribute("cartlist");
        if (cartlist == null || cartlist.size() == 0) {
            cartlist = new ArrayList<Cart>();
        }

        // 如果传递的type参数的值是add，则将当前选定的商品添加到购物车
        if (map.get("type")[0].equals("add")) {
            Cart cart = new Cart();
            cart.setId(Integer.parseInt(map.get("id")[0]));
            cart.setName(map.get("name")[0]);
            cart.setPic(map.get("pic")[0]);
            cart.setPrice(Double.parseDouble(map.get("price")[0]));
            cart.setSale(Double.parseDouble(map.get("sale")[0]));
            cart.setNum(Integer.parseInt(map.get("num")[0]));
            boolean hasCart = false;
            for (Cart c : cartlist) {
                if (c.getId() == cart.getId()) {
                    hasCart = true;
                    c.setNum(c.getNum() + cart.getNum());
                    break;
                }
            }
            if (!hasCart)
                cartlist.add(cart);

        } else if (map.get("type")[0].equals("delete")) {
            int id = Integer.parseInt(map.get("id")[0]);
            for (Cart c : cartlist) {
                if (c.getId() == id) {
                    cartlist.remove(c);
                    break;
                }
            }
        } else if (map.get("type")[0].equals("update")){
            // 获取商品编号
            int id=Integer.parseInt(map.get("id")[0]);
            // 获取数量
            int num=Integer.parseInt(map.get("num")[0]);
            for (Cart c:cartlist){
                // 如果当前编号等于要修改的商品的编号
                if (c.getId()==id){
                    // 将数量进行更新
                    c.setNum(num);
                    break;
                }
            }

        }

        // 将购物车信息保存到session中
        session.setAttribute("cartlist", cartlist);
        response.sendRedirect("product/list_cart.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
