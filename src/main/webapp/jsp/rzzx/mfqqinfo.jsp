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
  	//发送确权邮件模板至邮箱
  	function getqdyxbjyes(){
  		var uls = "<%=basePath %>financing/getfactoringInfo?fa_customerid=" + fcfacustomerid;
		$.ajax({
			type : "post",
			url : uls,
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				$("#yjmb").html(dataInfo);
			}
		});
  	}
  	//提交确权
  	function getqdyxbjno(){
  		var fc_declarationanmount = $("#fc_declarationanmount").val();
  		var fc_advancecharge = $("#fc_advancecharge").val();
  		var fc_ladingbill = $("#fc_ladingbill").val();
  		var uls = "<%=basePath %>financing/getupdatefinancingContractInfo?fc_id=" + fcid +"&fc_declarationanmount="+ fc_declarationanmount +"&fc_ladingbill=" + fc_ladingbill +"&fc_advancecharge="+ fc_advancecharge;
		$.ajax({
			type : "post",
			url : uls,
			dataType : "text",
			async : false,
			success : function(dataInfo) {
				var data = $.parseJSON(dataInfo);
				if(data.message){
					getqdyxbjyes();
				}else{
					data.data;
				}
			}
		});
  	}
  	//修改状态
  	function getqdyxbjyes(){
		var fiid = $("#blyxbid").val();
		alert("fnid>" + fnid + "  fcid>>" + fcid + " fiid>>" + fiid);
		var uls = "<%=basePath %>financing/getupdateNeedsofIntentionofContractEight?fn_id=" + fnid + "&fc_id=" + fcid + "&fi_id=" + fiid;
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
  报关单金额:<input type = "text" id = "fc_declarationanmount" name = "fc_declarationanmount" value = "fc_declarationanmount"/><br></br>
  预付款金额:<input type = "text" id = "fc_advancecharge" name = "fc_advancecharge" value = "fc_advancecharge"/><br></br>
  提单时间:<input type = "text" id = "fc_ladingbill" name = "fc_ladingbill" value = "fc_ladingbill"/><br></br>
 <div id = "yjmb">一次签署三方：
签署一次三方（买方、卖方、资金方）应收账款转让协议，具体每笔订单通过电子邮件确认，无需再次签署三方应收账款转让协议</div>
 <input type = "button" value = "发送确权邮件模板至邮箱" onclick="getqdyxbjyes()"/><br></br>
 本次融资出口单据<br />
出口合同 <input type = "file" /><br />
订单 <input type = "file" /><br /> 
提单<input type = "file" /><br />
商业发票（CI）<input type ="text" id = "fc_commercialinvoice" name = "fc_commercialinvoice" value = "fc_commercialinvoice"/><input type = "file" /><br />
 
 <input type = "button" value = "提交确权" onclick="getqdyxbjno()"/>
 <input type = "text" id = "blyxbid" />
 <div id = "yxb"></div><br /><br />
 <div id = "rzb"></div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 </body>
</html>
