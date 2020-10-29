package com.digitalweb.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.digitalweb.connect.ConnectionManager;

public class SuperOpr {
	
	protected String sql;
	protected PreparedStatement psmt;
	protected Connection con;
	protected int row;
	protected ResultSet rs;
	
	public SuperOpr(){
		ConnectionManager cm=new ConnectionManager();
		con=cm.getConnection();
	}
	
}
