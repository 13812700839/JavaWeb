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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(
        name = "ProductServlet",
        urlPatterns = "/ProductServlet"
)
public class ProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session=request.getSession();

        // 实现对商品的相关操作上的分配
//        System.out.println("执行的是productservlet");

        HashMap<String, String[]> map = (HashMap<String, String[]>) request.getParameterMap();

        // 调用MODEL完成商品显示
        ProductDaoImpl pdi=new ProductDaoImpl();

        boolean flag = true;

        String direct = "ProductServlet?flag=list";

        // 如果传递的参数是add，则调用商品添加功能
        if (map.get("flag")[0].equals("add")){

            // 获取用户填写的商品信息

            Product p = new Product();

            p.setCode(map.get("code")[0]);
            p.setName(map.get("name")[0]);
            p.setBrand(map.get("brand")[0]);
            p.setType(map.get("type")[0]);
            p.setPic(map.get("pic")[0]);
            p.setNum(Integer.parseInt(map.get("num")[0]));
            p.setPrice(Double.parseDouble(map.get("price")[0]));
            p.setSale(Double.parseDouble(map.get("sale")[0]));
            p.setIntro(map.get("intro")[0]);

            flag = pdi.add(p);

        } else if (map.get("flag")[0].equals("list")) {

            List<Product> productList = pdi.list();

            session.setAttribute("productlist", productList);

            direct = "admin/list_product.jsp";

        } else if (map.get("flag")[0].equals("update")){

            Product p = new Product();

            p.setId(Integer.parseInt(map.get("id")[0]));
            p.setCode(map.get("code")[0]);
            p.setName(map.get("name")[0]);
            p.setBrand(map.get("brand")[0]);
            p.setType(map.get("type")[0]);
//            System.out.println(map.get("type")[0]);
//            System.out.println(p.getType());
            p.setPic(map.get("pic")[0]);
            p.setNum(Integer.parseInt(map.get("num")[0]));
            p.setPrice(Double.parseDouble(map.get("price")[0]));
            p.setSale(Double.parseDouble(map.get("sale")[0]));
            p.setIntro(map.get("intro")[0]);

            flag = pdi.update(p);
//            System.out.println(flag);

        } else if (map.get("flag")[0].equals("delete")){
            flag = pdi.deleteById(Integer.parseInt(map.get("id")[0]));

        }

        if (flag)
            response.sendRedirect(direct);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
