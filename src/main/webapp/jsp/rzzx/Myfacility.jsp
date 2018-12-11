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
平台对账：<br />
买方/资金方：<input type = "text" >  
发布时间：<input type = "text" id = "fbtimaq"> --- <input type = "text" id = "fbtimej"> 
<input type = "button" id = "" value = "查       询">
<table id = "ptdzList" border="1">
	<tr>
		<td>项目编号</td>
		<td>买方国家/地区</td>
		<td>买方</td>
		<td>资金方</td>
		<td>合计发票金额（商业发票金额）</td>
		<td>融资比例</td>
		<td>融资金额（文本融资款）</td>
		<td>融资款是否支付（保理融资款日期不为空状态8）</td>
		<td>年利率</td>
		<td>利息（文本融资利息）</td>
		<td>平台协议佣金比例（用融资金额在from - to 之间 and 报关单币种 = comm_currency）</td>
		<td>平台协议佣金（融资金额 \ 融资比例 * 佣金比例）</td>
	</tr>
</table>
企业信息：<br />
<div id = "cominfo"></div><br>
<input type = "button" value = "提    交"><br /><br />

<form id = "form" method="post">
</form>
<input type = "button" onclick="getupdatepassword()" value = "修改密码" ><br><br>

<script type="text/javascript">
	
	$(function(){
		getrzzbList();
		//getcomInfo();
	})
	//查询平台对账
	function getrzzbList(){
		var fn_code = $("#fn_code").val();
		var fn_datetimeQ = $("#fn_datetimeQ").val();
		var fn_datetimeJ = $("#fn_datetimeJ").val();
		var uls = "http://localhost:8080/financing/getneedsofContractList";
		uls = uls;
		$.ajax({
			type : "post",
			url : uls,
			data : {fn_code:fn_code,fn_datetimeQ:fn_datetimeQ,fn_datetimeJ:fn_datetimeJ},
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				//格式化
				var data = $.parseJSON(dataInfo);
				data = data.data.rows;
				var strHtml = "";
				for(var i = 0; i < data.length ; i++){
					strHtml += "<tr>";
					strHtml += "<td>"+data[i].fn_code+"</td>";
					strHtml += "<td>"+data[i].Country+"</td>";
					strHtml += "<td>"+data[i].fn_name+"</td>";
					strHtml += "<td>"+data[i].facustomerid+"</td>";
					strHtml += "<td></td>";
					strHtml += "<td>"+data[i].fc_scale+"</td>";
					strHtml += "<td>"+data[i].fn_status+"</td>";
					strHtml += "<td>"+data[i].fc_yearrate+"</td>";
					strHtml += "</tr>";
				}
				$("#ptdzList").append(strHtml);
			}
		});
	}
	//企业信息
	function getcomInfo(){
		var uls = "http://localhost:8080/financing/getComInfo";
		uls = uls;
		$.ajax({
			type : "post",
			url : uls,
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				$("#cominfo").html(dataInfo);
			}
		});
	}
	//修改密码
	function getupdatepassword(){
		var uls = "http://localhost:8080/exportfactoring/getupdateinfo";
		$("#form").attr("action",uls);
		$("#form").submit();
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