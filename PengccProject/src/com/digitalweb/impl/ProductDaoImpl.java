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
		sql = "SELECT * FROM PRODUCT_INFO;";
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

}
