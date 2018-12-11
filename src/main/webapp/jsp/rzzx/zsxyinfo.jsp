<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String fcid = request.getAttribute("fcid") + "";
String fnid = request.getAttribute("fnid") + "";
String fiid = request.getAttribute("fiid") + "";
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
  	var fiid = '<%=fiid%>';		//保理意向主键
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
	//签订正是融资协议
	function getqdyxbjyes(){
		var fiid = $("#blyxbid").val();
		var uls = "<%=basePath %>financing/getupdateNeedsofIntentionofContractYes?fn_id=" + fnid + "&fc_id=" + fcid + "&fi_id=" + fiid;
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
	//不签订正是融资协议
	function getqdyxbjno(){
		var fiid = $("#blyxbid").val();
		var uls = "<%=basePath %>financing/getupdateNeedsofIntentionofContractNo?fn_id=" + fnid + "&fc_id=" + fcid + "&fi_id=" + fiid;
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
	//下载合同
	function getDownloadContract(){
		alert("111");
		var uls = "<%=basePath %>financing/getFileList?af_fnid=" + fnid + "&af_fcid=" + fcid + "&af_fiid=" + fiid;
		alert("111"+uls);
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
  融资：fnid=<%=fnid%> 正式合同fcid= <%=fcid %> 保理意向fiid = <%=fiid %><br />
 保理上传的<input type = "button" value = "下载合同" onclick="getDownloadContract()"/>
  卖家上传的
  <input type = "file"/> <input type = "button" value = "上传"/>
  <br /><br />
  
 <input type = "button" value = "签订正是融资协议" onclick="getqdyxbjyes()"/>
 <input type = "button" value = "不签订正是融资协议" onclick="getqdyxbjno()"/>
 <input type = "text" id = "blyxbid" />
 <div id = "yxb"></div><br /><br />
 <div id = "rzb"></div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 </body>
</html>
