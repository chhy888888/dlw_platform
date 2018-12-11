<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	//保存
	function save(){
		if($("#cul_account").val()=="" || $("#cul_account").val()=="此用户名已存在!"){
			
			$("#cul_account").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#cul_account").focus();
			$("#cul_account").val('');
			$("#cul_account").css("background-color","white");
			return false;
		}else{
			$("#cul_account").val(jQuery.trim($('#cul_account').val()));
		}
		
		if($("#cul_name_cn").val()=="" && $("#cul_name_en").val()==""){
			
			$("#cul_name_cn").tips({
				side:3,
	            msg:'输入公司名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#cul_name_cn").focus();
			return false;
		}else{
			$("#cul_name_cn").val($.trim($("#cul_name_cn").val()));
			$("#cul_name_en").val($.trim($("#cul_name_en").val()));
		}
		
		if($("#cul_email").val()==""){
			
			$("#cul_email").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#cul_email").focus();
			return false;
		}else if(!ismail($("#cul_email").val())){
			$("#cul_email").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#cul_email").focus();
			return false;
		}
		
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#cul_account").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>manager/customer/hasCustomer.do',
	    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#userForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#loginname").css("background-color","#D16E6C");
					setTimeout("$('#loginname').val('此用户名已存在!')",500);
				 }
			}
		});
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#cul_email").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>manager/customer/hasEmail.do',
	    	data: {cul_email:EMAIL,cul_account:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#cul_email").tips({
							side:3,
				            msg:'邮箱已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					setTimeout("$('#cul_email').val('')",2000);
				 }
			}
		});
	}
	
	
</script>
	</head>
<body>
	<form action="manager/customer/${msg }.do" name="userForm" id="userForm" method="post">
		<input type="hidden" name="cul_id" id="cul_id" value="${customer.cul_id }"/>
		<input type="hidden" name="cul_type" id="cul_type" value="${cul_type }"/>
		<div id="zhongxin">
		<table width="90%" style="margin:auto;">
						
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="cul_account" id="cul_account" value="${customer.cul_account }" maxlength="32" placeholder="这里输入用户名" title="用户名"/></td>
			</tr>
			<tr>
				<td>公司名称(CN)：</td>
				<td><input type="text" name="cul_name_cn" id="cul_name_cn" value="${customer.cul_name_cn }" maxlength="32" placeholder="这里输入公司中文名" title="公司中文名" /></td>
			</tr>
			<tr>
				<td>公司名称(EN)：</td>
				<td><input type="text" name="cul_name_en" id="cul_name_en" value="${customer.cul_name_en }" maxlength="32" placeholder="这里输入公司英文名" title="公司英文名" /></td>
			</tr>
			<tr>
				<td>所在国家</td>
				<td>
					<select class="chzn-select" name="cul_continent" id="cul_continent" data-placeholder="选择洲" onchange="chgcontinent(this.value);" style="vertical-align:top;width: 120px;" >
					<option value=""></option>
					<option value="">全部</option>
					<c:forEach items="${continentList}" var="continent" varStatus="vs">
					<option value="${continent.sd_id}">${continent.sd_item}</option>
					</c:forEach>
					</select>
					<select class="country-chzn-select" name="cul_country" id="cul_country" data-placeholder="选择国家" style="vertical-align:top;width: 120px;">
						<option value=""></option>
						<option value="">全部</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>公司邮箱：</td>
				<td><input type="text" name="cul_email" id="cul_email" value="${customer.cul_email }" maxlength="32" placeholder="这里输入公司邮箱" title="公司邮箱" onblur="hasN('${pd.USERNAME }')"/></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="cul_password" id="cul_password" value="${customer.cul_password }" maxlength="32" placeholder="这里输入公司邮箱" title="公司邮箱" /></td>
			</tr>
			<tr>
				<td>联系电话：</td>
				<td><input type="text" name="cul_phone" id="cul_phone" value="${customer.cul_phone }" maxlength="32" placeholder="这里输入联系电话" title="联系电话" /></td>
			</tr>
			<tr>
				<td>公司网址：</td>
				<td><input type="text" name="cul_website" id="cul_website" value="${customer.cul_website }" maxlength="32" placeholder="这里输入公司网址" title="公司网址" /></td>
			</tr>
			<tr>
				<td>联系人微信：</td>
				<td><input type="text" name="cul_wechat_number" id="cul_wechat_number" value="${customer.cul_wechat_number }" maxlength="32" placeholder="这里输入联系人微信" title="联系人微信" /></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		
		<script type="text/javascript">
		function chgcontinent(parentid)
		{
			$.ajax({
				type: "POST",
				url: 'system/getSystemDictionariesSubnode',
				data: {sd_parentid:parentid,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("200" == data.code){
						var maxIndex=$("#cul_country option:last").attr("index");
						for (i = maxIndex;i > 1 ;i -- )
						{
							$("#cul_country option:last").remove();
						}
						var html = "";
						for (i = 0;i < data.data.length ;i ++ )
						{
							html += "<option value='" + data.data[i].sd_id + "'>" + data.data[i].sd_item + "</option>";
						}
						$("#cul_country").append(html);
						$('.country-chzn-select').trigger('liszt:updated');
					}
				}
			});
		}
		
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			$(".country-chzn-select").chosen(); 
			$(".country-chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			
		});
		
		</script>
	
</body>
</html>