<%@page import="com.digitalweb.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'onlineUser.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
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
-->
</style>
  </head>
  
  <body>
      <table width="80%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="tab/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3">
        <%
        	//将application中的HashMap的数据读取出来
        	HashMap<String, User> userMap=(HashMap<String, User>)application.getAttribute("userMap");
       	 	//判断是否已经有用户登录	
        	if(userMap==null||userMap.size()==0)
        		out.print("没有用户登录");
        	else{
        		Iterator it=userMap.entrySet().iterator();
        		int i=1;
        %>
       
       <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="15%" height="26" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">选择</div></td>
            <td width="15%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
            <td width="20%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">会员名</div></td>
            <td width="30%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">操作</div></td>
          </tr>
		 	<%
		 		while(it.hasNext()){
    				Map.Entry entry=(Map.Entry)it.next();
    				User user=(User)entry.getValue();
		 	%>
           <tr>
             <td hedight="10" bgcolor="#FFFFFF">
            <div align="center" class="STYLE1">
              <input name="checkbox" type="checkbox" class="STYLE2" value="checkbox" />
            </div>
            </td>
			<td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=i++ %></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">
            <img src="../images/online.png" width="25" height="25" /><%=user.getUserName() %>
          </div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><a href="#">详细信息</a></div></td>
          </tr>
          <%
		 		}
          %>
          
          </table>
          <%
        	}
          %>
          </td>
          </tr>
          </table>
  </body>
</html>
