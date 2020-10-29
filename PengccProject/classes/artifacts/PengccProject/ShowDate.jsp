<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,java.text.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My JSP 'ShowDate.jsp'</title>
</head>
<body>
	<%--获取当前时间 --%>
	<%
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日");
		String currentTime=df.format(new Date());
	%>
	欢迎光临ED电子商城！现在时间为：<%=currentTime %>
</body>
</html>