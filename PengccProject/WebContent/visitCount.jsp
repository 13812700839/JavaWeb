<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//application.removeAttribute("count");
		//先判断是否已经有统计记录
		Integer count=(Integer) application.getAttribute("count");
		
		//如果没有的话，新建初始化统计值为0
		if(count==null)
			count=0;
		
		//如果已经存在，则进行+1
		application.setAttribute("count", ++count);
	%>
	网站访问量：<%=count %>
</body>
</html>