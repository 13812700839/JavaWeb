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
		//1.获取用户的用户名和密码
		String username = request.getParameter("txtUser");
		String password = request.getParameter("txtPassword");
		//2.判断用户名是否为pengcc，密码是否为123456
		if (username.equals("pengcc")) {
			//3.如果判断成功的话，则返回index页面
			if (password.equals("123456")) {
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				out.println("登录成功");
				response.sendRedirect("index.jsp");
			}
			//4.如果判断不正确的话，这显示用户名或密码不正确
			else {
				out.println("密码出错！");
			}
		} else {
			out.println("用户名出错！");
		}
	%>
</body>
</html>