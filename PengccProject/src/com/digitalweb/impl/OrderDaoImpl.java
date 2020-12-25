package com.digitalweb.impl;

import com.digitalweb.dao.OrderDao;
import com.digitalweb.model.Order;
import com.digitalweb.model.OrderDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDaoImpl extends SuperOpr implements OrderDao {

    @Override
    public boolean add(Order o) {

        // 1. 向order_info中添加记录

        try {
            con.setAutoCommit(false);
            sql = "insert into order_info(userId, status, ordertime) value(?, ?, ?);";
            psmt = con.prepareStatement(sql);

            psmt.setInt(1, o.getUserId());
            psmt.setString(2, o.getStatus());
            psmt.setString(3, o.getOrdertime());

            row = psmt.executeUpdate();

            // 判断是否插入成功，成功则将订单号取出
            if (row > 0) {

                // 将订单号取出
                sql = "select id from order_info order by id desc limit 1";

                PreparedStatement psmt1 = con.prepareStatement(sql);

                ResultSet rs = psmt1.executeQuery();

                if (rs.next())
                    o.setId(rs.getInt("id"));

                // 2. 向order_details添加记录
                sql = "insert into order_detail(o_id,p_id,num) values(?,?,?)";
                PreparedStatement psmt2 = con.prepareStatement(sql);
                psmt2.setInt(1, o.getId());
                for (OrderDetail detail : o.getDetailList()) {

                    psmt2.setInt(2, detail.getPid());
                    psmt2.setInt(3, detail.getNum());

                    row = psmt2.executeUpdate();

                    // 如果任何一个商品添加失败均回滚
                    if (row <= 0) {
                        con.rollback();
                        break;
                    }

                }

            }

            // 如果所有的操作执行完成后，row>0则确认提交
            if (row > 0)
                con.commit();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            try {
                // 只要有出错，则回滚
                con.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } finally {
            try {
                // 将提交模式设置为自动提交
                con.setAutoCommit(true);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return row > 0 ? true : false;

    }

    @Override
    public ArrayList<Order> getOrderByUser(int uid) {

        ArrayList<Order> orderList = new ArrayList<Order>();

        sql = "select order_info.id, userId, username, address, order_info.status, ordertime from order_info " +
                "join user_info on order_info.userId = user_info.id " +
                "where userId = " + uid;

        try {
            psmt = con.prepareStatement(sql);

            rs = psmt.executeQuery();

            while (rs.next()) {
                Order o = new Order();

                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("userId"));
                o.setUserName(rs.getString("username"));
                o.setAddress(rs.getString("address"));
                o.setStatus(rs.getString("status"));
                o.setOrdertime(rs.getString("ordertime"));

                ArrayList<OrderDetail> detailList = new ArrayList<OrderDetail>();

                sql = "select o_id, p_id, name, price, sale, pic, order_detail.num from order_detail " +
                        "join product_info on product_info.id = order_detail.p_id " +
                        "where o_id=" + o.getId();

                PreparedStatement psmt1 = con.prepareStatement(sql);

                ResultSet rs1 = psmt1.executeQuery();

                while (rs1.next()) {

                    OrderDetail detail = new OrderDetail();

                    detail.setOid(rs1.getInt("o_id"));
                    detail.setPid(rs1.getInt("p_id"));
                    detail.setPname(rs1.getString("name"));
                    detail.setPrice(rs1.getDouble("price"));
                    detail.setSale(rs1.getDouble("sale"));
                    detail.setPic(rs1.getString("pic"));
                    detail.setNum(rs1.getInt("num"));

                    detailList.add(detail);

                }

                o.setDetailList(detailList);

                orderList.add(o);

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return orderList;
    }

    @Override
    public ArrayList<Order> list() {

        ArrayList<Order> orderList = new ArrayList<Order>();

        sql = "select order_info.id, userId, username, address, order_info.status, ordertime from order_info " +
                "join user_info on order_info.userId = user_info.id;";

        try {
            psmt = con.prepareStatement(sql);

            rs = psmt.executeQuery();

            while (rs.next()) {
                Order o = new Order();

                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("userId"));
                o.setUserName(rs.getString("username"));
                o.setAddress(rs.getString("address"));
                o.setStatus(rs.getString("status"));
                o.setOrdertime(rs.getString("ordertime"));

                ArrayList<OrderDetail> detailList = new ArrayList<OrderDetail>();

                sql = "select o_id, p_id, name, price, sale, pic, order_detail.num from order_detail " +
                        "join product_info on product_info.id = order_detail.p_id " +
                        "where o_id=" + o.getId();

                PreparedStatement psmt1 = con.prepareStatement(sql);

                ResultSet rs1 = psmt1.executeQuery();

                while (rs1.next()) {

                    OrderDetail detail = new OrderDetail();

                    detail.setOid(rs1.getInt("o_id"));
                    detail.setPid(rs1.getInt("p_id"));
                    detail.setPname(rs1.getString("name"));
                    detail.setPrice(rs1.getDouble("price"));
                    detail.setSale(rs1.getDouble("sale"));
                    detail.setPic(rs1.getString("pic"));
                    detail.setNum(rs1.getInt("num"));

                    detailList.add(detail);

                }

                o.setDetailList(detailList);

                orderList.add(o);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return orderList;
    }

    @Override
    public ArrayList<Order> search(String field, String key) {

        ArrayList<Order> orderList=new ArrayList<Order>();

        sql = "";

        sql = "select order_info.id, userId, username, address, order_info.status, ordertime from order_info " +
                "join user_info on order_info.userId = user_info.id;";

        try {
            psmt = con.prepareStatement(sql);

            rs = psmt.executeQuery();

            while (rs.next()) {
                Order o = new Order();

                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("userId"));
                o.setUserName(rs.getString("username"));
                o.setAddress(rs.getString("address"));
                o.setStatus(rs.getString("status"));
                o.setOrdertime(rs.getString("ordertime"));

                ArrayList<OrderDetail> detailList = new ArrayList<OrderDetail>();

                sql = "select o_id, p_id, name, price, sale, pic, order_detail.num from order_detail " +
                        "join product_info on product_info.id = order_detail.p_id " +
                        "where o_id=" + o.getId();

                PreparedStatement psmt1 = con.prepareStatement(sql);

                ResultSet rs1 = psmt1.executeQuery();

                while (rs1.next()) {

                    OrderDetail detail = new OrderDetail();

                    detail.setOid(rs1.getInt("o_id"));
                    detail.setPid(rs1.getInt("p_id"));
                    detail.setPname(rs1.getString("name"));
                    detail.setPrice(rs1.getDouble("price"));
                    detail.setSale(rs1.getDouble("sale"));
                    detail.setPic(rs1.getString("pic"));
                    detail.setNum(rs1.getInt("num"));

                    detailList.add(detail);

                }

                o.setDetailList(detailList);

                orderList.add(o);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return orderList;

    }

    @Override
    public Order getOrderById(int id) {
        Order order = new Order();

        sql = "select order_info.id, userId, username, address, order_info.status, ordertime from order_info " +
                "join user_info on order_info.userId = user_info.id where order_info.id = " + id;

        try {
            psmt = con.prepareStatement(sql);

            rs = psmt.executeQuery();

            if (rs.next()) {

                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("userId"));
                order.setUserName(rs.getString("username"));
                order.setAddress(rs.getString("address"));
                order.setStatus(rs.getString("status"));
                order.setOrdertime(rs.getString("ordertime"));

                ArrayList<OrderDetail> detailList = new ArrayList<OrderDetail>();

                sql = "select o_id, p_id, name, price, sale, pic, order_detail.num from order_detail " +
                        "join product_info on product_info.id = order_detail.p_id " +
                        "where o_id=" + id;

                PreparedStatement psmt1 = con.prepareStatement(sql);

                ResultSet rs1 = psmt1.executeQuery();

                while (rs1.next()) {

                    OrderDetail detail = new OrderDetail();

                    detail.setOid(rs1.getInt("o_id"));
                    detail.setPid(rs1.getInt("p_id"));
                    detail.setPname(rs1.getString("name"));
                    detail.setPrice(rs1.getDouble("price"));
                    detail.setSale(rs1.getDouble("sale"));
                    detail.setPic(rs1.getString("pic"));
                    detail.setNum(rs1.getInt("num"));

                    detailList.add(detail);

                }

                order.setDetailList(detailList);

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return order;
    }

    @Override
    public boolean send(int id) {

        sql = "update order_info set status='已发货' where id = " + id;

        try {
            psmt = con.prepareStatement(sql);

            row = psmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return row > 0 ? true : false;
    }

    @Override
    public boolean receive(int id) {

        sql = "update order_info set status='交易完成' where id = " + id;

        try {
            psmt = con.prepareStatement(sql);

            row = psmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return row > 0 ? true : false;
    }

}
