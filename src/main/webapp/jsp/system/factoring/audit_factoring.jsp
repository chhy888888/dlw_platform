<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML
PUBLIC "-//W3C//DTD HTML 4.01//en"
"http://www.w3. org/TR/html4/strict.dtd">

<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="/static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="/static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="/static/css/chosen.css" />
		
		<link rel="stylesheet" href="/static/css/ace.min.css" />
		<link rel="stylesheet" href="/static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="/static/css/ace-skins.min.css" />
				
		<link rel="stylesheet" href="/static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="/static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="/static/js/jquery.tips.js"></script>
		
		<!-- 上传附件 -->
		<script type="text/javascript" src="/static/js/formatJson.js"></script>
		
		<script type="text/javascript">
		var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
		</script>
		
	    
<script type="text/javascript">
     var server="<%=basePath%>";// http://192.168.1.12:8080
	 var uploadServer='${HTTP_SERVER_OWNER_ATTACH}/';
	//保存
	function save(status){
	
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}
	
	
	
</script>
	</head>
<body>
	<form action="system/factoring/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="KU_ID" id="KU_ID" value="${factoring.KU_ID}"/>
		<input type="hidden" name="UB_CONTENTID" id="UB_CONTENTID" value="${factoring.UB_CONTENTID}"/>
		<input type="hidden" value="no" id="hasTp1" />
		<input type="hidden" name="KU_PAGES" id="KU_PAGES" value="${factoring.KU_PAGES}" />
		<input type="hidden" name="KU_FILESIZE" id="KU_FILESIZE" value="${factoring.KU_FILESIZE}"/>
		<input type="hidden" name="SAVE_STATUS_TEMP" id="SAVE_STATUS_TEMP" value="" />
		<input type="hidden" name="adminKey" id="adminKey" value="${factoring.adminKey }" />
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover" >
			<tr >
				<td style="width:15%;text-align: right;padding-top: 13px;">网站账号:</td>
				<td style="width:35%;">${customer.cul_account}</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">状态标识:</td>
				<td style="width:35%;">
					<c:if test="${customer.cul_status==1}">待审核</c:if>
					<c:if test="${customer.cul_status==0}">注册提交</c:if>
					<c:if test="${customer.cul_status==9}">审核通过</c:if>
					<c:if test="${customer.cul_status==-1}">已禁用</c:if>
					<c:if test="${customer.cul_status==-2}">审核不通过</c:if>
				</td>
			</tr>
			
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">企业名称(中文):</td>
				<td style="width:35%;">${customer.cul_name_cn}
				</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">企业名称(英文):</td>
				<td style="width:35%;">${customer.cul_name_en}
				</td>
		    </tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">企业类型:</td>
				<td style="width:35%;">
				${factoring.ent_type}
				</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">所在国家：</td>
				<td style="width:35%;">
					<c:forEach items="${continentList}" var="continent" varStatus="vs">
						<c:if test="${customer.cul_continent == continent.sd_id}">${continent.sd_item}</c:if>
					</c:forEach>
					<c:forEach items="${countryList}" var="country" varStatus="vs">
						<c:if test="${customer.cul_country == country.sd_id}">${country.sd_item}</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">公司地址:</td>
				<td style="width:35%;">${factoring.ent_address}</td>
			
				<td style="width:15%;text-align: right;padding-top: 13px;">邮政编码:</td>
				<td style="width:35%;" >${factoring.ent_postcode}</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">法人代表:</td>
				<td style="width:35%;">${factoring.ent_legal_representative}</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">公司邮箱:</td>
				<td style="width:35%;">${customer.cul_email}</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">联系人:</td>
				<td style="width:35%;">${factoring.ent_contactor}</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">联系电话:</td>
				<td style="width:35%;">${customer.cul_phone}</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">公司网址:</td>
				<td style="width:35%;">${customer.cul_website}</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">成立日期:</td>
				<td style="width:35%;">
				<span class="input-append">
				<fmt:formatDate value="${factoring.ent_createdate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">年营业额:</td>
				<td style="width:35%;">${factoring.ent_annual_turnover}</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">主要出口国家:</td>
				<td style="width:35%;">${factoring.ent_main_export_contries}</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">主要出口产品:</td>
				<td style="width:35%;">${factoring.ent_main_export_product}</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">结汇融资专用账号:</td>
				<td style="width:35%;">
				<c:if test='factoring.ent_open_bankaccount == 1'>开通</c:if>
				<c:if test='factoring.ent_open_bankaccount == 1'>不开通</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">收汇银行名称1:</td>
				<td style="width:35%;" id="ent_bank1"></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">收汇银行账户1:</td>
				<td style="width:35%;" id="ent_bank_account1"></td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">收汇银行名称2:</td>
				<td style="width:35%;" id="ent_bank2"></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">收汇银行账户2:</td>
				<td style="width:35%;" id="ent_bank_account2"></td>
			</tr>
			<tr>	
				<td style="width:15%;text-align: right;padding-top: 13px;">营业执照:</td>
				<td style="width:35%;">
				<span id="KU_ent.NAME" onclick="showent.()" title="点击预览" style="cursor:pointer"><a href="javascript:;"></a></span><br>
				</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">法人身份证:</td>
				<td style="width:35%;">
				<span id="KU_ent.NAME" onclick="showent.()" title="点击预览" style="cursor:pointer"><a href="javascript:;"></a></span><br>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="4" class=" table-hover">
					佣金设置表
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="4">
				<table class="table table-striped table-bordered" >
					<tr>
						<td>融资金额</td>
						<td>10万美元以下</td>
						<td>10-100万美元</td>
						<td>100-500万美元</td>
						<td>500万-1000万美元</td>
						<td>1000万美元以上</td>
					</tr>
					<tr>
						<td>协议佣金利率</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>融资金额</td>
						<td>10万欧元以下</td>
						<td>10-100万欧元</td>
						<td>100-500万欧元</td>
						<td>500万-1000万欧元元</td>
						<td>1000万欧元以上</td>
					</tr>
					<tr>
						<td>协议佣金利率</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="4">
					<a class="btn btn-mini btn-primary" onclick="save(1);">通过审核</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">拒绝通过</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='/static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="/static/js/bootstrap.min.js"></script>
		<script src="/static/js/ace-elements.min.js"></script>
		<script src="/static/js/ace.min.js"></script>
		<script type="text/javascript" src="/static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="/static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		
		<script type="text/javascript">
		 
		 
		// alert(zNodes);
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			$(".country-chzn-select").chosen(); 
			$(".country-chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		var isFirst=true;
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


		</script>
</body>
</html>