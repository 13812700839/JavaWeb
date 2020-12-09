<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.digitalweb.model.Product" %>
<%@ page import="com.digitalweb.impl.ProductDaoImpl" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
<title>商品添加</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
<link type="text/css" rel="stylesheet" href="../style/main.css" />
<script type="text/javascript">
function BrowseServer( inputId )
{
	var finder = new CKFinder() ;
	finder.BasePath = '../ckfinder/' ;
	finder.selectActionFunction  = SetFileField ;
	finder.selectActionData  = inputId ;
	finder.popup() ;
}
function SetFileField( fileUrl, data )
{
	document.getElementById( data["selectActionData"] ).value = fileUrl ;
}
</script>
</head>
<body>
<%
	String[] ops = {"电脑","手机","相册","其他"};
    String strid = request.getParameter("id");
    int id=0;
    if (strid==null)
        response.sendRedirect("list_product.jsp");
    else {
        id = Integer.parseInt(strid);
        ProductDaoImpl pdi = new ProductDaoImpl();
        Product p = pdi.getProductById(id);
%>
	<form id="add_news" name="add_news" method="post" action="../ProductServlet?flag=update">
		<input type="hidden" name="flag" value="update" >
		<input type="hidden" name="id" value="<%=p.getId()%>" >
		<div id="regist">
		<table border="0" bordercolor="#4f6b72">
      	<tr>
      	  <td class="row" colspan="2" align="center"><h1>商品信息修改</h1></td>
      	</tr>
        <tr>
          <td class="row">商品名称:</td>
          <td><input type="text" name="name" value="<%=p.getName()%>" ><font color="red">*</font></td>
          <td class="row">商品编码:</td>
          <td><input type="text" name="code" value="<%=p.getCode()%>" ><font color="red">*</font></td>
          <td class="row">商品品牌:</td>
          <td><input type="text" name="brand" value="<%=p.getBrand()%>" ><font color="red">*</font></td>
        </tr>
        <tr>
          <td class="row">商品价格:</td>
          <td><input type="text" name="price" value="<%=p.getPrice()%>" ><font color="red">*</font></td>
          <td class="row">促销价格:</td>
          <td><input type="text" name="sale" value="<%=p.getSale()%>" ><font color="red">*</font></td>
          <td class="row">商品类别:</td>
          <td>
          <select name="type" style="font: 黑体;width: 155">
              <%
                  for (String s : ops) {
                      if (s.equals(p.getType())) {
                          out.println("<option value=\"" + s + "\" selected>" + s + "</option>");
//                          System.out.println("<option value=\"" + s + "\" selected>" + s + "</option>");
                      }else {
                          out.println("<option value=\"" + s + "\">" + s + "</option>");
//                          System.out.println("<option value=\"" + s + "\">" + s + "</option>");
                      }
                  }
              %>
              <option value="<%=ops[0]%>"><%=ops[0]%></option>
          </select><font color="red">*</font>
          </td>
        </tr>
       
        <tr>
          <td class="row">商品图片:</td>
          <td><input type="text" name="pic" id="pic" value="<%=p.getPic()%>" onclick="BrowseServer('pic');" ><font color="red">*</font>
          </td>
          <td class="row">商品数量:</td>
          <td><input type="text" name="num" value="<%=p.getNum()%>" ><font color="red">*</font></td>
          <td class="row"><input type="submit" value="保存"/></td>
          <td class="row"><input type="reset" value="重置"/></td>
        </tr> 
      </table>
			<textarea id="intro" name="intro" class="ckeditor" rows="10" cols="80">
			    <%=p.getIntro()%>
			</textarea>
		</div>
	</form>
    <%
        }
    %>
</body>
</html>

