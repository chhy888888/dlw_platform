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
  		getDictionariesOne('Insurance');
  		getDictionariesOne('Currency');
  		getselectzjf();
  		$("#fn_id").val(Math.round((Math.random() * 999999999999999)));
  		
  		$("#fn_name").bind('input propertychange', function(){
  			searchProductClassbyName();
  		}); 
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
			/* var af_fnid = $("#af_fnid").val($("#fn_id").val());
			var af_fieldname = $("#af_fieldname").val(filename);
			var af_descript = $("#af_descript").val("fn_id");
			var af_path = $("#af_path").val("http://139.196.85.212/doc/usr/2018111415423473951.png"); */
			/* var uls = "/upload/file";
			var filename = $("#scsxedzl").val();
			$.ajax({
				type: "POST",
				url: uls,
				enctype: 'multipart/form-data',
				cache: false,
		        processData: false,
		        contentType: false,
		        dataType:"json",
				data: {files: filename},
				success: function (dataInfo) {
					alert("Data Uploaded: "+dataInfo);
				}
			}); */
		});
  	})
  	//查询合同要点
  	function getContractInfo(){
  		var Country = $("#Countryinfo").val();
  		Country = "'"+Country+"','0'";
  		$.ajax({
  	        url: "<%=basePath %>system/getContractInfo",
  	     	data : {scp_country:Country},
  	        type : "post",
  	        dataType: "text",
  	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
  	        success: function (dataInfo) {
  	        	$("#fn_contractpoint").html(dataInfo);
  	        }
  	    });
  	}
  	
  	//查询买方公司
  	function searchProductClassbyName(){
  		if($("#fn_name").val() != ''){
	  		$("#sss").val($("#fn_name").val());
	  		var fn_name = $("#fn_name").val();
	  		getmfname(fn_name);
  		}
  	}
  	//查询买方公司
  	function getmfname(fnname){
  		$.ajax({
  	        url: "<%=basePath %>financing/getFinancingSelectListInfo",
  	     	data : {fn_name:fnname},
  	        type : "post",
  	        dataType: "text",
  	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
  	        success: function (dataInfo) {
  	        	alert("<>"+dataInfo);
  	        }
  	    });
  	}
  	//提交融资需求表
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
  		//getzjflist
  		var fc_facustomerid = $("#fc_facustomerid").val();
  		alert(">>>"+fc_facustomerid);
  		if(fc_facustomerid != null && fc_facustomerid != ''){
  			alert("第二次合作");
  			$.ajax({
	  	        url: "<%=basePath %>financing/getaddNeedsOfProductOfintentionOfcontract?fc_facustomerid="+fc_facustomerid+"+"+ss+ss1,
	  	        type : "post",
	  	        dataType: "text",
	  	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	  	        success: function (dataInfo) {
	  	        	alert("<><>"+dataInfo);
	  	        }
	  	    });
  		}else{
  			alert("第一次合作或者发布新的需求");
	  		$.ajax({
	  	        url: "<%=basePath %>financing/getaddfinancingNeedsofProduct?1=1"+ss+ss1,
	  	        type : "post",
	  	        dataType: "text",
	  	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	  	        success: function (dataInfo) {
	  	        	alert("<><>"+dataInfo);
	  	        }
	  	    });
  		}
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
	
  	//查询资金方
  	function getselectzjf(){
  		$.ajax({
  	        url: "<%=basePath %>financing/getselectzjf",
  	        type : "post",
  	        dataType: "text",
  	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
  	        success: function (dataInfo) {
  	        	var data = $.parseJSON(dataInfo);
	  	      	if(data.message){
	  	        	data = $.parseJSON(data.data);
	  	        	if(data == "0"){
	  	        		$("#fc_facustomerid").hide();
	  	        		$("#bbmyddyqr").hide();
	  	        	}else{
		  	        	var strHtml = "<option value = ''>请选择</option>";
		  	      		for(var i = 0 ; i < data.length ; i++ ){
		  	      			strHtml += "<option value = '"+data[i].fc_facustomerid+"'>"+data[i].zjfname+"</option>";
		  	      		}
		  	      		$("#fc_facustomerid").empty().append(strHtml);
	  	        	}
	  	      	}
  	        }
  	    });
  	}
  	
  	
  	
  </script>
 <body>

<form id = "rzxq">
 融资主键：<input type = "text" id = "fn_id" name = "fn_id"/><br />
信息发布者：<a id = "fbgs"></a><div id = "getzjfinfo">资金方：<select id = "fc_facustomerid"></select></div><br />
<input type = "hidden" id = "sss" />
<select id = "area"  name = "fn_continent" onchange="getDictionariesTwo()">
</select>
<select id = "Countryinfo"  name = "fn_country" onchange="getContractInfo()">
</select>
<input type = "hidden" id = "fn_code" name = "fn_code" value = "fn_code" />
买方公司
<input type = "text" id = "fn_name" name = "fn_name" value = "fn_name"/>
买方账期
<input type = "text" id = "fn_accountperiod" name = "fn_accountperiod" value = "fn_accountperiod" />
剩余账期
<input type = "text" id = "fn_remainderperiod" name = "fn_remainderperiod" value = "fn_remainderperiod" />
心里底价
<input type = "text" id = "fn_floorprice" name = "fn_floorprice" value = "fn_floorprice" /><br />
<br /><br />
出口金额
<input type = "text" id = "fn_contractamount" name = "fn_contractamount" value = "fn_contractamount" />
币种：
<select id = "fn_currency" name = "fn_currency"></select>
预付款比例
<input type = "text" id = "fn_advancescale" name = "fn_advancescale" value = "fn_advancescale" />
预付款付款时间（预估）
<input type = "text" id = "fn_advancepaydate" name = "fn_advancepaydate" value = "fn_advancepaydate" />
结算方式
<select id = "fn_settlementmethod" name = "fn_settlementmethod"></select>
信息有效期
<input type = "text" id = "fn_validity" name = "fn_validity" value = "fn_validity" />
<div id = "bbmyddyqr">
本笔贸易订单已确认
<input type = "radio" id = "fn_advancescale" name = "fn_advancescale" value = "是" />是
<input type = "radio" id = "fn_advancescale" name = "fn_advancescale" value = "否" />否
</div>
</form>
<br /><br />
1、买家信用调研<br />
友情提示：上传信保对买方的授信评估，有助于提高融资成功的概率。

1. 已购买中国境内保险公司的出口信用保险，且保险公司已给买家授信额度，卖家需缴纳200元人民币融资信息发布费用，并上传买家授信凭证。（优惠期内免信息发布费）

2. 未购买出口信用保险，卖家在和保理商达成意向合作的同时，需要缴纳1200元人民币的买家信用调研费。卖家和保理达成意向协议后，平台客服通过线下方式和卖家沟通缴费事宜。
<br />
保险公司：
<select id = "Insurance" name = "fn_insurer">
</select>
<br />
授信额度：<input type = "text" id = "fn_creditlimit" name = "fn_creditlimit" value = "fn_creditlimit"/>
<select id = "Currency" name = "fn_creditlimitcurrency"></select>

<input type = "file" value = "file" id = "scsxedzl"/>
<input id="uploadbutton" type="button" value="上传"/><br />
<br />

公司名：<input type = "text" id = "fn_name" name = "fn_name" value = "fn_name"/><br />
联系人：<input type = "text" id = "fn_contacts" name = "fn_contacts" value = "fn_contacts"/><br />
联系电话：<input type = "text" id = "fn_phone" name = "fn_phone" value = "fn_phone"/><br />
买方确权邮件地址：<input type = "text" id = "fn_email" name = "fn_email" value = "fn_email"/><br />
注册地址：<input type = "text" id = "fn_address" name = "fn_address" value = "fn_address"/><br />
注册号：<input type = "text" id = "fn_regnumber" name = "fn_regnumber" value = "fn_regnumber"/><br />
税号：<input type = "text" id = "fn_taxnumber" name = "fn_taxnumber" value = "fn_taxnumber"/><br />
买房银行名称：<input type = "text" id = "fn_bankname" name = "fn_bankname" value = "fn_bankname"/><br />
买房银行Swift Code：<input type = "text" id = "fn_bankswiftcode" name = "fn_bankswiftcode" value = "fn_bankswiftcode"/><br />
年营业额：<input type = "text" id = "fn_yearturnover" name = "fn_yearturnover" value = "fn_yearturnover"/>
<select id = "Currency" name = "fn_yearturnovercurrency"></select><br />
历史交易记录：
<input type = "radio" id = "fn_tradehistory0" name = "fn_tradehistory"/>
<input type = "radio" id = "fn_tradehistory1" name = "fn_tradehistory"/>
<br />
合作历史已有多久（月份）：
<input type = "text" id = "fn_cooperatemonth" name = "fn_cooperatemonth"/><br />
合作次数：<input type = "text" id = "fn_cooperatetimes" name = "fn_cooperatetimes"/><br />
最近一年合作金额：<input type = "text" id = "fn_cooperateamount_lastyear" name = "fn_cooperateamount_lastyear"/><br />

<br /><br />
3、商品信息
<form id = "rzsp">
HS编码<input type = "text" id = "fnp_hscode1" name = "fnp_hscode1" value = "fnp_hscode1"/>
标准商品名称<input type = "text" id = "fnp_hsname1" name = "fnp_hsname1" value = "fnp_hsname1"/>
名称（英文）<input type = "text" id = "fnp_name_cn1" name = "fnp_name_cn1" value = "fnp_name_cn1"/>
数量<input type = "text" id = "fnp_quantity1" name = "fnp_quantity1" value = "fnp_quantity1"/>
单位<input type = "text" id = "fnp_unit1" name = "fnp_unit1" value = "fnp_unit1"/>
<br />
HS编码<input type = "text" id = "fnp_hscode2" name = "fnp_hscode2" value = "fnp_hscode2"/>
标准商品名称<input type = "text" id = "fnp_hsname2" name = "fnp_hsname2" value = "fnp_hsname2"/>
名称（英文）<input type = "text" id = "fnp_name_cn2" name = "fnp_name_cn2" value = "fnp_name_cn2"/>
数量<input type = "text" id = "fnp_quantity2" name = "fnp_quantity2" value = "fnp_quantity2"/>
单位<input type = "text" id = "fnp_unit2" name = "fnp_unit2" value = "fnp_unit2"/>
<br />
HS编码<input type = "text" id = "fnp_hscode3" name = "fnp_hscode3" value = "fnp_hscode3"/>
标准商品名称<input type = "text" id = "fnp_hsname3" name = "fnp_hsname3" value = "fnp_hsname3"/>
名称（英文）<input type = "text" id = "fnp_name_cn3" name = "fnp_name_cn3" value = "fnp_name_cn3"/>
数量<input type = "text" id = "fnp_quantity3" name = "fnp_quantity3" value = "fnp_quantity3"/>
单位<input type = "text" id = "fnp_unit3" name = "fnp_unit3" value = "fnp_unit3"/>
</form>
<br /><br />
4、合同要点
<div id = "fn_contractpoint">fn_contractpoint</div>
<br /><br />
5、备注<br />
中文：
<textarea rows="10" cols="50" id = "fn_remark_cn" name = "fn_remark_cn">
fn_remark_cn
</textarea>
<br />
EN：
<textarea rows="10" cols="50" id = "fn_remark_en" name = "fn_remark_en">
fn_remark_en
</textarea>
<br /><br />
6、资料<br />
1、<div id = "" ></div><input type="button" value = "上传" /><br />
1、<div id = "" ></div><input type="button" value = "上传" /><br />
<br /><br />
 <input type = "button" value = "提交" onclick="gethjgj()" />
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 </body>
</html>
