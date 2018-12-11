<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="<%=basePath%>css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/styles.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jQuery.easyui.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
  
  <script type="text/javascript">
  	$(function(){
  		// 回车登陆 
  		$(document).keyup(function(event){
  	          if(event.keyCode ==13){  
  	        	getQueryByUserId();  
  	         }  
  	     });  
  	})
  	//注册
	function getuserjr(){
		var uls = "<%=basePath %>exportfactoring/getuserjr";
		$("#fromadd").attr("action",uls);
		$("#fromadd").submit();
	}
  	//页面跳转
  	function getindex(){
  		var uls = "<%=basePath %>exportfactoring/loging";
		$("#fromadd").attr("action",uls);
		$("#fromadd").submit();
  	}
  	//验证用户名密码
  	function getQueryByUserId(){
  		var cul_account = $("#cul_account").val();
  		var cul_password = $("#cul_password").val();
  		if(cul_account == null || "" == cul_account){
  			alert("请输入账号！");
  			return;
  		}
  		if(cul_password == null || "" == cul_password){
  			alert("请输入密码！");
  			return;
  		}
  		$.ajax({
	        url: "<%=basePath %>exportfactoring/getQueryByUserInfo",
	        data:{ cul_account:cul_account,cul_password:cul_password },
	        type : "post",
	        dataType: "text",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        success: function (dataInfo) {
	        	var data = $.parseJSON(dataInfo);
	        	if(data.data.cul_status == '0'){
	        		window.location.href="<%=basePath %>exportfactoring/toDsh";
	        	}else if(null == data.data || "" == data.data){
	        		alert("用户名或密码错误！");
	        		return;
	        	}else{
	        		getindex();
	        	}
	        }
	    });
  	}
  </script>
   <form id = "fromadd"></form>
  
    <div class="base" >

      <!-- Unnamed (Rectangle) -->
      <div class="u0" class="ax_default box_2">
        <div class="u0_div" ></div>
      </div>

      <!-- Unnamed (Image) -->
      <div class="u1" class="ax_default image">
        <img class="u1_img" class="img " src="<%=basePath%>images/u1.png"/>
      </div>

      <!-- Unnamed (Image) -->
      <div class="u2" class="ax_default image">
        <img class="u2_img" class="img " src="<%=basePath%>images/u2.jpg"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u3" class="ax_default box_2">
        <div class="u3_div" ></div>
        <div class="u3_text" class="text ">
          <p><span>©2018 京ICP备18013159号 大路网</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u4" class="ax_default label">
        <div class="u4_div" ></div>
        <div class="u4_text" class="text ">
          <p><span>注册&nbsp;&nbsp; |&nbsp;&nbsp; 登录</span></p>
        </div>
      </div>



      <!-- Unnamed (Rectangle) -->
      <div class="u8" class="ax_default box_1">
        <div class="u8_div" ></div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u9" class="ax_default box_1">
        <div class="u9_div" ></div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u10" class="ax_default label">
        <div class="u10_div" ></div>
        <div class="u10_text" class="text ">
          <p><span>账户登录</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u11" class="ax_default label">
        <div class="u11_div" ></div>
        <div class="u11_text" class="text ">
          <p><span>用户名</span></p><p><span>User Name </span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div class="u12" class="ax_default text_field">
        <input class="u12_input" type="text" value="" id = "cul_account"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u13" class="ax_default label">
        <div class="u13_div" ></div>
        <div class="u13_text" class="text ">
          <p><span>密&nbsp;&nbsp; 码</span></p><p><span>Password</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div class="u14" class="ax_default text_field">
        <input class="u14_input" type="password" value="" id = "cul_password"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u15" class="ax_default box_1">
        <img class="u15_img" class="img " src="<%=basePath%>images/u15.png"/>
        <div class="u15_text">
          <p onclick="getQueryByUserId()"><span style="cursor:pointer;">登录</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u16" class="ax_default label">
        <div class="u16_div" ></div>
        <div class="u16_text" class="text ">
          <p><span style="cursor:pointer;">忘记密码 Forget Password？</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u17" class="ax_default label">
        <div class="u17_div" ></div>
        <div class="u17_text" class="text ">
          <p><span style="color:#6B6B6B;">还没有账号？请先</span><span style="color:#FF9900;cursor:pointer; " onclick="getuserjr()">注册</span></p>
          <p><span style="color:#6B6B6B;">No account,please</span><span style="color:#FF9900;cursor:pointer;" onclick="getuserjr()"> register </span><span style="color:#6B6B6B;">first</span></p>
        </div>
      </div>

      <!-- Unnamed (Image) -->
      <div class="u18" class="ax_default image">
        <img class="u18_img" class="img " src="<%=basePath%>images/u18.jpg"/>
      </div>
    </div>
    <style>
    body {
  margin:0px;
  background-image:none;
  position:static;
  left:auto;
  width:1915px;
  margin-left:0;
  margin-right:0;
  text-align:left;
}
.base {
  position:absolute;
  z-index:0;
}
.u0_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:1360px;
  height:98px;
  background:inherit;
  background-color:rgba(35, 31, 32, 1);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
}
.u0 {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:1360px;
  height:98px;
}
.u0_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
.u1_img {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:203px;
  height:55px;
}
.u1 {
  border-width:0px;
  position:absolute;
  left:23px;
  top:174px;
  width:203px;
  height:55px;
}
.u1_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
.u2_img {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:1155px;
  height:668px;
}
.u2 {
  border-width:0px;
  position:absolute;
  left:95px;
  top:127px;
  width:1155px;
  height:668px;
}
.u2_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
.u3_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:1352px;
  height:38px;
  background:inherit;
  background-color:rgba(35, 31, 32, 1);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
  color:#FFFFFF;
}
.u3 {
  border-width:0px;
  position:absolute;
  left:0px;
  top:865px;
  width:1352px;
  height:38px;
  color:#FFFFFF;
}
.u3_text {
  border-width:0px;
  position:absolute;
  left:2px;
  top:11px;
  width:1348px;
  word-wrap:break-word;
}
.u4_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:123px;
  height:24px;
  background:inherit;
  background-color:rgba(255, 255, 255, 0);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
  font-size:20px;
  color:#FFFFFF;
}
.u4 {
  border-width:0px;
  position:absolute;
  left:1127px;
  top:37px;
  width:123px;
  height:24px;
  font-size:20px;
  color:#FFFFFF;
}
.u4_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:123px;
  white-space:nowrap;
}
.u5 {
  border-width:0px;
  position:absolute;
  left:1488px;
  top:127px;
  width:427px;
  height:514px;
}
.u5_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
.u7_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:57px;
  height:16px;
  background:inherit;
  background-color:rgba(255, 255, 255, 0);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
}
.u7 {
  border-width:0px;
  position:absolute;
  left:1661px;
  top:151px;
  width:57px;
  height:16px;
}
.u7_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:57px;
  white-space:nowrap;
}
.u8_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:1155px;
  height:668px;
  background:inherit;
  background-color:rgba(149, 89, 29, 1);
  box-sizing:border-box;
  border-width:1px;
  border-style:solid;
  border-color:rgba(121, 121, 121, 1);
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
}
.u8 {
  border-width:0px;
  position:absolute;
  left:95px;
  top:127px;
  width:1155px;
  height:668px;
}
.u8_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
.u9_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:740px;
  height:461px;
  background:inherit;
  background-color:rgba(255, 255, 255, 1);
  box-sizing:border-box;
  border-width:1px;
  border-style:solid;
  border-color:rgba(121, 121, 121, 1);
  border-radius:12px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
}
.u9 {
  border-width:0px;
  position:absolute;
  left:303px;
  top:210px;
  width:740px;
  height:461px;
}
.u9_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
.u10_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:81px;
  height:24px;
  background:inherit;
  background-color:rgba(255, 255, 255, 0);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:20px;
}
.u10 {
  border-width:0px;
  position:absolute;
  left:684px;
  top:264px;
  width:81px;
  height:24px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:20px;
}
.u10_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:81px;
  white-space:nowrap;
}
.u11_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:79px;
  height:38px;
  background:inherit;
  background-color:rgba(255, 255, 255, 0);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u11 {
  border-width:0px;
  position:absolute;
  left:458px;
  top:324px;
  width:79px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u11_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:79px;
  white-space:nowrap;
}
.u12 {
  border-width:0px;
  position:absolute;
  left:618px;
  top:325px;
  width:257px;
  height:35px;
}
.u12_input {
  position:absolute;
  left:0px;
  top:0px;
  width:257px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u13_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:67px;
  height:38px;
  background:inherit;
  background-color:rgba(255, 255, 255, 0);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u13 {
  border-width:0px;
  position:absolute;
  left:458px;
  top:375px;
  width:67px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u13_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:67px;
  white-space:nowrap;
}
.u14 {
  border-width:0px;
  position:absolute;
  left:618px;
  top:375px;
  width:257px;
  height:35px;
}
.u14_input {
  position:absolute;
  left:0px;
  top:0px;
  width:257px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u15_img {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:417px;
  height:44px;
}
.u15 {
  border-width:0px;
  position:absolute;
  left:458px;
  top:463px;
  width:417px;
  height:44px;
  font-family:'Arial Negreta', 'Arial Normal', 'Arial';
  font-weight:700;
  font-style:normal;
  font-size:18px;
  color:#FFFFFF;
}
.u15_text {
  border-width:0px;
  position:absolute;
  text-align: center;
  left:2px;
  top:11px;
  width:413px;
  word-wrap:break-word;
}
.u16_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:177px;
  height:17px;
  background:inherit;
  background-color:rgba(255, 255, 255, 0);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  color:#FF9900;
}
.u16 {
  border-width:0px;
  position:absolute;
  left:698px;
  top:420px;
  width:177px;
  height:17px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  color:#FF9900;
}
.u16_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:177px;
  white-space:nowrap;
}
.u17_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:189px;
  height:48px;
  background:inherit;
  background-color:rgba(255, 255, 255, 0);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
}
.u17 {
  border-width:0px;
  position:absolute;
  left:732px;
  top:536px;
  width:189px;
  height:48px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
}
.u17_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:189px;
  white-space:nowrap;
}
.u18_img {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:220px;
  height:41px;
}
.u18 {
  border-width:0px;
  position:absolute;
  left:95px;
  top:29px;
  width:220px;
  height:41px;
}
.u18_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
    </style>
  </body>
</html>
