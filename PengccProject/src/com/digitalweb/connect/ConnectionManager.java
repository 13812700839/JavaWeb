package com.digitalweb.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	
	static String driver="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/digital";
	static String user="root";
	static String password="root";
	static Connection conn=null;
	
	public static Connection getConnection(){
		
		try {
			// 注册和加载驱动
			Class.forName(driver);
			
			// 建立与数据库的连接
			conn=DriverManager.getConnection(url, user, password);
			System.out.println("数据库连接开始...");
			if(!conn.isClosed())
				System.out.println("数据库连接成功...");
			else
				System.out.println("数据库连接失败...");
			conn.setAutoCommit(false);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
}
