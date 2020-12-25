package com.digitalweb.dao;

import com.digitalweb.model.Order;

import java.util.ArrayList;

public interface OrderDao {

    // 生成订单
    public boolean add(Order o);

    // 根据用户查看订单
    public ArrayList<Order> getOrderByUser(int uid);

    // 查询所有订单
    public ArrayList<Order> list();

    // 条件查询订单
    public ArrayList<Order> search(String field, String key);

}
