package com.digitalweb.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.digitalweb.dao.ProductDao;
import com.digitalweb.model.Product;

public class ProductDaoImpl extends SuperOpr implements ProductDao {

    @Override
    public List<Product> list() {

        ArrayList<Product> productList = new ArrayList<Product>();
        sql = "SELECT * FROM PRODUCT_INFO where status = 1 ORDER BY code ASC;";
        try {
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setType(rs.getString("type"));
                product.setBrand(rs.getString("brand"));
                product.setPic(rs.getString("pic"));
                product.setNum(rs.getInt("num"));
                product.setPrice(rs.getDouble("price"));
                product.setSale(rs.getDouble("sale"));
                product.setIntro(rs.getString("intro"));
                product.setStatus(rs.getInt("status"));

                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    @Override
    public Product getProductById(int id) {

        // 根据商品编号获取商品的信息
        sql = "SELECT * FROM PRODUCT_INFO WHERE ID = " + id;
//		System.out.printf(sql);
        Product product = new Product();
        try {
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            if (rs.next()) {
                product.setId(rs.getInt("id"));
                product.setCode(rs.getString("code"));
                product.setName(rs.getString("name"));
                product.setType(rs.getString("type"));
                product.setBrand(rs.getString("brand"));
                product.setPic(rs.getString("pic"));
                product.setNum(rs.getInt("num"));
                product.setPrice(rs.getDouble("price"));
                product.setSale(rs.getDouble("sale"));
                product.setIntro(rs.getString("intro"));
                product.setStatus(rs.getInt("status"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return product;
    }

    @Override
    public boolean add(Product p) {

        sql = "insert into product_info(code, name, brand, type, pic, num, price, sale, intro, status) value(?,?,?,?,?,?,?,?,?,1);";

        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, p.getCode());
            psmt.setString(2, p.getName());
            psmt.setString(3, p.getBrand());
            psmt.setString(4, p.getType());
            psmt.setString(5, p.getPic());
            psmt.setInt(6, p.getNum());
            psmt.setDouble(7, p.getPrice());
            psmt.setDouble(8, p.getSale());
            psmt.setString(9, p.getIntro());

            row = psmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return row > 0 ? true : false;
    }

    @Override
    public boolean update(Product p) {

        sql = "update product_info set code=?, name=?, brand=?, type=?, pic=?, num=?, price=?, sale=?, intro=?, status=0 where id = ?;";

        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, p.getCode());
            psmt.setString(2, p.getName());
            psmt.setString(3, p.getBrand());
            psmt.setString(4, p.getType());
            psmt.setString(5, p.getPic());
            psmt.setInt(6, p.getNum());
            psmt.setDouble(7, p.getPrice());
            psmt.setDouble(8, p.getSale());
            psmt.setString(9, p.getIntro());
            psmt.setInt(10, p.getId());

            row= psmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return row>0?true:false;
    }

    @Override
    public boolean deleteById(int id) {

        sql = "update product_info set status = 0 where id= "+id;
//        System.out.println(sql);
        try {
            psmt=con.prepareStatement(sql);
            row=psmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return row>0?true:false;
    }
}
