<%@ page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>彭长超的计算练习</title>
</head>
<body>
	<%-- 彭长超的计算练习 --%>
	<%	
		out.print("彭长超的计算练习");
		Random random=new Random();
		int num1=random.nextInt(10)+1;
		int num2=random.nextInt(10)+1;
		out.print("<br>第一个数："+num1);
		out.print("<br>第二个数："+num2);
		out.print("<br>和："+(num1+num2));
		out.print("<br>差："+(num1-num2));
		out.print("<br>乘："+(num1*num2));
		out.print("<br>商："+(num1/num2));
	%>
</body>
</html>