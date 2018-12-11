<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String fcfnid = request.getAttribute("fc_fnid") + "";
String Country = request.getAttribute("Country") + "";
String fn_name = request.getAttribute("fn_name") + "";
String fn_code = request.getAttribute("fn_code") + "";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>场次管理</title>
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
</head>
<body>
<form id = "frombl" method="post"></form>
项目编号：<samp id = "xmcode"><%=fn_code %></samp><br />
买方国家/地区：<samp id = "mfgjdq"><%=Country %></samp><br />
买方：<samp id = "mfname"><%=fn_name %></samp><br>
<table border="1"  id="paperdg">
			<tr>
				<th>已签意向</th>
				<th>资金方</th>
				<th>年利率</th>
				<th>融资比例（意向报价）</th>
				<th>意向报价</th>
				<th>进度</th>
			</tr>
	</table>
	<script type="text/javascript">
		var fcfnid = '<%=fcfnid%>';
		$(function(){
			getrzzbList();
		})
		function getrzzbList(){
			var uls = "<%=basePath %>financing/getfinancingContractList?fc_fnid=" + fcfnid;
			$.ajax({
				type : "post",
				url : uls,
				dataType : "text",
				async : false,
				success : function(dataInfo) {
					//格式化
					var data = $.parseJSON(dataInfo);
					data = data.data.rows;
					var strHtml = "";
					for(var i = 0; i < data.length ; i++){
						var str = "";
						if(data[i].fi_status == '2'){
							str = '卖家确认意向协议<input type = "button" value = "取消意向" onclick="getqxyx(\''+data[i].fi_id+'\',\''+data[i].fn_id+'\')">';
						}else if(data[i].fi_status == '1'){
							//str = '形成保理意向';
						}
						strHtml += "<tr>";
						strHtml += "<td>"+str+"</td>";
						strHtml += "<td>"+data[i].facustomerid+"</td>";
						strHtml += "<td>"+data[i].fi_yearrate_from+"%-"+data[i].fi_yearrate_to+"%</td>";
						strHtml += "<td>"+data[i].fi_scale+"</td>";
						strHtml += "<td><a onclick='getccqdxy(\""+data[i].fi_id+"\",\""+data[i].fn_id+"\",\""+data[i].fi_status+"\")'>查看/签订协议"+data[i].fi_status+"</a></td>";
						strHtml += "<td><a onclick='getinfo1(\""+data[i].fi_id+"\")'>查看详情</a></td>";
						strHtml += "</tr>";
					}
					$("#paperdg").append(strHtml);
				}
			});
		}
		//取消意向
		function getqxyx(fiid,fnid){
			var uls = "<%=basePath %>financing/getUpdateNeedsofIntentionqx?fi_id="+ fiid +"&fn_id=" + fnid;
			$.ajax({
				type : "post",
				url : uls,
				dataType : "text",
				async : false,
				success : function(dataInfo) {
					alert(dataInfo);
					getrzzbList();
				}
			});
		}
		
		//查看/签订协议
		function getccqdxy(fiid,fnid,fistatus){
			var uls = "<%=basePath %>exportfactoring/getccqdxy?fiid="+fiid+"&fnid="+fnid+"&fi_status="+fistatus;
			$("#frombl").attr("action",uls);
			$("#frombl").submit();
		}
		//查询保理报价列表
		function getbllb(obj){
			
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