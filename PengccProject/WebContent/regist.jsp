<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN" xml:lang="zh-CN">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>ED数码商城</title>
		<link type="text/css" rel="stylesheet" href="style/main.css" />
    </head>
    <body>
	<div id="header">
		<div id="header_inside">
			<p><img src="images/header.jpg" alt="四叶草数码商城banner" usemap="#Map" />
<map name="Map" id="Map"><area shape="rect" coords="844,63,869,94" href="product/buy_car.html" alt="" />
<area shape="rect" coords="684,93,714,118" href="index.html" alt="" />
<area shape="rect" coords="769,145,797,168" href="regist.html" alt="" />
</map></p>		
			<div id="menu">
				<ul>
					<li><a href="<%=path %>/index.jsp" class="btn_active">网站首页</a></li>
					<li><a href="<%=path %>/product/list_product.jsp">商品列表</a></li>
					<li><a href="<%=path %>/product/products_hot.html">热卖产品</a></li>
					<li><a href="#">最新活动</a></li>
					<li><a href="<%=path %>/aboutus.html">关于我们</a></li>
					<li><a href="#">联系我们</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="allcontent">
	<div id="regist">
		<div id="registtop">
			<h2>ED商城用户注册</h2>
		</div>
		<div id="registmessage">
			  <form name="registform" id="registform" action="doRegist.jsp" method="post" >
				<table>
				  <tr>
					<th>账号：</th>
					<td><input  type="text" name="userName"  size="20" maxlength="20" /></td>
				  </tr>
				  <tr>
					<th>密码：</th>
					<td><input  type="password" name="password" size="20" value="" /></td>
				  </tr>
				  <tr>
					<th>真实姓名：</th>
					<td><input  type="text" name="realName"  size="20" maxlength="20" /></td>
				  </tr>
				  <tr>
					<th>用户性别：</th>
					<td><input name="sex" type="radio" value="男" checked />男&nbsp;
					  <input type="radio" name="sex" value="女" />女</td>
				  </tr>
				  <tr>
					<th>配送地址：</th>
					<td><input  type="text" name="address"  size="20" maxlength="20" /></td>
				  </tr>
				  <tr>
					<th>密码保护问题：</th>
					<td><select name="question">
						<option value="">--请选择--</option>
						<option value="您的出生地是？">您的出生地是？</option>
						<option value="您父亲的生日是？">您父亲的生日是？</option>
						<option value="您母亲的生日是？">您母亲的生日是？</option>
						<option value="您身份证号码的后6位是？">您身份证号码的后6位是？</option>
						<option value="您手机号码的后6位是？">您手机号码的后6位是？</option>
						<option value="您父亲的姓名是？">您父亲的姓名是？</option>
						<option value="您母亲的姓名是？">您母亲的姓名是？</option>
					  </select>
					</td>
				  </tr>
				  <tr>
					<th>答案：</th>
					<td><input  type="text" name="answer"  size="20" maxlength="20" /></td>
				  </tr>
				  <tr>
					<th>邮箱：</th>
					<td><input  type="text" name="email"  size="20" maxlength="20" /></td>
				  </tr>
				  <tr>
					<th>请选择关注的商品类别：</th>
					<td>
					  <input type="checkbox"  name="favorate" value="手机"/>手机
					  <input type="checkbox"  name="favorate" value="电脑"/>电脑
					  <input type="checkbox"  name="favorate" value="相机"/>相机
					  <input type="checkbox"  name="favorate" value="其他"/>其他
					</td>
				  </tr>

				   <tr>
					<td colspan="2" align="center">
					<input type="submit" name="submit" value=" 提交" class="picbut" />
					  &nbsp;&nbsp;
					<input name="reset" type="reset" value="清空" class="picbut" />
					
					  </td>
				  </tr>
				</table>
			  </form>
			  </div>
	</div>
	</div>
		<div id="footer">
			<p>copyright &copy;.All Rights Reserverd. Design from XXX </p>
		</div>
    </body>
</html>
