<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Myfacility</title>
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
</head>
<body>
<div id = "comid"></div><br><br><a onclick="getfsyj('15591640@qq.com')">发送邮件</a><br>
<br />
邮箱验证码：<input type = "text" id = "yzm">
<input type = "button" value = "下一步"><br /><br />

<script type="text/javascript">
	
	$(function(){
		getcominfo();
	})
	//发送邮件
	function getfsyj(obj){
		//var uls = "<%=basePath %>financing/getComInfoEmil?emil="+ obj;
		var uls = "<%=basePath %>mail/send";
		uls = uls;
		$.ajax({
			type : "post",
			url : uls,
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				alert(dataInfo);
			}
		});
	} 
	//查询企业信息
	function getcominfo(){
		var uls = "<%=basePath %>financing/getComInfo";
		uls = uls;
		$.ajax({
			type : "post",
			url : uls,
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				$("#comid").html(dataInfo);
			}
		});
	}
</script>
	<!--时间控件-->
	<script type="text/javascript">
		function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
	</script>
</body>
</html>