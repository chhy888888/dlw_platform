<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html>
  <head>
    <title>注册（注册时，需要填写的信息待确定？？？）</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    
    <link href="<%=basePath%>css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/styles.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/reg/styles.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jQuery.easyui.js"></script>
    
   <!--  
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/注册（注册时，需要填写的信息待确定？？？）/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/axure/axQuery.js"></script>
    <script src="resources/scripts/axure/globals.js"></script>
    <script src="resources/scripts/axutils.js"></script>
    <script src="resources/scripts/axure/annotation.js"></script>
    <script src="resources/scripts/axure/axQuery.std.js"></script>
    <script src="resources/scripts/axure/doc.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/messagecenter.js"></script>
    <script src="resources/scripts/axure/events.js"></script>
    <script src="resources/scripts/axure/recording.js"></script>
    <script src="resources/scripts/axure/action.js"></script>
    <script src="resources/scripts/axure/expr.js"></script>
    <script src="resources/scripts/axure/geometry.js"></script>
    <script src="resources/scripts/axure/flyout.js"></script>
    <script src="resources/scripts/axure/ie.js"></script>
    <script src="resources/scripts/axure/model.js"></script>
    <script src="resources/scripts/axure/repeater.js"></script>
    <script src="resources/scripts/axure/sto.js"></script>
    <script src="resources/scripts/axure/utils.temp.js"></script>
    <script src="resources/scripts/axure/variables.js"></script>
    <script src="resources/scripts/axure/drag.js"></script>
    <script src="resources/scripts/axure/move.js"></script>
    <script src="resources/scripts/axure/visibility.js"></script>
    <script src="resources/scripts/axure/style.js"></script>
    <script src="resources/scripts/axure/adaptive.js"></script>
    <script src="resources/scripts/axure/tree.js"></script>
    <script src="resources/scripts/axure/init.temp.js"></script>
    <script src="files/注册（注册时，需要填写的信息待确定？？？）/data.js"></script>
    <script src="resources/scripts/axure/legacy.js"></script>
    <script src="resources/scripts/axure/viewer.js"></script>
    <script src="resources/scripts/axure/math.js"></script> -->
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
  	function getEnIn(){
  		var qytype = $('input[name="qytype"]:checked').val();
  		if(qytype == 1){
  			$("#u2043").show();
  		}else{
  			$("#u2043").hide();
  		}
  	}
  	
  	//添加用户表
  	function getadduserInfo(){
  		var cul_name_cn = $("input[name='cul_name_cn']").val();
  		var qytype = $('input[name="qytype"]:checked').val();
  		if(qytype == null || "" == qytype){
  			alert("请选择注册企业类型！");
	  		return;
  		}
  		if(cul_name_cn == null || "" == cul_name_cn){
				alert("请填写公司名称！");
		  		return;
		}
  		var cul_name_en = $("input[name='cul_name_en']").val();
  		if(qytype == 1){
  			if(cul_name_en == null || "" == cul_name_en){
  				alert("请填写英文名称！");
  		  		return;
  			}
  		}
  		//var cul_email = $("input[name='cul_email']").val();
  		//var cul_code = "0";
  		var cul_phone1 = $("input[name='cul_phone1']").val();
  		var cul_phone2 = $("input[name='cul_phone2']").val();
  		var cul_phone3 = $("input[name='cul_phone3']").val();
  		var cul_phone = cul_phone1 +"-"+ cul_phone2 +"-"+ cul_phone3;
  		var cul_continent = $("#areainfo").val();
  		if(cul_continent == null || "" == cul_continent || "0"==cul_continent){
			alert("请选择洲！");
	  		return;
		}
  		var cul_country = $("#Countryinfo").val();
  		if(cul_country == null || "" == cul_country  || "0"==cul_country){
			alert("请选择国家！");
	  		return;
		}
  		var cul_password = $("input[name='cul_password']").val();
  		var repass = $("input[name='repass']").val();
  		if(cul_password == null || "" == cul_password){
  			alert("请填写密码！");
		  		return;
  		}
  		if(repass == null || "" == repass){
  			alert("请填写确认密码！");
		  		return;
  		}
  		if(cul_password != repass){
  			alert("两次密码不一致！");
	  		return;
  		}
  		if(cul_phone1 == null || "" == cul_phone1 || cul_phone2 == null || "" == cul_phone2 || cul_phone3 == null || "" == cul_phone3){
  			alert("请正确填写电话！");
	  		return;
  		}
  		var cul_account = $("input[name='cul_account']").val();//账号
  		if(cul_account == null || "" == cul_account){
  			alert("请填写账号！");
		  		return;
  		}
  		var cul_type =qytype;
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
  </head>
  <body>
    <div id="base" class="">

      <!-- Unnamed (Rectangle) -->
      <div id="u1993" class="ax_default label">
        <div id="u1993_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1994" class="text">
          <p><span style="color:#FF0000;">*</span><span style="color:#000000;"> 公司名称</span></p><p><span style="color:#000000;">&nbsp;&nbsp; </span><span>User Name：</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div id="u1995" class="ax_default text_field">
        <input id="u1995_input" name="cul_name_cn" type="text" value=""/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u1996" class="ax_default label">
        <div id="u1996_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u1997" class="text">
          <p><span style="color:#FF0000;">* </span><span>密码：</span></p><p><span>&nbsp;&nbsp; Password</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div id="u1998" class="ax_default text_field">
        <input id="u1998_input" name="cul_password" type="password" value=""/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u1999" class="ax_default label">
        <div id="u1999_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u2000" class="text">
          <p><span style="color:#FF0000;">* </span><span>确认密码：</span></p><p><span>&nbsp;&nbsp; Confirm password</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div id="u2001" class="ax_default text_field">
        <input id="u2001_input" name="repass" type="password" value=""/>
      </div>

      <!-- Unnamed (Text Field) -->
      <!-- <div id="u2002" class="ax_default text_field">
        <input id="u2002_input" type="text" value=""/>
      </div> -->

      <!-- Unnamed (Rectangle) -->
      <div id="u2003" class="ax_default box_1">
        <img id="u2003_img" class="img " src="<%=basePath%>images/u26.png"/>
        <!-- Unnamed () -->
        <div id="u2004" class="text"  onclick="getadduserInfo()">
          <p><span style="text-align: center;cursor:pointer;">注册</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u2005" class="ax_default label">
        <div id="u2005_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u2006" class="text">
          <p><span style="color:#FF0000;">* </span><span>联系电话：</span></p><p><span>&nbsp;&nbsp; Contact number</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div id="u2007" class="ax_default text_field">
        <input id="u2007_input" type="text" name="cul_phone1"  value=""/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <!-- <div id="u2008" class="ax_default label">
        <div id="u2008_div" class=""></div>
        Unnamed ()
        <div id="u2009" class="text">
          <p><span style="color:#FF0000;">* </span><span>邮箱验证码：</span></p><p><span>&nbsp;&nbsp; Mailbox verification code</span></p>
        </div>
      </div>

      <div id="u2010" class="ax_default text_field">
        <input id="u2010_input" type="text" value="222"/>
      </div> -->

      <!-- Unnamed (Rectangle) -->
      <div id="u2011" class="ax_default label">
        <div id="u2011_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u2012" class="text">
          <p><span style="color:#FF0000;">* </span><span>企业类型：</span></p><p><span>&nbsp;&nbsp; Enterprise Type</span></p>
        </div>
      </div>

      <!-- Unnamed (Radio Button) -->
      <div id="u2013" class="ax_default radio_button">
        <label for="u2013_input">
          <!-- Unnamed () -->
          <div id="u2014" class="text">
            <p><span>出口商&nbsp; Exporter</span></p>
          </div>
        </label>
        <input id="u2013_input" type="radio" value="1" name="qytype" onchange="getEnIn()"/>
      </div>

      <!-- Unnamed (Radio Button) -->
      <div id="u2015" class="ax_default radio_button">
        <label for="u2015_input">
          <!-- Unnamed () -->
          <div id="u2016" class="text">
            <p><span>保理公司 Factoring Company </span></p>
          </div>
        </label>
        <input id="u2015_input" type="radio" value="2" name="qytype"  onchange="getEnIn()"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <!-- <div id="u2017" class="ax_default label">
        <div id="u2017_div" class=""></div>
        Unnamed ()
        <div id="u2018" class="text">
          <p><span style="color:#FF0000;">*</span><span> 公司邮箱</span></p><p><span>&nbsp;&nbsp; E-mail：</span></p>
        </div>
      </div> -->

      <!-- Unnamed (Radio Button) -->
      <div id="u2019" class="ax_default radio_button">
        <label for="u2019_input">
          <!-- Unnamed () -->
          <div id="u2020" class="text">
            <p><span>银行 Bank</span></p>
          </div>
        </label>
        <input id="u2019_input" type="radio" value="3" name="qytype"  onchange="getEnIn()"/>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u2021" class="ax_default box_2">
        <div id="u2021_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u2022" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u2023" class="ax_default label">
        <div id="u2023_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u2024" class="text" >
          <p><span >注册&nbsp; Registration</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u2025" class="ax_default box_2">
        <div id="u2025_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u2026" class="text">
          <p><span>©2018 京ICP备18013159号 大路网</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <div id="u2027" class="ax_default label">
        <div id="u2027_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u2028" class="text">
          <p><span>注册&nbsp;&nbsp; |&nbsp;&nbsp; 登录</span></p>
        </div>
      </div>

      <!-- Unnamed (Rectangle) -->
      <!-- <div id="u2029" class="ax_default box_1">
        <div id="u2029_div" class=""></div>
        Unnamed ()
        <div id="u2030" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div> -->

      <!-- Unnamed (Rectangle) -->
      <!-- <div id="u2031" class="ax_default label">
        <div id="u2031_div" class=""></div>
        Unnamed ()
        <div id="u2032" class="text">
          <p><span>需求说明</span></p>
        </div>
      </div> -->

      <!-- Unnamed (Radio Button) -->
      <div id="u2033" class="ax_default radio_button">
        <label for="u2033_input">
          <!-- Unnamed () -->
          <div id="u2034" class="text">
            <p><span>其他金融企业 Other Financial Company</span></p>
          </div>
        </label>
        <input id="u2033_input" type="radio" value="4" name="qytype"  onchange="getEnIn()"/>
      </div>

      <!-- Unnamed (Text Field) -->
      <div id="u2035" class="ax_default text_field">
        <input id="u2035_input" type="text" name="cul_phone2"  value=""/>
      </div>

      <!-- Unnamed (Text Field) -->
      <div id="u2036" class="ax_default text_field">
        <input id="u2036_input" type="text" name="cul_phone3" value=""/>
      </div>

      <!-- Unnamed (HTML Button) -->
     <!--  <div id="u2037" class="ax_default html_button">
        <input id="u2037_input" type="submit" value="send email"/>
      </div> -->

      <!-- Unnamed (Rectangle) -->
      <div id="u2038" class="ax_default label">
        <div id="u2038_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u2039" class="text">
          <p><span style="color:#FF0000;">*</span><span style="color:#000000;"> 所在国家</span></p><p><span style="color:#000000;">&nbsp;&nbsp; C</span><span>ountry：</span></p>
        </div>
      </div>

      <!-- Unnamed (Droplist) -->
      <div id="u2040" class="ax_default droplist">
        <select class="u2040_input" id="Countryinfo" name="cul_country">
          <option selected value="">请选择</option>
        </select>
      </div>

      <!-- Unnamed (Rectangle) -->
      <!-- <div id="u2041" class="ax_default label">
        <div id="u2041_div" class=""></div>
        Unnamed ()
        <div id="u2042" class="text">
          <p><span>1、出口商（卖家）注册时，可选择的国家，只有中国、越南、柬埔寨三个国家；其他的提供所有的国家选项</span></p><p><span><br></span></p><p><span><br></span></p><p><span>2、只“出口商”注册时，“公司名称”弹出 中英文的两个输入框</span></p>
        </div>
      </div> -->

      <!-- Unnamed (Text Field) -->
      <div id="u2043" class="ax_default text_field" style="display:none">
        <input id="u2043_input" type="text"  name="cul_name_en" value=""/>
      </div>

      <!-- Unnamed (Image) -->
    <%--   <div id="u2044" class="ax_default image">
        <img id="u2044_img" class="img " src="<%=basePath%>images/u2044.png"/>
        <!-- Unnamed () -->
        <div id="u2045" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div> --%>

      <!-- Unnamed (Droplist) -->
      <div id="u2046" class="ax_default droplist">
        <select class="u2046_input" id="areainfo"  name = "cul_continent" onchange="getDictionariesTwo()">
        </select>
      </div>

      <!-- Unnamed (Rectangle) -->
    <div id="u2047" class="ax_default label">
        <div id="u2047_div" class=""></div>
        <!-- Unnamed () -->
        <div id="u2048" class="text">
          <p><span style="color:#FF0000;">* </span><span>登陆账号：</span></p><p><span>&nbsp;&nbsp; code</span></p>
        </div>
      </div>

      <!-- Unnamed (Text Field) -->
      <div id="u2049" class="ax_default text_field">
        <input class="u2049_input" id="cul_account" name="cul_account" type="text" value="" onchange="getUserNameRepeat()"/>
      </div>

      <!-- Unnamed (Image) -->
      <div id="u2050" class="ax_default image">
        <img id="u2050_img" class="img " src="<%=basePath%>images/u1986.png"/>
        <!-- Unnamed () -->
        <div id="u2051" class="text" style="display:none; visibility: hidden">
          <p><span></span></p>
        </div>
      </div>
    </div>
  </body>
</html>
