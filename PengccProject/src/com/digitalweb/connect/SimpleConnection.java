package com.digitalweb.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SimpleConnection {
	
	static String driver="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/digital?useUnicode=true&amp;characterEncoding=utf-8&amp;zeroDateTimeBehavior=convertToNull&amp;transformedBitIsBoolean=true";
	static String user="root";
	static String password="root";
	static Connection conn;
	
	public static void main(String[] args){
		try {
			
			// 注册和加载驱动
			Class.forName(driver);
			
			// 建立与数据库的连接
			conn=DriverManager.getConnection(url, user, password);
			System.out.println("数据库连接开始...");
			conn.setAutoCommit(false);
			if(!conn.isClosed())
				System.out.println("数据库连接成功...");
			
			// 将SQL传递
			String sql="SELECT * FROM PRODUCT_INFO";
			PreparedStatement stmt=conn.prepareStatement(sql);
			
			// 返回结果
			ResultSet res=stmt.executeQuery();
			while(res.next()){
				System.out.println(res.getInt(1)+"\t"+res.getString(2)+"\t"+res.getString(3));
			}
			
			// 关闭资源
			if(res.isClosed())
				res.close();
			if(stmt.isClosed())
				stmt.close();
			if(conn.isClosed())
				conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
