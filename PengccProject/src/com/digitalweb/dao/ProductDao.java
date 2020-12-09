package com.digitalweb.dao;

import java.util.List;

import com.digitalweb.model.Product;

public interface ProductDao {
	
	public List<Product> list();
	public Product getProductById(int id);

	// 3.商品添加
	public boolean add(Product p);

	// 4. 商品更新
	public boolean update(Product p);

	// 5.商品删除
	public boolean deleteById(int id);

}
