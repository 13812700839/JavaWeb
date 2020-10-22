<%@page import="com.digitalweb.model.User"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		User user=(User)session.getAttribute("user");
		HashMap<String, User> userMap=(HashMap<String, User>)application.getAttribute("userMap");
		if(userMap!=null&&userMap.size()!=0)
			//根据当前的用户名删除指定用户信息
			userMap.remove(user.getUserName());
		session.invalidate();
		response.sendRedirect("index.jsp");
	%>
</body>
</html>