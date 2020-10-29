
<%@page import="com.digitalweb.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN" xml:lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ED数码在线商城网站</title>
<link type="text/css" rel="stylesheet" href="style/main.css" />
<script type="text/javascript" src="js/imagerollover.js"></script>
</head>
<body>
	<%@ include file="ShowDate.jsp"%>
	<%-- <jsp:include page="ShowDate.jsp" /> --%>
	<div id="header">
		<div id="header_inside">
			<p>
				<img src="images/header2.jpg" alt="ED数码商城banner" usemap="#Map" />
				<map name="Map" id="Map">
					<area shape="rect" coords="844,63,869,94"
						href="product/buy_car.html" alt="" />
					<area shape="rect" coords="684,93,714,118" href="index.html" alt="" />
					<area shape="rect" coords="769,145,797,168" href="regist.html"
						alt="" />
				</map>
			</p>
			<div id="menu">
				<ul>
					<li><a href="<%=path%>/index.jsp" class="btn_active">网站首页</a></li>
					<li><a href="<%=path%>/product/list_product.jsp">商品列表</a></li>
					<li><a href="<%=path%>/product/products_hot.html">热卖产品</a></li>
					<li><a href="#">最新活动</a></li>
					<li><a href="<%=path%>/aboutus.html">关于我们</a></li>
					<li><a href="#">联系我们</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="allcontent">
		<div id="sidebar">
			<h2>商品分类</h2>
			<ul>
				<li class="list1"><a href="#">手机专区</a></li>
				<li><a href="#">存话费送手机</a></li>
				<li class="list1"><a href="#">笔记本电脑</a></li>
				<li><a href="#">数码相机</a></li>
				<li class="list1"><a href="#">单反相机</a></li>
				<li><a href="#">DV摄像机</a></li>
				<li class="list1"><a href="#">平板电脑</a></li>
				<li><a href="#">摄影配件</a></li>
				<li class="list1"><a href="#">其他商品</a></li>
			</ul>
		</div>
		<div id="right">
			<div id="login">
				<%
					String name="";
					String passwd="";
					Cookie[] cookies=request.getCookies();
					if( cookies !=null){
						for(Cookie c :cookies){
							if(c.getName().equals("username"))
								name=c.getValue();
							else if(c.getName().equals("password"))
								passwd=c.getValue();
						}
					}
					User user = (User) session.getAttribute("user");
					String logininfo=(String) session.getAttribute("logininfo");
					if (user == null) {
				%>

				<form id="loginform" name="loginform" method="post"
					action="doLogin.jsp">
					<div>
						<strong>登录名：</strong><input name="txtUser" id="txtUser" size="15"
							value="<%=name %>" />
					</div>
					<div>
						<strong>密 码：</strong><input name="txtPassword" type="password"
							id="txtPassword" size="15" value="<%=passwd %>" />
					</div>
					<div>
						<strong>验证码：</strong><input name="verifyCode" id="verifyCode"
							size="4" /> <img src="" onclick="" />
					</div>
					<div>
						<input type="submit" value="登录" name="submit" class="picbut" /> <input
							name="reg" type="button" value="注册用户" class="picbut" onclick="" />
					</div>
					<div>
						<%
							if(logininfo!=null)
								out.print(logininfo+"<br>");
						%>
						<a href="findPwd.jsp">找回密码</a>
					</div>
					<div>
						<font color=red size=3></font>
					</div>
				</form>
				<%
					} else {
				%>
				<ul>
					<li>欢迎回来，<%=user.getUserName()%></li>
					<li><a href="">我的购物车</a></li>
					<li><a href="">我的订单</a></li>
					<li><a href="">个人信息</a></li>
					<li><a href="doLoginOut.jsp">退出</a></li>
				</ul>
				<%
					}
				%>
			</div>
			<div class="news">
				<p>
					<img src="images/title3.gif" alt="" width="100" height="30" />
				</p>
				<ol>
					<li>24小时送达迟一天退10元</li>
					<li>支付宝金账户购物全场98折</li>
					<li>用建行卡购物全场98折</li>
					<li>工行分期付款0.3%/月手续费</li>
					<li>7天内无条件退货</li>
					<li>运输造成的损害我们承担损失</li>
				</ol>
			</div>
		</div>
		<div id="content">
			<div id="adv">
				<SCRIPT language=javascript>
					var m_nPageInitTime = new Date();
					var MainTopRoll = new xwzRollingImageTrans(
							"IMG_MAIN_TOP_ROLL_DETAIL",
							"IMGS_MAIN_TOP_ROLL_THUMBNAIL");
					MainTopRoll.addItem("http://sc.chinaz.com/",
							"images/shower_01.jpg");
					MainTopRoll.addItem("http://sc.chinaz.com/",
							"images/shower_02.jpg");
					MainTopRoll.addItem("http://sc.chinaz.com/",
							"images/shower_03.jpg");
					MainTopRoll.addItem("http://sc.chinaz.com/",
							"images/shower_04.jpg");
				</SCRIPT>
				<TABLE cellSpacing=0 cellPadding=0 width=575 align=center>
					<TBODY>
						<TR>
							<TD id=IDS_DIV_MAIN_TOP_ROLL_DETAIL width=500 height=235><IMG
								class=clssMainRoll height=235 src="images/shower_01.jpg"
								width=500 border=0 name=IMG_MAIN_TOP_ROLL_DETAIL></TD>
							<!--
			<TD width=283 bgcolor="#F4F4F4" style="DISPLAY: none">
			-->
							<TD width=283 bgcolor="#F4F4F4"><TABLE cellSpacing=0
									cellPadding=0 align=center>
									<TBODY>
										<TR>
											<TD align=right height=60><IMG style="DISPLAY: none"
												height=5 src="" width=9 align=absMiddle border=0
												name=IMGS_MAIN_TOP_ROLL_THUMBNAIL><IMG
												style="CURSOR: pointer" onclick=MainTopRoll.alterImage(0)
												src="images/mini_01.jpg" border=0></TD>
										</TR>
										<TR>
											<TD align=right height=60><IMG style="DISPLAY: none"
												height=5 src="" width=9 align=absMiddle border=0
												name=IMGS_MAIN_TOP_ROLL_THUMBNAIL><IMG
												style="CURSOR: pointer" onclick=MainTopRoll.alterImage(1)
												src="images/mini_02.jpg" border=0></TD>
										</TR>
										<TR>
											<TD align=right height=60><IMG style="DISPLAY: none"
												height=5 src="" width=9 align=absMiddle border=0
												name=IMGS_MAIN_TOP_ROLL_THUMBNAIL><IMG
												style="CURSOR: pointer" onclick=MainTopRoll.alterImage(2)
												src="images/mini_03.jpg" border=0></TD>
										</TR>
										<TR>
											<TD align=right height=60><IMG style="DISPLAY: none"
												height=5 src="" width=9 align=absMiddle border=0
												name=IMGS_MAIN_TOP_ROLL_THUMBNAIL><IMG
												style="CURSOR: pointer" onclick=MainTopRoll.alterImage(3)
												src="images/mini_04.jpg" border=0></TD>
										</TR>
									</TBODY>
								</TABLE></TD>
						</TR>
					</TBODY>
				</TABLE>
				<SCRIPT language=JavaScript>
					MainTopRoll.Index = parseInt('0');
					MainTopRoll.install();
				</SCRIPT>
			</div>
			<div id="advlist">
				<div>
					<h2 class="title01">最新活动</h2>
					<p>
						<a href="#"><img
							src="product/images/smallpic/iphone4s_small.jpg" alt="iphone4s"
							width="75" height="50"></a>
					</p>
					<h3>
						<a href="#">iphone 4S白色版</a>， ￥4999.00
					</h3>
					<p>2012苹果4S4代苹果,32G内存,800万像素 情人节特价优惠中……</p>
				</div>
				<div>
					<h2 class="title02">热卖产品</h2>
					<p>
						<a href="product/canoninf.html"><img
							src="product/images/smallpic/canoneos5d_small.jpg" alt="iphone4s"
							width="75" height="50"></a>
					</p>
					<h3>
						<a href="product/canoninf.html">佳能（Canon） EOS 5D Mark II 单反套机
						</a>￥20999.00
					</h3>
					<p>佳能（Canon） EOS 5D Mark II 单反套机（EF 24-105mm f/4L IS USM
						镜头）,拥有约2110万有效像素、约3.9张/秒的高画质、高速连拍性能。</p>
				</div>
				<div>
					<h2 class="title03">新品上架</h2>
					<p>
						<a href="product/ipad2inf.html"><img
							src="product/images/smallpic/ipad_small.jpg" alt="iphone4s"
							width="75" height="50"></a>
					</p>
					<h3>
						<a href="product/ipad2inf.html">苹果wifi版IPAD2</a> ￥3699.00
					</h3>
					<p>苹果wifi版IPAD2（16G）二代（MC979CH）,薄了，轻了，快了 快来抢先体验吧！送苹果保护膜。为
						FaceTime 和 HD 高清摄像而配备的双摄像头。Dual-core 双核 A5 处理器。同样的 10
						小时电池使用时间1。全新更轻、更薄的设计。如今的 iPad ，更为出色，更加轻薄。</p>
				</div>
			</div>
			<p>
				<a href="digitalmalladv.html">数码商城简介</a><br /> 友情链接：<a
					href="http://www.lusen.com" title="中国最大的数码电子在线销售平台">绿森数码商城</a><br />
			</p>
		</div>

	</div>
	<div id="footer">
		<p>copyright &copy;.All Rights Reserverd. Design form XXX</p>
	</div>
</body>
</html>
