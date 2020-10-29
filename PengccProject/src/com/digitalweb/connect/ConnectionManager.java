package com.digitalweb.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private String driver;
	private String url;
	private String userName;
	private String pwd;
	private Connection con;

	// 构造方法
	public ConnectionManager() {
		// 对属性进行初始化设置
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://localhost:3306/digital";
		userName = "root";
		pwd = "root";
		try {
			// 加载驱动
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 创建方法建立连接
	public Connection getConnection() {

		try {
			con = DriverManager.getConnection(url, userName, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return con;
	}

	// 创建方法，关闭连接
	public void close() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
