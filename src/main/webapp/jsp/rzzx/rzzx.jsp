<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String fiid = request.getAttribute("fiid") + "";
String fnid = request.getAttribute("fnid") + "";
String fistatus = request.getAttribute("fi_status") + "";
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
  	var fiid = '<%=fiid%>';		//意向表主键
  	var fnid = '<%=fnid%>';		//融资表主键
  	var fistatus = '<%=fistatus%>';
	$(function(){
		if(fistatus >= 8){
			$("#qdyxbj").hide();
		}
		getselectyxb();
		getselectrzb();
	})
  	//查询意向表
  	function getselectyxb(){
  		var uls = "<%=basePath %>financing/getfinancingIntentionInfo?fi_id=" + fiid;
		$.ajax({
			type : "post",
			url : uls,
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				$("#yxb").html(dataInfo);
			}
		});
  	}
  	//查询融资表
  	function getselectrzb(){
  		var uls = "<%=basePath %>financing/getfinancingNeedsInfo?fn_id=" + fnid;
		$.ajax({
			type : "post",
			url : uls,
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				$("#rzb").html(dataInfo);
			}
		});
  	}
	//确定意向报价
	function getqdyxbj(){
		var uls = "<%=basePath %>financing/getUpdateNeedsofIntention?fn_id=" + fnid +"&fi_id=" + fiid;
		$.ajax({
			type : "post",
			url : uls,
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				alert();
			}
		});
	}
  </script>
 <input type = "button" value = "确定意向报价" id = "qdyxbj" onclick="getqdyxbj()"/>
 <div id = "yxb"></div>
 <div id = "rzb"></div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 </body>
</html>
