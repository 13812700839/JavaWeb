package com.digitalweb.model;

import java.util.ArrayList;

public class Order {

    private int id;
    private int userId;
    private String userName;
    private String address;
    private String status;
    private String ordertime;
    private ArrayList<OrderDetail> detailList;

    public Order() {
    }

    public Order(int id, int userId, String userName, String address, String status, String ordertime, ArrayList<OrderDetail> detailList) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.address = address;
        this.status = status;
        this.ordertime = ordertime;
        this.detailList = detailList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public ArrayList<OrderDetail> getDetailList() {
        return detailList;
    }

    public void setDetailList(ArrayList<OrderDetail> detailList) {
        this.detailList = detailList;
    }
}
