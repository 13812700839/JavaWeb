<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" class="com.digitalweb.model.User" scope="session" />
    <jsp:setProperty property="*" name="user"/>
    <%
    	if(user.getUserName()==null||user.getUserName().equals("")||user.getPassword()==null||user.getPassword().equals("")){
    		out.print("<script>alert('注册失败！')</script>");
    		session.removeAttribute("user");
    	}else{
    		out.print("<script>alert('注册成功！')</script>");
    	}
    	response.setHeader("refresh", "2;URL=index.jsp");
    	
    %>
</body>
</html>