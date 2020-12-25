package com.digitalweb.model;

public class OrderDetail {

    private int oid;
    private int pid;
    private String pname;
    private double price;
    private double sale;
    private String pic;
    private int num;

    public OrderDetail() {
    }

    public OrderDetail(int oid, int pid, String pname, double price, double sale, String pic, int num) {
        this.oid = oid;
        this.pid = pid;
        this.pname = pname;
        this.price = price;
        this.sale = sale;
        this.pic = pic;
        this.num = num;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
