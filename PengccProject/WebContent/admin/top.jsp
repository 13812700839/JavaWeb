<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script src="../js/jquery-1.8.0.js" type="text/javascript"></script>
<script type="text/javascript" >
    function now_time(){
        var now_Date = new Date();//获取当前时间
        var nowYear;
        var nowMonth;
        var nowdate;
        var nowHourse;
        var nowMinutes;
        var nowSeconds;
        nowYear = now_Date.getYear()+1900; //获取当前时间中的年份
        nowMonth = now_Date.getMonth() + 1;//获取当前时间中的月份
        nowdate= now_Date.getDate();   //获取当前时间中的日期
        nowHourse = now_Date.getHours();
        nowMinutes = now_Date.getMinutes();
        nowSeconds = now_Date.getSeconds();
        var timerDetails = nowYear+'年'+nowMonth+'月'+nowdate+'日'+' '+nowHourse+':'+nowMinutes+':'+nowSeconds; //组合成当前时间字符串
        $('#ct').html(timerDetails);
        //document.getElementById("ct").innerText = timerDetails;
        //在指定显示时间容器中显示时间字符串
    }
    setInterval("now_time();",1000);//每秒执行一次 now_time()函数
</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #43860c;
	font-size: 12px;
}
-->
</style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
  <tr>
    <td height="9" style="line-height:9px; background-image:url(images/main_04.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="97" height="9" background="images/main_01.gif">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="47" background="images/main_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="38" height="47" background="images/main_06.gif">&nbsp;</td>
        <td width="59"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="29" background="images/main_07.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="18" background="images/main_14.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
              <tr>
                <td  style="width:1px;">&nbsp;</td>
                <td ><span class="STYLE1">admin</span></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="155" background="images/main_08.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="23" valign="bottom"><img src="images/main_12.gif" width="367" height="23" border="0" usemap="#Map" /></td>
          </tr>
        </table></td>
        <td width="200" background="images/main_11.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="11%" height="23">&nbsp;</td>
            <td width="89%" valign="bottom"><span class="STYLE1" id="ct">当前时间</span></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="5" style="line-height:5px; background-image:url(images/main_18.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="180" background="images/main_16.gif"  style="line-height:5px;">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>

<map name="Map" id="Map"><area shape="rect" coords="3,1,49,22" href="#" /><area shape="rect" coords="52,2,95,21" href="#" /><area shape="rect" coords="102,2,144,21" href="#" /><area shape="rect" coords="150,1,197,22" href="#" /><area shape="rect" coords="210,2,304,20" href="#" /><area shape="rect" coords="314,1,361,23" href="#" /></map></body>
</html>
