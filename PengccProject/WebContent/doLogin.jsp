<%@page import="com.digitalweb.model.User"%>
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
		//方法2.使用JavaBean进行传递
		// 获取用户的用户名和密码
		String username = request.getParameter("txtUser");
		String password = request.getParameter("txtPassword");
		String logininfo = "";
		if (!username.equals("pengcc")) {
			//用户名错误
			logininfo = "用户名不存在";
		} else if (!password.equals("123")) {
			//密码错误
			logininfo = "密码错误";
		} else {
			//将用户名和密码等 相关信息封装成User对象中
			logininfo="登录成功";
			User user = new User();
			user.setUserName(username);
			user.setPassword(password);
			session.setAttribute("user", user);
			response.addCookie(new Cookie("username",username));
			response.addCookie(new Cookie("password",password));
		}
		session.setAttribute("logininfo", logininfo);
		response.sendRedirect("index.jsp");
	%>
</body>
</html>