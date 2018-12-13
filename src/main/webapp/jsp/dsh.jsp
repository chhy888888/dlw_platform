<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; UTF-8">
    <base href="<%=basePath%>">
    <title>待审核</title>
 	
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/default.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/icon.css" />
	<script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.easyui.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		/* $("#change").click(function(){
			$("#checkCodeImg").attr("src","jsp/rand.jsp?dt="+new Date().getTime());
			return false;
		}); */
		//上传保存
		$("#uploadbutton").click(function () {
			var filename = $("#scsxedzl").val();
			filename = filename.split("\\")[filename.split("\\").length - 1];
			var af_fnid = $("#fn_id").val();
			var af_fieldname = "fn_id";
			var af_descript = filename;
			var af_path = "http://139.196.85.212/doc/usr/2018111415423473951.png";
			$.ajax({
	  	        url: "<%=basePath %>financing/getaddAttachmentsInfo",
	  	     	data : {af_fnid:af_fnid,af_fieldname:af_fieldname,af_descript:af_descript,af_path:af_path},
	  	        type : "post",
	  	        dataType: "text",
	  	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	  	        success: function (dataInfo) {
	  	        	alert("<>"+dataInfo);
	  	        }
	  	    });
		});
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
  	function updateUser(){
  		<%-- $("#myForm").form("submit", {    
            url:"<%=basePath%>system/getupdateUserInfo",  
            success:function(data){
            	alert(33);
          	   /* var json=$.parseJSON(data);
              $.messager.alert('温馨提示',json.message,'info');
              if(json.success){
                    $('#sysdatabase').datagrid('reload');
              } */
            }
      }); --%> 
      debugger;
  		$('#myForm').form('submit', {
  		    url:"<%=basePath%>system/getupdateUserInfo?ss=1&"+$(this).serialize(),
  		    onSubmit: function(param){
  				param.p1 = 'value1';
  				param.p2 = 'value2';
  		    },
  		  success:function(data){
  			alert(2222)
  	   	 }
  		});
  		<%-- $.post("<%=basePath%>system/getupdateUserInfo", $('#myForm').serialize(), function (result) {
            alert(34);
        }); --%>
  		<%-- if ($('#myForm').form("validate"))
        {
            $.post("<%=basePath%>system/getupdateUserInfo", $('#myForm').serialize(), function (result) {
                /* if (result.success == true) {
                    $('#dlg').dialog('close');
                    $('#dg').datagrid('reload');
                }
                else {
                    $.messager.show({
                        title: 'Error',
                        msg: result.message
                    });
                } */   
                alert(34);
            });
        } --%>
  	}
	<%-- // 回车登陆 
	$(document).keyup(function(event){
          if(event.keyCode ==13){  
        	  getlogin();  
         }  
     });   
  	//验证登陆
  	function getqweqwe(){
  		
  	}
	//注册
	function getuserjr(){
		var uls = "<%=basePath %>exportfactoring/getuserjr";
		$("#fromadd").attr("action",uls);
		$("#fromadd").submit();
	} --%>
  </script>
  </head>
 <body class="easyui-layout" style="overflow-y: hidden"  scroll="yes">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
    <div region="north" border="false" style="overflow: hidden; height: 40px;
        background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 40px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 系统管理员 <a href="#" id="editpass">个人信息</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 20px; "><img src="images/blocks.gif" width="20" height="20" align="absmiddle" /> OOWAY 卖家管理端 </span>
    </div>
    <div region="south" style="height: 30px; background: #D2E0F2; ">
        <div class="footer"></div>
    </div>
   <!--  <div region="west"  split="true"  title="导航菜单" style="width:180px;" id="west">
<div class="easyui-accordion" fit="true" border="false">
		 导航内容
				
			</div>

    </div> -->
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden;" title="完善信息" >
        <div id="tabs" class="easyui-tabs" border="false" align="center">
        <div class="easyui-panel" title="" align="center" fit="true">
        <form id="myForm"  method="post" enctype="multipart/form-data">
        <table>
        	<tr>
        		<td>公司名称(Company Name):</td>
        		<td><c:out value="${userMap.cul_name_cn }"></c:out></td>
        	</tr>
        	<tr>
        		<td>公司地址(Street And Number PO Box):</td>
        		<td><input class="textbox" type="text" name="ent_address" data-options="required:true" style="width:200px;height:32px"></td>
        		<td>邮政编码(Postcode):</td>
        		<td><input class="textbox" type="text"  name="code" data-options="required:true" style="width:200px;height:32px"></td>
        	</tr>
        	<tr>
        		<td>法人代表姓名(Person in charge):</td>
        		<td><input class="textbox" type="text"  name="mname" data-options="required:true" style="width:200px;height:32px"></td>
        		<td>公司邮箱(Email):</td>
        		<td>
        		<input class="textbox" type="text"  name="mname" data-options="required:true" style="width:200px;height:32px">
        		<a class="easyui-linkbutton" style="width:150px;height:32px" onclick="getfsyj('15591640@qq.com')">发送邮件</a>
        		</td>
        	</tr>
        	<tr>
        		<td>邮箱验证码：</td>
        		<td><input class="textbox" type = "text" id = "yzm" style="width:200px;height:32px"></td>
        		<td>联系电话(Mobile):</td>
        		<td>
        		<input class="textbox" type="text"  name="mname" data-options="required:true" style="width:200px;height:32px">
        		</td>
        	</tr>
        	<tr>
        		<td>财务报表:</td>
        		<td colspan="4">
        		<input class="easyui-filebox" id="fileImport" name="fileImport" style="width:200px;height:32px">
        		<input class="easyui-filebox" id="fileImports" name="fileImports" style="width:200px;height:32px">
        		</td>
        	</tr>
        	<tr>
        		<td colspan="4"><button type="button" class="easyui-linkbutton" iconCls="icon-ok" style="width:50%;height:32px" onclick="updateUser()">提交</button></td>
        	</tr>
        </table>
		</form>
		</div>
	</div>
    </div>
    
    
    <!--修改密码窗口-->
   <!--  <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)"
                        onclick="closeLogin()">取消</a>
            </div>
        </div>
    </div> -->

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>


</body>
</html>
