<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.digitalweb.model.Order" %>
<%@ page import="com.digitalweb.model.OrderDetail" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}
a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.STYLE7 {font-size: 12}
</style>
</head>

<body>

	<%
		Order order = (Order) session.getAttribute("order");
	%>

   <div align="center" style="padding-top: 50px;height: 300px">
   <p style="font-size: 20px;">订单明细</p>
   <div align="center" style="width: 800px">
   	<ul style="text-align:left;">
   	<li style="font-size: 12px;list-style: none">订单编号：<%=order.getId()%></li>
   	<li style="font-size: 12px;list-style: none">用户名：<%=order.getUserName()%></li>
   	<li style="font-size: 12px;list-style: none">配送地址：<%=order.getAddress()%></li>
   	<li style="font-size: 12px;list-style: none">下订时间：<%=order.getOrdertime()%></li>
   	<li style="font-size: 12px;list-style: none">订单状态：<%=order.getStatus()%></li>
   </ul>
   <table align="left">
	   <tr>
	 	<th scope="col">商品名称</th>
	 	<th scope="col">图    片</th>
	 	<th scope="col">数    量</th>
	 </tr>

	<%
		for (OrderDetail detail : order.getDetailList()){
	%>

	 <tr>
	 	<td class="row" style="font-size: 12px;"> <%=detail.getPname()%> </td>
	 	<td class="row"><img src="<%=detail.getPic()%>" width="75" height="50" /></td>
	 	<td class="row" style="font-size: 12px;"><%=detail.getNum()%></td>
	 </tr>

	   <%
		   }
	   %>

</table>
   </div>
 <div style="width: 500px;height: 80px;margin-top: 100px">  

<a href="list_order.jsp"><img src="images/back.gif" border="0" /></a>
</div>
   </div>
    
</body>
</html>
