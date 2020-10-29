<%@page import="com.digitalweb.model.Product" %>
<%@page import="com.digitalweb.impl.ProductDaoImpl" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN" xml:lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>佳能 单反 四叶草数码商城产品介绍</title>
    <link type="text/css" rel="stylesheet" href="../style/main.css"/>
    <script type="text/javascript">
        function checkAddCarForm() {
            if (document.getElementById("num").value.length <= 0)
                alert("请输入购买数量！");
            else
                document.addCarForm.submit();
        }
    </script>
</head>
<body>
<div id="header">
    <div id="header_inside">
        <p>
            <img src="../images/header.jpg" alt="四叶草数码商城banner" usemap="#Map"/>
            <map name="Map" id="Map">
                <area shape="rect" coords="844,63,869,94" href="buy_car.html" alt=""/>
                <area shape="rect" coords="684,93,714,118" href="../index.html" alt=""/>
                <area shape="rect" coords="769,145,797,168" href="../regist.html" alt=""/>
            </map>
        </p>
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
    <div id="sidebar2">
        <h2>
            商品分类
        </h2>
        <ul>
            <li class="list1">
                <a href="#">手机专区</a>
            </li>
            <li>
                <a href="#">存话费送手机</a>
            </li>
            <li class="list1">
                <a href="#">笔记本电脑</a>
            </li>
            <li>
                <a href="#">数码相机</a>
            </li>
            <li class="list1">
                <a href="#">单反相机</a>
            </li>
            <li>
                <a href="#">DV摄像机</a>
            </li>
            <li class="list1">
                <a href="#">平板电脑</a>
            </li>
            <li>
                <a href="#">摄影配件</a>
            </li>
            <li class="list1">
                <a href="#">其他商品</a>
            </li>
        </ul>
        <div id="starpro2">
            <h1>
                我们的明星产品
            </h1>
            <h2>
                苹果手机iPhone 4S
            </h2>
            <p>
                <a href=""><img src="images/smallpic/iphone4s_small.jpg"
                                alt="iPhone 4S"/>
                </a>
            </p>
            <p>
                苹果手机iPhone
                4S代16G(行货带票，全国联保)新款Iphones,4代16G版，正品行货,带wifi，适用移动GSM或者联通WCDMA
            </p>
            <h2>
                佳能IXUS230
            </h2>
            <p>
                <a href=""><img src="images/smallpic/canonixus230_small.jpg"
                                alt="佳能IXUS230"/>
                </a>
            </p>
            <p>
                佳能IXUS230,8倍变焦 ,3寸屏（行货带票）+延长1年保修期+佳能小型数码相机摄影创意集。
            </p>
            <h2>
                <a id="thinkpade420">THINKPAD E420</a>
            </h2>
            <p>
                <a href="#"><img src="images/smallpic/thinkpade420_small.jpg"
                                 alt="THINKPAD E420"/>
                </a>
            </p>
            <p>
                THINKPAD E420 1141AB9笔记本电脑（大容量500G硬盘，正版WIN7系统）要买就买带正版系统的！！
            </p>
            <h2>
                苹果wifi版IPAD2
            </h2>
            <p>
                <a href=""><img src="images/smallpic/ipad2_small.jpg"
                                alt="IPAD2"/>
                </a>
            </p>
            <p>
                苹果wifi版IPAD2（16G）二代（MC979CH） 薄了，轻了，快了 快来抢先体验吧！送苹果保护膜
            </p>
            <p>
                <a href="../digitalmalladv.html">返回数码商城</a>
            </p>
        </div>
    </div><!-- end of sidebar2 -->

    <%

        //1.获取传递过来的ID
        String strid=request.getParameter("id");
        if(strid==null) {
            System.out.println(strid);
            response.sendRedirect("list_product.jsp");
        }else{
            int id = Integer.parseInt(strid);
            //2.根据ID获取对应商品的信息
            ProductDaoImpl pdi = new ProductDaoImpl();
            Product product = pdi.getProductById(id);
    %>

    <div id="productinfodiv">
        <div id="productimg">
            <img src="<%=product.getPic()%>" width="310" height="310"/>
        </div>
        <div id="tips" style="float: left; width: 430px; height: 200px">
            <form action="<%=path %>/CartServlet?type=add" method="post" name="addCarForm">
                <h1><%=product.getName()%>
                </h1>
                <input type="hidden" name="flag" value="add"/>
                <input type="hidden" name="id" value="<%=product.getId()%>"/>
                <input type="hidden" name="code" value="<%=product.getCode()%>"/>
                <input type="hidden" name="name" value="<%=product.getName()%>"/>
                <input type="hidden" name="price" value="<%=product.getPrice()%>"/>
                <input type="hidden" name="sale" value="<%=product.getSale()%>"/>
                <input type="hidden" name="pic" value="<%=product.getPic()%>"/>
                <ul>
                    <li style="list-style: none;" class="bt"></li>
                    <li style="list-style: none;" class="text">
                        商品编号：<%=product.getCode()%>
                    </li>
                    <li style="list-style: none;" class="text">
                        价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：￥<%=product.getPrice()%>
                    </li>
                    <li style="list-style: none;" class="text">
                        促销信息：直降￥<%=product.getSale()%>
                    </li>
<%--                    <li style="list-style: none;" class="text">--%>
<%--                        促销信息：直降￥<%=product.getPrice() - product.getSale()%>--%>
<%--                    </li>--%>
                    <li style="list-style: none;" class="bt">
                        库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存：<%=product.getNum()%>
                    </li>
                    <li
                            style="list-style: none; font-size: 13px; font-family: 黑体; color: #ff0000;">
                        我要买:
                        <input type="text" name="num" id="num" size="3">
                        件
                    </li>
                </ul>
                <img hspace="50" src="../images/gwc.png" onclick="javascript:checkAddCarForm();" s>
            </form>
        </div>
        <div class="cl"></div>
        <div id="main2">

            <div id="intro" style="margin-top: 10px">
                <div class="cl"><%=product.getIntro()%>
                </div>
            </div>
            <div class="cl"></div>
        </div>
    </div>

    <%
        }
    %>

    <div id="right">
        <div id="login">
            <form id="loginform" name="loginform" method="post" action="<%=path %>/LoginServlet">
                <div><strong>登录名：</strong><input name="txtUser" id="txtUser" size="15"/></div>
                <div><strong>密　码：</strong><input name="txtPassword" type="password" id="txtPassword" size="15"/></div>
                <div>
                    <strong>验证码：</strong><input name="verifyCode" id="verifyCode" size="4"/>
                    <img src="<%=path %>/VerifyCodeServlet" onclick="this.src='<%=path %>/VerifyCodeServlet'"/>
                </div>
                <div><input type="submit" value="登录" name="submit" class="picbut"/>　
                    <input name="reg" type="button" value="注册用户" class="picbut"
                           onclick="javascript:location.href=('regist.jsp');"/>
                </div>
            </form>
            <ul>
                <li>欢迎回来，</li>
                <li><a href="list_cart.jsp">我的购物车</a></li>
                <li><a href="list_order.jsp">我的订单</a></li>
                <li><a href="<%=path %>/userInfo.jsp">个人信息</a></li>
                <li><a href="../LogoutServlet">退出</a></li>
            </ul>
        </div>
        <div class="news">
            <p><img src="../images/title3.gif" alt="" width="100" height="30"/></p>
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


</div>
<div id="ticket">
    <p>
        <img src="../images/ticket.gif" alt="优惠券"/>
    </p>
</div>
<div id="footer">
    <p>
        copyright &copy;.All Rights Reserverd. Design form XXX
    </p>
</div>
</body>
</html>