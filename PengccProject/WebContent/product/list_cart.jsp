<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.digitalweb.model.Cart" %>
<%@ page import="com.digitalweb.model.User" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN" xml:lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>四叶草数码商城购物车</title>
    <link type="text/css" rel="stylesheet" href="../style/main.css"/>
    <script type="text/javascript">
        function updateCart(index, num) {
            var curForm = document.getElementById("form" + index);
            if ((curForm.num.value - (-num)) <= 0) {
                alert("请输入正确的数量！");
            } else {
                curForm.num.value = curForm.num.value - (-num);
                curForm.submit();
            }
        }

        function changeNum(index) {
            var curForm = document.getElementById("form" + index);
            if (curForm.num.value <= 0) {
                alert("请输入正确的数量！");
                curForm.num.value = 1;
            } else {
                curForm.submit();
            }
        }
    </script>
</head>
<body>
<div id="header">
    <div id="header_inside">
        <p><img src="../images/header.jpg" alt="四叶草数码商城banner" usemap="#Map"/>
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
    <div id="buycar">
        <p><img src="images/buycar_logo.gif" alt="购物车"/></p>
        <table>
            <tr>
                <th width="6%">选项</th>
                <th width="15%">商品图片</th>
                <th width="20%">商品名称</th>
                <th width="8%">商品单价</th>
                <th width="28%">数量</th>
                <th width="11%">单价优惠</th>
                <th width="6%">小计</th>
                <th width="6%">删除</th>
            </tr>

            <%
                ArrayList<Cart> cartlist = (ArrayList<Cart>) session.getAttribute("cartlist");
                double sum = 0;
                if (cartlist != null) {
                    int i = 0;
                    for (Cart c : cartlist) {
            %>
            <form id="form<%=i%>" method="post" action="../CartServlet?type=update">
                <input type="hidden" name="flag" value="update"/>
                <input type="hidden" name="id" value="<%=c.getId()%>"/>
                <tr>
                    <td><input type="checkbox" name="chkBox" value="checkbox"/></td>
                    <td>
                        <a href="detail_product.jsp?id=<%=c.getId()%>"><img src="<%=c.getPic()%>" width="75" height="50"
                                                                            alt=""/></a>
                    </td>
                    <td><a href="detail_product.jsp?id=<%=c.getId()%>"><%=c.getName()%>
                    </a></td>
                    <td>￥<%=c.getPrice()%>
                    </td>
                    <td>
                        <a onclick="updateCart(<%=i%>,-1)">-</a>
                        <input type="text" size="2" onChange="changeNum(i)" name="num" id="num" value="<%=c.getNum()%>"/>
                        <a onclick="updateCart(<%=i%>,1)">+</a>
                    </td>
                    <td>￥<%=c.getSale()%>
                    </td>
                    <td>￥<%=c.getPrice() * c.getNum()%>
                    </td>
                    <td><a href="../CartServlet?type=delete&id=<%=c.getId()%>">删除</a></td>
                </tr>
            </form>
            <%
                        i++;
                        sum += c.getPrice() * c.getNum();
                    }
                }
            %>
            <tr>
                <td colspan="6">总价：<%=sum%>
                </td>
                <td>
                    <input type="button" name="totalprice" value="返回" class="picbut" onclick="history.back(-1)"/>
                </td>
                <td>
                    <input type="button" name="totalprice" value="结 算" class="picbut"
                           onclick=" javascript:window.location.href='../buy/checkout.jsp'" />
                </td>
            </tr>
        </table>
        </form>
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
                  action="../LoginServlet">
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

</div>
<div id="footer">
    <p>copyright &copy;.All Rights Reserverd. Design form XXX </p>
</div>
</body>
</html>
