<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html>
  <head>
    <title>注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="<%=basePath%>css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/styles.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jQuery.easyui.js"></script>
    <script type="text/javascript">
     /*  $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; }; */
    </script>
  </head>
  <body>
  <script type="text/javascript">
  	$(function(){
  		getDictionariesOne('area');
  		//$(".u26").hide();暂时
  	})
  	//验证
  	function getinfonull1(data){
		if(data == null){
			data = "";
		}else if(data == ''){
			data = "";
		}else if(data == 'null'){
			data = "";
		}else if(data == 'undefined'){
			data = "";
		}
		return data;
	}
  	//查询一级词典
  	 function getDictionariesOne(str){
		$.ajax({
	        url: "<%=basePath %>system/getSystemDictionaries",
	        data:{ sd_flag:str },
	        type : "post",
	        dataType: "text",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        success: function (dataInfo) {
	        	var strHtml = "<option value = '0'>请选择</option>";
	        	var data = $.parseJSON(dataInfo);
	        	if(data.message){
	        		for(var i = 0 ; i < data.data.length ; i++ ){
	        			strHtml += "<option value = '"+data.data[i].sd_id+"'>"+data.data[i].sd_item+"</option>";
	        		}
	        		$("#areainfo").empty().append(strHtml);
	        	}else{
	        		alert(data.data);
	        	}
	        }
	    });
	}
  	//查询二级列表
  	function getDictionariesTwo(){
		var str = $("#areainfo").val(); 
		$.ajax({
	        url: "<%=basePath %>system/getSystemDictionariesSubnode",
	        data:{ sd_parentid:str },
	        type : "post",
	        dataType: "text",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        success: function (dataInfo) {
	        	var strHtml = "<option value = '0'>请选择</option>";
	        	var data = $.parseJSON(dataInfo);
	        	if(data.message){
	        		for(var i = 0 ; i < data.data.length ; i++ ){
	        			strHtml += "<option value = '"+data.data[i].sd_id+"'>"+data.data[i].sd_item+"</option>";
	        		}
	        		$("#Countryinfo").empty().append(strHtml);
	        	}else{
	        		alert(data.data);
	        	}
	        }
	    });
	}
  	//用户名查重
  	function getUserNameRepeat(){
  		var flag = true;
  		var username = $("#cul_account").val();
  		$.ajax({
	        url: "<%=basePath %>system/getUserNameRepeat",
	        data:{ username:username },
	        type : "post",
	        dataType: "text",
	        async:false,
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        success: function (dataInfo) {
	        	dataInfo=$.parseJSON(dataInfo);
	        	if(dataInfo.data == "no"){
	        		alert("登陆账号已经被注册！");
	        		flag = false;
	        	}
	        }
	    });
  		return flag;
  	}
  	//发送邮件
  	function gettoEmil(){
  		//var emil = $("#cul_email").val();
  		var username = $("#cul_account").val();
  		if(getinfonull1(username) == ''){
  			alert("用户名不能为空！");
  			return ;
  		}
  		/* if(getinfonull1(emil) == ''){
  			alert("邮箱不能为空！");
  			return ;
  		} */
  		$.ajax({
	        url: "<%=basePath %>system/gettoEmilYzm",
	        data:{ username:username,emil:emil },
	        type : "post",
	        dataType: "text",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        success: function (dataInfo) {
	        	//yzm
	        	var data = $.parseJSON(dataInfo);
	        	$("#yzm").val(data.data);
	        }
	    });
  	}
  	//验证码对比
  	function getyzmRepeat(){
  		var cul_code = $("#cul_code").val();
  		var yzm = $("#yzm").val();
  		if(cul_code == yzm){
  			$(".u26").show();
  		}
  	}
  	//添加用户表
  	function getadduserInfo(){
  		var cul_name_cn = $("input[name='cul_name_cn']").val();
  		var cul_name_en = $("input[name='cul_name_en']").val();
  		//var cul_email = $("input[name='cul_email']").val();
  		var cul_code = "0";
  		var cul_password = $("input[name='cul_password']").val();
  		var cul_account = $("input[name='cul_account']").val();//账号
  		var cul_phone1 = $("input[name='cul_phone1']").val();
  		var cul_phone2 = $("input[name='cul_phone2']").val();
  		var cul_phone3 = $("input[name='cul_phone3']").val();
  		var cul_phone = cul_phone1 +"-"+ cul_phone2 +"-"+ cul_phone3;
  		var cul_continent = $("#areainfo").val();
  		var cul_country = $("#Countryinfo").val();
  		var cul_type = '1';
  		var cul_status = '0';//var cul_status = '0';暂时
  		var flag = getUserNameRepeat();
  		if(flag){
	  		$.ajax({
		        url: "<%=basePath %>system/getaddUserInfo",
		        data:{ cul_name_cn:cul_name_cn,cul_name_en:cul_name_en,cul_password:cul_password,cul_account:cul_account,cul_phone:cul_phone,cul_continent:cul_continent,cul_country:cul_country,cul_type:cul_type,cul_status:cul_status },
		        type : "post",
		        dataType: "text",
		        contentType: "application/x-www-form-urlencoded; charset=utf-8",
		        success: function (dataInfo) {
		        	dataInfo = $.parseJSON(dataInfo);
		        	if(dataInfo.data =='1'){
			        	alert("注册成功！");
			        	window.location.href="<%=basePath %>exportfactoring/login";
		        	}
		        }
		    });
  		}else{
  			alert("登陆账号已经被注册！");
  		}
  	}
  </script>
  <input type="hidden" id = "yzm"/>
    <div class="base" class="">
      <!-- Unnamed (Rectangle) -->
      <div class="u19">
        <div class="u19_text">
          <p><span style="color:#FF0000;">*</span><span style="color:#000000;"> 
          	公司名称</span></p><p><span style="color:#000000;">&nbsp;&nbsp; </span><span>User Name：</span></p>
        </div>
      </div>
      <div class="u20">
        <input class = "u20_input" type="text" value="" name = "cul_name_cn"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u21" class="ax_default label">
        <div class="u21_div" class=""></div>
        <div class="u21_text" class="text ">
          <p><span style="color:#FF0000;">* </span><span>密码：</span></p><p><span>&nbsp;&nbsp; Password</span></p>
        </div>
      </div>
      <div class="u22" class="ax_default text_field">
        <input class="u22_input" type="password" value="" name = "cul_password"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u23" class="ax_default label">
        <div class="u23_div" class=""></div>
        <div class="u23_text" class="text ">
          <p><span style="color:#FF0000;">* </span><span>确认密码：</span></p><p><span>&nbsp;&nbsp; Confirm password</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div class="u24" class="ax_default text_field">
        <input class="u24_input" type="password" value=""/>
      </div>

      <!-- Unnamed (Text Field) -->
      <!-- <div class="u25" class="ax_default text_field">
        <input class="u25_input" type="text" value="cul_email" id = "cul_email" name = "cul_email"/>
      </div>
 -->
      <!-- Unnamed (Rectangle) -->
      <div class="u26">
        <img class="u26_img" class="img " src="<%=basePath%>images/u26.png"/>
        <div class="u26_text" class="text "  onclick="getadduserInfo()">
          <p style="text-align: center;cursor:pointer;"><span>注册</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u27" class="ax_default label">
        <div class="u27_div" class=""></div>
        <div class="u27_text" class="text ">
          <p><span style="color:#FF0000;">* </span><span>联系电话：</span></p><p><span>&nbsp;&nbsp; Contact number</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div class="u28" class="ax_default text_field">
        <input class="u28_input" type="text" value="" name = "cul_phone1"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <!-- <div class="u29" class="ax_default label">
        <div class="u29_div" class=""></div>
        <div class="u29_text" class="text ">
          <p><span style="color:#FF0000;">* </span><span>邮箱验证码：</span></p><p><span>&nbsp;&nbsp; Mailbox verification code</span></p>
        </div>
      </div>

      Unnamed (Text Field)
      <div class="u30" class="ax_default text_field">
        <input class="u30_input" type="text" value="cul_code" id = "cul_code" name = "cul_code" onchange="getyzmRepeat()"/>
      </div>
 -->
      <!-- Unnamed (Rectangle) -->
     <!--  <div class="u34" class="ax_default label">
        <div class="u34_div" class=""></div>
        <div class="u34_text" class="text ">
          <p><span style="color:#FF0000;">*</span><span> 公司邮箱</span></p><p><span>&nbsp;&nbsp; E-mail：</span></p>
        </div>
      </div> -->

      <!-- Unnamed (Rectangle) -->
      <div class="u36" class="ax_default label">
        <div class="u36_div" class=""></div>
        <div class="u36_text" class="text ">
          <p><span>注册&nbsp; Registration</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u37" class="ax_default box_2">
        <div class="u37_div" class=""></div>
        <div class="u37_text" class="text ">
          <p><span>©2018 京ICP备18013159号 大路网</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div class="u41" class="ax_default text_field">
        <input class="u41_input" type="text" value="" name = "cul_phone2"/>
      </div>

      <!-- Unnamed (Text Field) -->
      <div class="u42" class="ax_default text_field">
        <input class="u42_input" type="text" value="" name = "cul_phone3"/>
      </div>

      <!-- Unnamed (HTML Button) -->
      <!-- <div class="u43" class="ax_default html_button">
        <input class="u43_input" type="button" value="发送邮件" onclick="gettoEmil()"/>
      </div> -->

      <!-- Unnamed (Rectangle) -->
      <div class="u44" class="ax_default label">
        <div class="u44_div" class=""></div>
        <div class="u44_text" class="text ">
          <p><span style="color:#FF0000;">*</span><span style="color:#000000;"> 所在国家</span></p><p><span style="color:#000000;">&nbsp;&nbsp; C</span><span>ountry：</span></p>
        </div>
      </div>

      <!-- Unnamed (Droplist) -->
      <div class="u45" class="ax_default droplist">
        <select class="u45_input" id = "Countryinfo" name = "cul_country">
        </select>
      </div>

      <!-- Unnamed (Text Field) -->
      <div class="u47" class="ax_default text_field">
        <input class="u47_input" type="text" value="" name= "cul_name_en"/>
      </div>

      <!-- Unnamed (Droplist) -->
      <div class="u49" class="ax_default droplist">
        <select class="u49_input"  id = "areainfo" name = "cul_continent" onchange="getDictionariesTwo()">
        </select>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u50" class="ax_default label">
        <div class="u50_div" class=""></div>
        <div class="u50_text" class="text ">
          <p><span style="color:#FF0000;">* </span><span>登陆账号：</span></p><p><span>&nbsp;&nbsp; Contactor&nbsp; Weixin code</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div class="u51" class="ax_default text_field">
        <input class="u51_input" type="text" value="" id = "cul_account" name = "cul_account" onchange="getUserNameRepeat()"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div class="u52" class="ax_default box_2">
        <div class="u52_div" class=""></div>
      </div>

      <!-- Unnamed (Image) -->
      <div class="u54" class="ax_default image">
        <img class="u54_img" class="img " src="<%=basePath%>images/u18.jpg"/>
      </div>
    </div>
  </body>
  <style>
  	body {
  margin:0px;
  background-image:none;
  position:static;
  left:auto;
  width:2070px;
  margin-left:0;
  margin-right:0;
  text-align:left;
}
.base {
  position:absolute;
  z-index:0;
}
.u19_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:178px;
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
.u19 {
  border-width:0px;
  position:absolute;
  left:283px;
  top:462px;
  width:178px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u19_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:178px;
  word-wrap:break-word;
}
.u20 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:463px;
  width:378px;
  height:35px;
}
.u20_input {
  position:absolute;
  left:0px;
  top:0px;
  width:378px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#949494;
  text-align:left;
}
.u21_div {
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
.u21 {
  border-width:0px;
  position:absolute;
  left:283px;
  top:738px;
  width:79px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u21_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:79px;
  white-space:nowrap;
}
.u22 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:741px;
  width:378px;
  height:35px;
}
.u22_input {
  position:absolute;
  left:0px;
  top:0px;
  width:378px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u23_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:158px;
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
.u23 {
  border-width:0px;
  position:absolute;
  left:283px;
  top:793px;
  width:158px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u23_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:158px;
  word-wrap:break-word;
}
.u24 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:797px;
  width:378px;
  height:35px;
}
.u24_input {
  position:absolute;
  left:0px;
  top:0px;
  width:378px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u25 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:629px;
  width:295px;
  height:35px;
}
.u25_input {
  position:absolute;
  left:0px;
  top:0px;
  width:295px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u26_img {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:300px;
  height:44px;
}
.u26 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:1011px;
  width:300px;
  height:44px;
  font-family:'Arial Negreta', 'Arial Normal', 'Arial';
  font-weight:700;
  font-style:normal;
  font-size:20px;
  color:#FFFFFF;
}
.u26_text {
  border-width:0px;
  position:absolute;
  left:2px;
  top:10px;
  width:296px;
  word-wrap:break-word;
}
.u27_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:178px;
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
.u27 {
  border-width:0px;
  position:absolute;
  left:283px;
  top:855px;
  width:178px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u27_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:178px;
  word-wrap:break-word;
}
.u28 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:855px;
  width:91px;
  height:35px;
}
.u28_input {
  position:absolute;
  left:0px;
  top:0px;
  width:91px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u29_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:285px;
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
.u29 {
  border-width:0px;
  position:absolute;
  left:283px;
  top:684px;
  width:285px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u29_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:285px;
  word-wrap:break-word;
}
.u30 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:685px;
  width:378px;
  height:35px;
}
.u30_input {
  position:absolute;
  left:0px;
  top:0px;
  width:378px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u31_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:119px;
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
.u31 {
  border-width:0px;
  position:absolute;
  left:283px;
  top:250px;
  width:119px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u31_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:119px;
  white-space:nowrap;
}
.u32 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:383px;
  width:200px;
  height:16px;
}
.u32_text {
  border-width:0px;
  position:absolute;
  left:16px;
  top:0px;
  width:182px;
  word-wrap:break-word;
}
.u32_input {
  border-width:0px;
  position:absolute;
  left:-3px;
  top:-2px;
}
.u33 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:250px;
  width:206px;
  height:16px;
}
.u33_text {
  border-width:0px;
  position:absolute;
  left:16px;
  top:0px;
  width:188px;
  word-wrap:break-word;
}
.u33_input {
  border-width:0px;
  position:absolute;
  left:-3px;
  top:-2px;
}
.u34_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:76px;
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
.u34 {
  border-width:0px;
  position:absolute;
  left:283px;
  top:626px;
  width:76px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u34_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:76px;
  white-space:nowrap;
}
.u35 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:289px;
  width:100px;
  height:16px;
}
.u35_text {
  border-width:0px;
  position:absolute;
  left:16px;
  top:0px;
  width:82px;
  word-wrap:break-word;
}
.u35_input {
  border-width:0px;
  position:absolute;
  left:-3px;
  top:-2px;
}
.u36_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:267px;
  height:33px;
  background:inherit;
  background-color:rgba(255, 255, 255, 0);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
  font-size:28px;
  color:#1E1E1E;
}
.u36 {
  border-width:0px;
  position:absolute;
  left:495px;
  top:136px;
  width:267px;
  height:33px;
  font-size:28px;
  color:#1E1E1E;
}
.u36_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:267px;
  word-wrap:break-word;
}
.u37_div {
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
.u37 {
  border-width:0px;
  position:absolute;
  left:0px;
  top:1113px;
  width:1352px;
  height:38px;
  color:#FFFFFF;
}
.u37_text {
  border-width:0px;
  position:absolute;
  left:2px;
  top:11px;
  width:1348px;
  word-wrap:break-word;
}
.u38_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:677px;
  height:472px;
  background:inherit;
  background-color:rgba(255, 255, 255, 1);
  box-sizing:border-box;
  border-width:1px;
  border-style:solid;
  border-color:rgba(188, 188, 188, 1);
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
  color:#AEAEAE;
}
.u38 {
  border-width:0px;
  position:absolute;
  left:1393px;
  top:151px;
  width:677px;
  height:472px;
  color:#AEAEAE;
}
.u38_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
.u39_div {
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
.u39 {
  border-width:0px;
  position:absolute;
  left:1575px;
  top:174px;
  width:57px;
  height:16px;
}
.u39_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:57px;
  white-space:nowrap;
}
.u40 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:334px;
  width:267px;
  height:16px;
}
.u40_text {
  border-width:0px;
  position:absolute;
  left:16px;
  top:0px;
  width:249px;
  word-wrap:break-word;
}
.u40_input {
  border-width:0px;
  position:absolute;
  left:-3px;
  top:-2px;
}
.u41 {
  border-width:0px;
  position:absolute;
  left:607px;
  top:855px;
  width:91px;
  height:35px;
}
.u41_input {
  position:absolute;
  left:0px;
  top:0px;
  width:91px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u42 {
  border-width:0px;
  position:absolute;
  left:711px;
  top:855px;
  width:168px;
  height:35px;
}
.u42_input {
  position:absolute;
  left:0px;
  top:0px;
  width:168px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u43 {
  border-width:0px;
  position:absolute;
  left:796px;
  top:629px;
  width:83px;
  height:35px;
}
.u43_input {
  position:absolute;
  left:0px;
  top:0px;
  width:83px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#333333;
  text-align:center;
}
.u44_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:178px;
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
.u44 {
  border-width:0px;
  position:absolute;
  left:283px;
  top:571px;
  width:178px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u44_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:178px;
  word-wrap:break-word;
}
.u45 {
  border-width:0px;
  position:absolute;
  left:670px;
  top:571px;
  width:209px;
  height:35px;
}
.u45_input {
  position:absolute;
  left:0px;
  top:0px;
  width:209px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
}
.u45_input:disabled {
  color:grayText;
}
.u46_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:667px;
  height:64px;
  background:inherit;
  background-color:rgba(255, 255, 255, 0);
  border:none;
  border-radius:0px;
  -moz-box-shadow:none;
  -webkit-box-shadow:none;
  box-shadow:none;
}
.u46 {
  border-width:0px;
  position:absolute;
  left:1397px;
  top:207px;
  width:667px;
  height:64px;
}
.u46_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:667px;
  word-wrap:break-word;
}
.u47 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:508px;
  width:378px;
  height:35px;
}
.u47_input {
  position:absolute;
  left:0px;
  top:0px;
  width:378px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#949494;
  text-align:left;
}
.u48_img {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:613px;
  height:94px;
}
.u48 {
  border-width:0px;
  position:absolute;
  left:1397px;
  top:295px;
  width:613px;
  height:94px;
}
.u48_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
.u49 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:571px;
  width:169px;
  height:35px;
}
.u49_input {
  position:absolute;
  left:0px;
  top:0px;
  width:169px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
}
.u49_input:disabled {
  color:grayText;
}
.u50_div {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:208px;
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
.u50 {
  border-width:0px;
  position:absolute;
  left:283px;
  top:921px;
  width:208px;
  height:38px;
  font-family:'PingFang SC Regular', 'PingFang SC';
  font-weight:400;
  font-style:normal;
  font-size:16px;
}
.u50_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:208px;
  word-wrap:break-word;
}
.u51 {
  border-width:0px;
  position:absolute;
  left:501px;
  top:924px;
  width:378px;
  height:35px;
}
.u51_input {
  position:absolute;
  left:0px;
  top:0px;
  width:378px;
  height:35px;
  font-family:'Arial Normal', 'Arial';
  font-weight:400;
  font-style:normal;
  font-size:13px;
  text-decoration:none;
  color:#000000;
  text-align:left;
}
.u52_div {
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
.u52 {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:1360px;
  height:98px;
}
.u52_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
.u53_div {
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
.u53 {
  border-width:0px;
  position:absolute;
  left:1127px;
  top:37px;
  width:123px;
  height:24px;
  font-size:20px;
  color:#FFFFFF;
}
.u53_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:123px;
  white-space:nowrap;
}
.u54_img {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:220px;
  height:41px;
}
.u54 {
  border-width:0px;
  position:absolute;
  left:95px;
  top:29px;
  width:220px;
  height:41px;
}
.u54_text {
  border-width:0px;
  position:absolute;
  left:0px;
  top:0px;
  width:0px;
  visibility:hidden;
  word-wrap:break-word;
}
  	
  </style>
</html>
