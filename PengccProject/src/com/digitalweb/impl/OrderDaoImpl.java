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
                    if (row<=0) {
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
                "where userId = "+uid;

        try {
            psmt= con.prepareStatement(sql);

            rs = psmt.executeQuery();

            while (rs.next()){
                Order o = new Order();

                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("userId"));
                o.setUserName(rs.getString("username"));
                o.setAddress(rs.getString("address"));
                o.setStatus(rs.getString("status"));
                o.setOrdertime(rs.getString("ordertime"));

                ArrayList<OrderDetail> detailList = new ArrayList<OrderDetail>();

                sql = "select o_id, p_id, name, price, sale, pic, num from order_detail" +
                        "join product_info on product_info.id = order_details.p_id " +
                        "where o_id="+o.getId();

                psmt = con.prepareStatement(sql);

                rs= psmt.executeQuery();

                while (rs.next()){

                    OrderDetail detail = new OrderDetail();

                    detail.setOid(rs.getInt("o_id"));
                    detail.setPid(rs.getInt("p_id"));
                    detail.setPname(rs.getString("name"));
                    detail.setPrice(rs.getDouble("price"));
                    detail.setSale(rs.getDouble("sale"));
                    detail.setPic(rs.getString("pic"));
                    detail.setNum(rs.getInt("num"));

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
        return null;
    }

    @Override
    public ArrayList<Order> search(String field, String key) {
        return null;
    }

}
