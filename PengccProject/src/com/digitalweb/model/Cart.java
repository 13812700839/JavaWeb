package com.digitalweb.model;

public class Cart {

    // 1. 属性：id, name, pic, price, sale, num
    private int id;
    private String name;
    private String pic;
    private double price;
    private double sale;
    private int num;

    // 2. set和get方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
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

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    // 3. 构造方法
    public Cart(){}

    public Cart(int id, String name, String pic, double price, double sale, int num) {
        this.id = id;
        this.name = name;
        this.pic = pic;
        this.price = price;
        this.sale = sale;
        this.num = num;
    }

}
