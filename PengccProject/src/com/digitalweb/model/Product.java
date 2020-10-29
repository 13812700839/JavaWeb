package com.digitalweb.model;

public class Product {

	private int id;
	private String code;
	private String name;
	private String type;
	private String brand;
	private String pic;
	private int num;
	private double price;
	private double sale;
	private String intro;
	private int status;

	public Product() {
	}

	public Product(int id, String code, String name, String type, String brand,
			String pic, int num, double price, double sale, String intro,
			int status) {
		this.id = id;
		this.code = code;
		this.name = name;
		this.type = type;
		this.brand = brand;
		this.pic = pic;
		this.num = num;
		this.price = price;
		this.sale = sale;
		this.intro = intro;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
