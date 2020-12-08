package com.digitalweb.servlet;

import com.digitalweb.impl.ProductDaoImpl;
import com.digitalweb.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(
        name = "ProductServlet",
        urlPatterns = "/ProductServlet"
)
public class ProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession();

        // 实现对商品的相关操作上的分配
        System.out.println("执行的是productservlet");

        // 调用MODEL完成商品显示
        ProductDaoImpl pdi=new ProductDaoImpl();

        List<Product> productList = pdi.list();

        session.setAttribute("productlist", productList);

        response.sendRedirect("admin/list_product.jsp");



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
