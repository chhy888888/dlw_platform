<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; UTF-8">
  
    <base href="<%=basePath%>">
    <title>登陆</title>
 	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/login.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/icon.css" />
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jQuery.easyui.js"></script>
  </head>
  <script type="text/javascript">
  	$(function(){
  		$("#change").click(function(){
			$("#checkCodeImg").attr("src","jsp/rand.jsp?dt="+new Date().getTime());
			return false;
		});
  	})
	
	// 回车登陆 
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
	}
  </script>
 <body>
 <form id = "fromadd">
 </form>
	<div class="login">
	    <div class="login_title">
	    </div>
	    <div class="login_main">
	        <div class="main_left_11"></div>
	        <div class="main_right">
	            <div class="right_title">
	             <img src="<%=basePath %>img/tit.png" />
	            </div>
	            <form id = "form" action = "<%=basePath %>exportfactoring/loging" method="post">
	                <div class="username">
	                    <img src="<%=basePath %>img/username.png"  />
	                    <input type="text" id = "username" name="username" placeholder="请输入用户名">
	                </div>
	                <div class="password">
	                      <img src="<%=basePath %>img/password.png" alt="">
	                    <input type="password" id = "password" name="password" placeholder="请输入密码">
	                </div>
	              <div class="yes_login">
	              <a href="javascript:;" onclick="getqweqwe()">登录</a><br/>
	              <a href="javascript:;" onclick="getuserjr()">注册</a><br/>
	              </div>
	            </form>
	        </div>
	    </div>
	    <textarea rows="" cols=""></textarea>
	    <div class="login_footer">
	 
	        <p>建议浏览器：IE浏览器，分辨率在1600*900以上  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术支持电话：18618239440 </p>
	        <p><a href="http://www.miitbeian.gov.cn/" style="color:#ffffff">豫ICP备12026292号-5</a></p>
	        <!-- <p><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=41019702002167"><img src="http://image.zzqifan.cn/templets/images/gn.png">豫公网安备 41019702002167号</a>
			</p> -->
	    </div>
	</div>
 </body>
</html>
