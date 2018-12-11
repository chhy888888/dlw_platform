<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String fcid = request.getAttribute("fcid") + "";
String fnid = request.getAttribute("fnid") + "";
String fcfacustomerid = request.getAttribute("fcfacustomerid") + "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; UTF-8">
  
    <title>11111111111</title>
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jQuery.easyui.js"></script>
  </head>
 <body>
  <script type="text/javascript">
  	var fcid = '<%=fcid%>';		//正式合同主键
	var fnid = '<%=fnid%>';		//融资表主键
	var fcfacustomerid = '<%=fcfacustomerid%>';
	$(function(){
		getselectyxb();
		getselectrzb();
	})
  	//查询正式合同
  	function getselectyxb(){
		var uls = "<%=basePath %>financing/getfinancingContractInfo?fc_id=" + fcid;
		$.ajax({
			type : "post",
			url : uls,
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				var data = $.parseJSON(dataInfo);
				$("#rzb").html(dataInfo);
				$("#blyxbid").val(data.data.fc_fiid);
			}
		});
  	}
  	//付款1
  	function getfk1(){
  		alert("上传1完毕");
  	}
  	//付款2
  	function getfk2(){
  		alert("上传2完毕");
  	}
	//付款3上传并且修改状态
  	function getfk3(){
  		var fiid = $("#blyxbid").val();
		var uls = "<%=basePath %>financing/getupdateNeedsofIntentionofContractTen?fn_id=" + fnid + "&fc_id=" + fcid + "&fi_id=" + fiid;
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
  </script>
  fnid = <%=fnid%> fcid = <%=fcid%> fcfacustomerid = <%=fcfacustomerid%> <br></br>
  付款一：<br />
  付款时间：<input type = "text" id = ""/> <br />
 <input type = "button" value = "提交" onclick="getfk1()"/><br />
 付款二：<br />
 付款时间：<input type = "text" id = ""/> <br />
 <input type = "button" value = "提交" onclick="getfk2()"/><br />
 付款三：<br />
 付款时间：<input type = "text" id = ""/> <br />
 <input type = "button" value = "提交" onclick="getfk3()"/><br />
 <input type = "text" id = "blyxbid" /><br />
 <div id = "rzb"></div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 </body>
</html>
