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
<form id = "form" action = "<%=basePath %>exportfactoring/getMyrz?ran='+Math.random()" method="post">
<input type = "submit" value = "发布融资订单" ><br><br>
</form>
项目编号:<input type = "text" id = "fn_code">发布时间<input type = "text" id = "fn_datetimeQ">  ---  <input type = "text" id = "fn_datetimeJ">
<input type = "button" onclick = "getrzzbList()" value = "查询">
<table border="1"  >
<thead>
			<tr>
				<th>项目编号</th>
				<th>买房国家/地区</th>
				<th>买方</th>
				<th>信用额度</th>
				<th>买房账期</th>
				<th>信息有效期</th>
				<th>发布时间</th>
				<th>意向保理公司数</th>
				<th>订单状态</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody id="paperdg"></tbody>
	</table>
	<form id = "formbl" method="post"></form>
	<script type="text/javascript">
		$(function(){
			getrzzbList();
		})
		function getrzzbList(){
			var fn_code = $("#fn_code").val();				//项目编号
			var fn_datetimeQ = $("#fn_datetimeQ").val();	//发布时间启
			var fn_datetimeJ = $("#fn_datetimeJ").val();	//发布时间结
			var uls = "<%=basePath %>financing/getfinancingNeedsList";
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
						strHtml += "<td>"+data[i].fn_creditlimitcurrency+""+data[i].fn_creditlimit+"</td>";
						strHtml += "<td>"+data[i].fn_accountperiod+"天</td>";
						strHtml += "<td>"+data[i].fn_validity+"</td>";
						strHtml += "<td>"+data[i].fn_datetime+"</td>";
						strHtml += "<td>"+data[i].blcom+"</td>";
						strHtml += "<td>"+data[i].fn_status+"</td>";
						strHtml += "<td><a onclick='getinfo1(\""+data[i].fn_id+"\")'>详情</a> |";
						strHtml += "<a  onclick='getbllb(\""+data[i].fn_id+"\",\""+data[i].Country+"\",\""+data[i].fn_name+"\",\""+data[i].fn_code+"\",\""+data[i].fn_status+"\")'>保理报价列表</a></td>";
						strHtml += "</tr>";
					}
					$("#paperdg").empty().append(strHtml);
				}
			});
		}
		//查询保理报价列表
		function getbllb(obj1,obj2,obj3,obj4,obj5){
			var uls = "<%=basePath %>exportfactoring/getjrblbjlb?fc_fnid="+obj1+"&Country="+obj2+"&fn_name="+obj3+"&fn_code="+obj4+"&fn_status="+obj5;
			$("#formbl").attr("action",uls);
			$("#formbl").submit();
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