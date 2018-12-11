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
    <title>待审核</title>
 	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/login.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/icon.css" />
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jQuery.easyui.js"></script>
  </head>
  <script type="text/javascript">
  	$(function(){
  		/* $("#change").click(function(){
			$("#checkCodeImg").attr("src","jsp/rand.jsp?dt="+new Date().getTime());
			return false;
		}); */
  	})
	
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
 <body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
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
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
        	<span>状态：完善信息</span>
        	用户名：xxx
        	密   码：*******
        	企业信息
        	<div style="padding:10px 60px 20px 60px">
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>Name:</td>
	    			<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Email:</td>
	    			<td><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Subject:</td>
	    			<td><input class="easyui-textbox" type="text" name="subject" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Message:</td>
	    			<td><input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"></input></td>
	    		</tr>
	    		<tr>
	    			<td>Language:</td>
	    			<td>
	    				<select class="easyui-combobox" name="language">
	    				<option value="ar">Arabic</option>
	    				<option value="bg">Bulgarian</option>
	    				<option value="ca">Catalan</option>
	    				<option value="zh-cht">Chinese Traditional</option>
	    				<option value="cs">Czech</option>
	    				<option value="da">Danish</option>
	    				<option value="nl">Dutch</option>
	    				<option value="en" selected="selected">English</option>
	    				<option value="et">Estonian</option>
	    				<option value="fi">Finnish</option>
	    				<option value="fr">French</option>
	    				<option value="de">German</option>
	    				<option value="el">Greek</option>
	    				<option value="ht">Haitian Creole</option>
	    				<option value="he">Hebrew</option>
	    				<option value="hi">Hindi</option>
	    				<option value="mww">Hmong Daw</option>
	    				<option value="hu">Hungarian</option>
	    				<option value="id">Indonesian</option>
	    				<option value="it">Italian</option>
	    				<option value="ja">Japanese</option>
	    				<option value="ko">Korean</option>
	    				<option value="lv">Latvian</option>
	    				<option value="lt">Lithuanian</option>
	    				<option value="no">Norwegian</option>
	    				<option value="fa">Persian</option>
	    				<option value="pl">Polish</option>
	    				<option value="pt">Portuguese</option>
	    				<option value="ro">Romanian</option>
	    				<option value="ru">Russian</option><option value="sk">Slovak</option><option value="sl">Slovenian</option><option value="es">Spanish</option><option value="sv">Swedish</option><option value="th">Thai</option><option value="tr">Turkish</option><option value="uk">Ukrainian</option><option value="vi">Vietnamese</option></select>
	    			</td>
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
