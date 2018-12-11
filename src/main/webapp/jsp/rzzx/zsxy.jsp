<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>场次管理</title>
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
</head>
<body>
<form id = "fromzs" method="post"></form>
项目编号:<input type = "text" id = "fn_code">发布时间<input type = "text" id = "fn_datetimeQ">  ---  <input type = "text" id = "fn_datetimeJ">
<input type = "button" onclick = "getrzzbList()" value = "查询">
<table border="1"  id="paperdg">
			<tr>
				<th>项目编号</th>
				<th>买房国家/地区</th>
				<th>买方</th>
				<th>资金方</th>
				<th>年利率（正式报价）</th>
				<th>金融比例（正式报价）</th>
				<th>发布时间</th>
				<th>操作</th>
			</tr>
	</table>
	<script type="text/javascript">
		$(function(){
			getrzzbList();
		})
		function getrzzbList(){
			var fn_code = $("#fn_code").val();
			var fn_datetimeQ = $("#fn_datetimeQ").val();
			var fn_datetimeJ = $("#fn_datetimeJ").val();
			var uls = "<%=basePath %>financing/getneedsofContractList";
			uls = uls;
			$.ajax({
				type : "post",
				url : uls,
				data : {fn_code:fn_code,fn_datetimeQ:fn_datetimeQ,fn_datetimeJ:fn_datetimeJ,fn_status:"5"},
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
						strHtml += "<td>"+data[i].fc_yearrate+"</td>";
						strHtml += "<td>"+data[i].fc_scale+"</td>";
						strHtml += "<td>"+data[i].fc_datetime+"</td>";
						strHtml += "<td><a href='javascript:;' onclick='getzsxyinfo(\""+data[i].fc_id+"\",\""+data[i].fn_id+"\",\""+data[i].fc_fiid+"\")'>正式协议</a> |";
						strHtml += " <a href='javascript:;' onclick='getinfo1(\""+data[i].fn_id+"\")'>查看详情</a></td>";
						strHtml += "</tr>";
					}
					$("#paperdg").empty().append(strHtml);
				}
			});
		}
		//正式协议
		function getzsxyinfo(fcid,fnid,fiid){
			var uls = "<%=basePath %>exportfactoring/getzsxyinfo?fcid="+fcid+"&fnid="+fnid+"&fiid="+fiid;
			$("#fromzs").attr("action",uls);
			$("#fromzs").submit();
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
		function getinfo1(obj){
			var uls = "<%=basePath %>exportfactoring/getZsxyXQinfo?fcid="+obj;
			$("#fromzs").attr("action",uls);
			$("#fromzs").submit();
		}
	</script>
</body>
</html>