<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.digitalweb.model.Product" %>
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
<form action="<%=path %>/ProductServlet?type=search" method="post">
<input type="hidden" name="flag" value="search" />
  <table cellspacing="0" cellpadding="0">
  <tr>
  	<td class="STYLE1">查询类型</td>
  	<td class="STYLE1">
	<select name="searchType" style="font: 黑体;width: 120">
      <option value="">请选择查询类型</option>
      <option value="name">商品名称</option>
      <option value="type">种类种类</option>
      <option value="brand">商品品牌</option>
     </select>
	</td>
	<td class="STYLE1">查询关键字</td>
	<td class="STYLE1"><input type="text" name="key" /> </td>
	<td><input type="submit" value="查询"></td>
  </tr>
  </table>
  </form>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="tab/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="tab/images/tab_05.gif"><img src="tab/images/311.gif" width="16" height="16" /> <span class="STYLE4">商品信息管理列表</span></td>
        <td width="281" background="tab/images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                        <input type="checkbox" name="checkbox62" value="checkbox" />
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
              </table></td>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="tab/images/001.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="add_product.html">新增</a></div></td>
                  </tr>
              </table></td>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="tab/images/114.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="importProduct.jsp">导入</a></div></td>
                  </tr>
              </table></td>
              <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="tab/images/083.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">删除</div></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
        <td width="14"><img src="tab/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="tab/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3">
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="6%" height="26" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">选择</div></td>
            <td width="8%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
            <td width="30%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">商品名称</div></td>
            <td width="10%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">商品类型</div></td>
            <td width="10%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">价格</div></td>
            <td width="10%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">促销</div></td>
            <td width="10%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">库存</div></td>
            <td width="8%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">编辑</div></td>
            <td width="8%" height="18" background="tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">删除</div></td>
          </tr>
            <%
                List<Product> productList = (List<Product>) session.getAttribute("productlist");
                int all = 0;
                int curpage = 1;
                int pageTotal = 0;
                int pageCount = 3;
                if (productList != null) {

                    // 当商品列表不为空时，计算页面相关信息
                    all = productList.size();
                    pageTotal = (all % pageCount == 0) ? all / pageCount : all / pageCount + 1;

                    // 获取参数page
                    String strpage = request.getParameter("page");

                    // 如果有跳转页码的请求则设置当前页码为用户请求页
                    if (strpage != null)
                        curpage = Integer.parseInt(strpage);

                    // 设置要显示的真实记录索引
                    int start = (curpage - 1) * pageCount;
                    int end = curpage * pageCount > all ? all : curpage * pageCount;

                    for (int i = start; i < end; i++) {
                        Product p = productList.get(i);
            %>

          <tr>
            <td height="18" bgcolor="#FFFFFF">
            <div align="center" class="STYLE1">
              <input name="checkbox" type="checkbox" class="STYLE2" value="checkbox" />
            </div>
            </td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=p.getCode() %></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=p.getName()%></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=p.getType()%></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=p.getPrice()%></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=p.getSale()%></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" ><a href="#"></a><%=p.getNum()%></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><img src="tab/images/037.gif" width="9" height="9" /><span class="STYLE1"> [</span><a href="update_product.jsp?id=<%=p.getId() %>">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="tab/images/010.gif" width="9" height="9" /> </span><span class="STYLE1">[</span><a href="../ProductServlet?flag=delete&id=<%=p.getId()%>" onClick="if(confirm('确实要删除此条记录吗？')) return true;else return false;">删除</a><span class="STYLE1">]</span></div></td>
          </tr>

            <%
                    }
                }
            %>

        </table></td>
        <td width="9" background="tab/images/tab_16.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="29"><img src="tab/images/tab_20.gif" width="15" height="29" /></td>
        <td background="tab/images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
              <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">共<span style="color: red"><%=all%></span>条纪录，当前第<%=curpage%>/<%=pageTotal%>页，每页<%=pageCount%>条纪录</span></td>
            <td width="75%" valign="top" class="STYLE1"><div align="right">
              <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                <tr>
                 <td width="62" height="22" valign="middle"><div align="right"><a href="list_product.jsp?page=1"><img src="tab/images/first.gif" width="37" height="15" /></a></div></td>
                  <td width="50" height="22" valign="middle"><div align="right"><a href="list_product.jsp?page=<%=curpage-1>0 ? curpage-1 : 1%>"><img src="tab/images/back.gif" width="43" height="15" /></a></div></td>
                  <td width="54" height="22" valign="middle"><div align="right"><a href="list_product.jsp?page=<%=curpage+1>pageTotal ? pageTotal : curpage+1%>"><img src="tab/images/next.gif" width="43" height="15" /></a></div></td>
                  <td width="49" height="22" valign="middle"><div align="right"><a href="list_product.jsp?page=<%=pageTotal%>"><img src="tab/images/last.gif" width="37" height="15" /></a></div></td>
                  <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                  <td width="25" height="22" valign="middle"><span class="STYLE7">
                    <input name="textfield" type="text" class="STYLE1" style="height:10px; width:25px;" size="5" />
                  </span></td>
                  <td width="23" height="22" valign="middle">页</td>
                  <td width="30" height="22" valign="middle"><a href="#"><img onclick="jump()" src="tab/images/go.gif" width="37" height="15" /></a></td>
                </tr>
            </div></td>
          </tr>
        </table></td>
        <td width="14"><img src="tab/images/tab_22.gif" width="14" height="29" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>
    function jump(){
        var val=document.getElementsByName("textfield")[0].value;
        var direct="list_product.jsp?page="+val;
        location.href=direct;
    }
</script>
</body>
</html>
