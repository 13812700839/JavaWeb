<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/27
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String strid=request.getParameter("id");
    if(strid==null) {
        System.out.println(strid);
        response.sendRedirect("list_product.jsp");
    }
    else {
        int id = Integer.parseInt(strid);
    }
%>