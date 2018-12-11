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
  
    <title>登陆</title>
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jQuery.easyui.js"></script>
   	<script type="text/javascript" src="<%=basePath %>js/Common.js"></script>
  </head>
  <script type="text/javascript">
  	$(function(){
  		getDictionariesOne('area');
  	})
  	
  	function gethjgj(){
  		var ss = "",ss1 = "";
  		var params = $("#rzxq").serializeArray();
  		$.each(params, function(i, param){
  			ss += "&"+param.name+"="+param.value;
  		});
  		var params1 = $("#rzsp").serializeArray();
  		$.each(params1, function(i, param1){
  			ss1 += "&"+param1.name+"="+param1.value;
  		});
  		
  		$.ajax({
  	        url: "<%=basePath %>financing/getaddfinancingNeedsofProduct?1=1"+ss+ss1,
  	        type : "post",
  	        dataType: "text",
  	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
  	        success: function (dataInfo) {
  	        }
  	    });
  	}
  	
  	function getlllll(){
  		$.ajax({
  	        url: "<%=basePath %>financing/getfinancingNeedsList",
  	        type : "post",
  	        dataType: "text",
  	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
  	        success: function (dataInfo) {
  	        	alert(">"+dataInfo);
  	        }
  	    });
  	}

  	
  	
  </script>
 <body>
<form id = "rzxq">
<select id = "areainfo"  name = "fn_continent" onchange="getDictionariesTwo()">
</select>
<select id = "Countryinfo"  name = "fn_country" >
</select>
买方公司
<input type = "text" id = "" name = "fn_name" />
买方账期
<input type = "text" id = "" name = "fn_accountperiod" />
剩余时间
<input type = "text" id = "" name = "fn_remainderperiod" /><br />
出口金额
<input type = "text" id = "" name = "fn_contractamount" />
预付款比例
<input type = "text" id = "" name = "fn_advancescale" />
信息有效期
<input type = "text" id = "" name = "fn_accountreceivable" />
</form>

<form id = "rzsp">
HS编码<input type = "text" id = "" name = "fnp_hscode1"/>
标准商品名称<input type = "text" id = "" name = "fnp_hsname1"/>
名称（英文）<input type = "text" id = "" name = "fnp_name_cn1"/>
数量<input type = "text" id = "" name = "fnp_quantity1"/>
单位<input type = "text" id = "" name = "fnp_unit1"/>

HS编码<input type = "text" id = "" name = "fnp_hscode2"/>
标准商品名称<input type = "text" id = "" name = "fnp_hsname2"/>
名称（英文）<input type = "text" id = "" name = "fnp_name_cn2"/>
数量<input type = "text" id = "" name = "fnp_quantity2"/>
单位<input type = "text" id = "" name = "fnp_unit2"/>

HS编码<input type = "text" id = "" name = "fnp_hscode3"/>
标准商品名称<input type = "text" id = "" name = "fnp_hsname3"/>
名称（英文）<input type = "text" id = "" name = "fnp_name_cn3"/>
数量<input type = "text" id = "" name = "fnp_quantity3"/>
单位<input type = "text" id = "" name = "fnp_unit3"/>
</form>

 <input type = "button" value = "提交" onclick="gethjgj()" />
 
 <input type = "button" value = "查询融资信息表" onclick="getlllll()" />
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 </body>
</html>
