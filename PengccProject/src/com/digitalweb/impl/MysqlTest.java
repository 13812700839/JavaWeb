package com.digitalweb.impl;

import java.sql.SQLException;

public class MysqlTest {
	
	public static void main(String[] args) {
		
		SuperOpr sp=new SuperOpr();
		
		sp.sql="SELECT * FROM PRODUCT_INFO";
		try {
			sp.psmt=sp.con.prepareStatement(sp.sql);
			sp.rs=sp.psmt.executeQuery();
			while(sp.rs.next()){
				int id=sp.rs.getInt("id");
				String code=sp.rs.getString(2);
				String name=sp.rs.getString("name");
				System.out.println(id+"\t"+code+"\t"+name);
			}
			if(sp.rs.isClosed())
				sp.rs.close();
			if(sp.psmt.isClosed())
				sp.psmt.close();
			if(sp.con.isClosed())
				sp.con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
