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
	<div class="tabbable">
		<ul class="nav nav-tabs" id="myTab">
			<li class="active">
				<a data-toggle="tab" href="#home">
					<i class="green icon-globe bigger-110"></i>
					融资需求详情
				</a>
			</li>
			<c:if test="${financing.fn_status>1}">
			<li>
				<a data-toggle="tab" href="#profile">
					<i class="green icon-calendar bigger-110"></i>
					融资流程
				</a>
			</li>
			</c:if>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane in active">
				<form action="system/factoring/${msg }.do" name="Form" id="Form" method="post">
					<c:set var="currencytext" value=""/>
					<c:forEach items="${currencyList}" var="currency" varStatus="vs">
						<c:if test="${financing.fn_currency == currency.sd_id}"><c:set var="currencytext" value="${currency.sd_item_en}"/></c:if>
					</c:forEach>
					<div id="zhongxin">
					<table class="table table-striped" >
						<tr >
							<td style="text-align: center;padding-top: 13px;" colspan="3">融资需求信息</td>
						</tr>
						<tr >
							<td style="text-align: left;padding-top: 13px;">项目编号:${financing.fn_code}</td>
							<td style="text-align: left;padding-top: 13px;">信息发布者:${entcustomer.cul_name_cn}</td>
							<td style="text-align: left;padding-top: 13px;">发布时间:${financing.fn_datetime}</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" >
						<tr >
							<td style="text-align: right;padding-top: 13px;">买方国家/地区</td>
							<td style="text-align: right;padding-top: 13px;">买方名称</td>
							<td style="text-align: right;padding-top: 13px;">商品名称</td>
							<td style="text-align: right;padding-top: 13px;">剩余账期/买方账期</td>
							<td style="text-align: right;padding-top: 13px;">应收账款（预估）</td>
							<td style="text-align: right;padding-top: 13px;">心里底价</td>
						</tr>
						<tr >
							<td style="text-align: right;padding-top: 13px;">
								<c:forEach items="${continentList}" var="continent" varStatus="vs">
									<c:if test="${financing.fn_continent == continent.sd_id}">${continent.sd_item}</c:if>
								</c:forEach>
								<c:forEach items="${countryList}" var="country" varStatus="vs">
									<c:if test="${financing.fn_country == country.sd_id}">${country.sd_item}</c:if>
								</c:forEach>
							</td>
							<td style="text-align: right;padding-top: 13px;">${financing.fn_name}</td>
							<td style="text-align: right;padding-top: 13px;"></td>
							<td style="text-align: right;padding-top: 13px;">${financing.fn_remainderperiod}/${financing.fn_accountperiod}</td>
							<td style="text-align: right;padding-top: 13px;">${currencytext}${financing.fn_contractamount-financing.fn_advancescale*financing.fn_contractamount/100}</td>
							<td style="text-align: right;padding-top: 13px;">${financing.fn_floorprice}%</td>
						</tr>
						<tr >
							<td style="text-align: right;padding-top: 13px;">出口合同金额</td>
							<td style="text-align: right;padding-top: 13px;">预付款比例</td>
							<td style="text-align: right;padding-top: 13px;">预付款时间（预估）</td>
							<td style="text-align: right;padding-top: 13px;">结算方式</td>
							<td style="text-align: right;padding-top: 13px;">保险授信</td>
							<td style="text-align: right;padding-top: 13px;">信息有效期</td>
						</tr>
						<tr >
							<td style="text-align: right;padding-top: 13px;">${currencytext}${financing.fn_contractamount}</td>
							<td style="text-align: right;padding-top: 13px;">${financing.fn_advancescale}%</td>
							<td style="text-align: right;padding-top: 13px;">${financing.fn_advancepaydate}</td>
							<td style="text-align: right;padding-top: 13px;">
								<c:forEach items="${settlementList}" var="settlement" varStatus="vs">
									<c:if test="${financing.fn_settlementmethod == settlement.sd_id}">${settlement.sd_item}</c:if>
								</c:forEach>
							</td>
							<td style="text-align: right;padding-top: 13px;">
								<c:forEach items="${currencyInvoiceList}" var="currencyinvoice" varStatus="vs">
									<c:if test="${financing.fn_creditlimitcurrency == currencyinvoice.sd_id}">${currencyinvoice.sd_item_en}</c:if>
								</c:forEach>
							${financing.fn_creditlimit}</td>
							<td style="text-align: right;padding-top: 13px;">${financing.fn_validity}</td>
						</tr>
					</table>
					<table class="table table-striped" >
						<tr >
							<td style="text-align: center;padding-top: 13px;" colspan="3">买方信息</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" >
						<tr >
							<td style="width:15%;text-align: right;padding-top: 13px;">买方名称:</td>
							<td style="width:35%;padding-top: 13px;">${financing.fn_name}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">买方国家/地区:</td>
							<td style="width:35%;padding-top: 13px;">
								<c:forEach items="${continentList}" var="continent" varStatus="vs">
									<c:if test="${financing.fn_continent == continent.sd_id}">${continent.sd_item}</c:if>
								</c:forEach>
								<c:forEach items="${countryList}" var="country" varStatus="vs">
									<c:if test="${financing.fn_country == country.sd_id}">${country.sd_item}</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr >
							<td style="width:15%;text-align: right;padding-top: 13px;">联系人:</td>
							<td style="width:35%;padding-top: 13px;">${financing.fn_contacts}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">联系电话:</td>
							<td style="width:35%;padding-top: 13px;">${financing.fn_phone}</td>
						</tr>
						<tr >
							<td style="width:15%;text-align: right;padding-top: 13px;">确权邮件:</td>
							<td style="width:35%;padding-top: 13px;">${financing.fn_email}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">注册地址:</td>
							<td style="width:35%;padding-top: 13px;">${financing.fn_address}</td>
						</tr>
						<tr >
							<td style="width:15%;text-align: right;padding-top: 13px;">注册号:</td>
							<td style="width:35%;padding-top: 13px;">${financing.fn_regnumber}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">税号:</td>
							<td style="width:35%;padding-top: 13px;">${financing.fn_taxnumber}</td>
						</tr>
						<tr >
							<td style="width:15%;text-align: right;padding-top: 13px;">买方银行名称:</td>
							<td style="width:35%;padding-top: 13px;">${financing.fn_bankname}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">买方银行Swift Code:</td>
							<td style="width:35%;padding-top: 13px;">${financing.fn_bankswiftcode}</td>
						</tr>
						<tr >
							<td style="width:15%;text-align: right;padding-top: 13px;">年营业额:</td>
							<td style="width:35%;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${financing.fn_yearturnovercurrency == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
							${financing.fn_yearturnover}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">历史交易记录:</td>
							<td style="width:35%;padding-top: 13px;"><c:if test="${financing.fn_tradehistory == 1}">有</c:if><c:if test="${financing.fn_tradehistory == 0}">无</c:if></td>
						</tr>
						<tr >
							<td style="width:15%;text-align: right;padding-top: 13px;">最近一年合作金额:</td>
							<td style="width:35%;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${financing.fn_yearturnovercurrency == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
							${financing.fn_cooperateamount_lastyear}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;"></td>
							<td style="width:35%;padding-top: 13px;"></td>
						</tr>
					</table>
					<table class="table table-striped" >
						<tr >
							<td style="text-align: center;padding-top: 13px;" colspan="3">核保额度</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" >
						<tr >
							<td style="width:15%;text-align: right;padding-top: 13px;">保险公司:</td>
							<td style="width:35%;padding-top: 13px;">
								<c:forEach items="${insuranceList}" var="insurance" varStatus="vs">
									<c:if test="${financing.fn_insurer == insurance.sd_id}">${insurance.sd_item}</c:if>
								</c:forEach>
							</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">授信额度:</td>
							<td style="width:35%;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${financing.fn_creditlimitcurrency == currencyinvoice.sd_id}">${currencyinvoice.sd_item_en}</c:if>
								</c:forEach>
							${financing.fn_creditlimit}</td>
						</tr>
					</table>
					<table class="table table-striped" >
						<tr >
							<td style="text-align: center;padding-top: 13px;" colspan="3">商品信息</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" >
						<tr >
							<td style="text-align: center;padding-top: 13px;">HS编码</td>
							<td style="text-align: center;padding-top: 13px;">标准商品全名</td>
							<td style="text-align: center;padding-top: 13px;">名称</td>
							<td style="text-align: center;padding-top: 13px;">数量</td>
							<td style="text-align: center;padding-top: 13px;">单位</td>
						</tr>
						<c:forEach items="${financingproduct}" var="product" varStatus="vs">
						<tr >
							<td style="text-align: center;padding-top: 13px;">${product.fnp_hscode}</td>
							<td style="text-align: center;padding-top: 13px;">${product.fnp_hsname}</td>
							<td style="text-align: center;padding-top: 13px;">${product.fnp_name_cn}</td>
							<td style="text-align: center;padding-top: 13px;">${product.fnp_quantity}</td>
							<td style="text-align: center;padding-top: 13px;">${product.fnp_unit}</td>
						</tr>
						</c:forEach>
					</table>
					<table class="table table-striped" >
						<tr >
							<td style="text-align: center;padding-top: 13px;" colspan="3">合同要点</td>
						</tr>
					</table>
					<table id="cparea" class="table table-striped table-bordered" >
					</table>
					<table class="table table-striped" >
						<tr >
							<td style="text-align: center;padding-top: 13px;" colspan="3">备注</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" >
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">中文备注</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${financing.fn_remark_cn}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">英文备注</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${financing.fn_remark_en}</td>
						</tr>
					</table>
					</div>
					
					
				</form>
			</div>
			<c:if test="${financing.fn_status>1}">
			<div id="profile" class="tab-pane">
				<div id="zhongxin">
					<table class="table table-striped" >
						<tr >
							<td style="text-align: left;padding-top: 13px;">第一步：意向报价阶段</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" >
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">融资比例:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${intention.fi_scale}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">年利率:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${intention.fi_yearrate_from}<c:if test="${intention.fi_yearrate_type==1}">~${intention.fi_yearrate_to}</c:if></td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">是否可追索:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"><c:if test="${intention.fi_traceback==1}">可追索</c:if><c:if test="${intention.fi_traceback==0}">不可追索</c:if></td>
							<td style="width:15%;text-align: right;padding-top: 13px;">确权方式:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${intention.fi_confirmright_mode}</td>
						</tr>
					</table>
				<c:if test="${financing.fn_status>2}">
					<table class="table table-striped" >
						<tr >
							<td style="text-align: left;padding-top: 13px;">第二步：正式协议阶段</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" >
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">融资比例:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${contract.fc_scale}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">年利率:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${contract.fc_yearrate}</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">买方信用额度:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_creditlimitcurrency == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
							${contract.fc_creditlimit}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">合同有效期:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${contract.fc_datetime}-${contract.fc_enddate}</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">资金方上传合同:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
							<td style="width:15%;text-align: right;padding-top: 13px;">出口商上传合同:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
						</tr>
					</table>
				</c:if>
				<c:if test="${financing.fn_status>6}">
					<table class="table table-striped" >
						<tr >
							<td style="text-align: left;padding-top: 13px;">第三步：买方确权阶段</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered" >
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">报关单金额:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_declarationanmountcurrency == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
							${contract.fc_declarationanmount}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;" colspan="2">确权方式:</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">预付款金额:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_advancechargecurrency == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
							${contract.fc_advancecharge}</td>
							<td style="width:35%;text-align: left;padding-top: 13px;" colspan="2" rowspan="2">${intention.fi_confirmright_mode}</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">提单时间:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${contract.fc_ladingbill}</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">出口合同:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
							<td style="width:15%;text-align: right;padding-top: 13px;">订单:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">提单:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
							<td style="width:15%;text-align: right;padding-top: 13px;">商业发票:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">报关单:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
							<td style="width:15%;text-align: right;padding-top: 13px;">商品检验:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
						</tr>
					</table>
				</c:if>
				<c:if test="${financing.fn_status>=8}">
					<table class="table table-striped" >
						<tr >
							<td style="text-align: left;padding-top: 13px;">第四步：付款阶段</td>
						</tr>
					</table>
					<fmt:parseDate value="${contract.fc_finalpaydate}" pattern="yyyy-MM-dd" var="fc_finalpaydate"></fmt:parseDate>
					<fmt:parseDate value="${contract.fc_financingpaydate}" pattern="yyyy-MM-dd" var="fc_financingpaydate"></fmt:parseDate>
					<fmt:formatNumber value="${(fc_finalpaydate.getTime()-fc_financingpaydate.getTime())/1000/60/60/24}" pattern="#0" var="daynum"/>
					<c:set var="needreceive" value="${contract.fc_declarationanmount-contract.fc_advancecharge}"/>
					<c:set var="moneyforinterest" value="${(contract.fc_declarationanmount-contract.fc_advancecharge)}"/>
					<c:set var="money" value="${(contract.fc_declarationanmount-contract.fc_advancecharge)*contract.fc_scale/100}"/>
					<c:if test="${(contract.fc_declarationanmount-contract.fc_advancecharge)*contract.fc_scale/100>contract.fc_creditlimit}">
						<c:set var="moneyforinterest" value="${contract.fc_creditlimit/(contract.fc_scale/100)}"/>
						<c:set var="money" value="${contract.fc_creditlimit}"/>
					</c:if>
					<c:set var="tailmoney" value="${contract.fc_declarationanmount - contract.fc_advancecharge - money}"/>
					<c:set var="interest" value="${moneyforinterest*(contract.fc_yearrate/100)*daynum/360}"/>
					<c:set var="paytailmoney" value="${contract.fc_declarationanmount - contract.fc_advancecharge - money - interest}"/>
					<table class="table table-striped table-bordered" >
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">预付款金额:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_advancechargecurrency == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
							${contract.fc_advancecharge}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">预付款时间（预估）</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${financing.fn_advancepaydate}</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">预付款凭证:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
							<td style="width:15%;text-align: right;padding-top: 13px;">预付款时间:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${contract.fc_advancepaydate}</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">应收账款:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${needreceive}
							</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">融资比例:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${contract.fc_scale}%
							</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">保理融资款:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${money}
							</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">融资付款凭证:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
							</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">融资付款时间:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${contract.fc_financingpaydate}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;"></td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
							</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">保理融资尾款:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${tailmoney}
							</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">年利率:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${contract.fc_yearrate}%</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">计息天数:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
							${contract.fc_financingpaydate}~${contract.fc_finalpaydate}=${daynum}
							</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">融资利息:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${interest}
							</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">资金方尾款实付:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${paytailmoney}
							</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">尾款实付凭证:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">尾款实付时间:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">${contract.fc_finalfapaydate}</td>
							<td style="width:15%;text-align: right;padding-top: 13px;"></td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">协议佣金:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								<c:set var="comm_rate" value="0"/>
								<c:forEach items="${commissionList}" var="commission" varStatus="vs">
									<c:if test="${contract.fc_declarationanmount >= commission.comm_from && (contract.fc_declarationanmount <= commission.comm_to || commission.comm_to == 0) && contract.fc_declarationanmountcurrency == commission.comm_currency}"><c:set var="comm_rate" value="${commission.comm_rate}"/></c:if>
								</c:forEach>
								${moneyforinterest*comm_rate/100}
							</td>
							<td style="width:15%;text-align: right;padding-top: 13px;">临时加价:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${moneyforinterest*financing.fn_priceup/100}
							</td>
						</tr>
						<tr>
							<td style="width:15%;text-align: right;padding-top: 13px;">合计平台服务费:</td>
							<td style="width:35%;text-align: left;padding-top: 13px;">
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${contract.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${moneyforinterest*(comm_rate+financing.fn_priceup)/100}
							</td>
							<td style="width:15%;text-align: right;padding-top: 13px;"></td>
							<td style="width:35%;text-align: left;padding-top: 13px;"></td>
						</tr>
					</table>
				</c:if>
				</div>
			</div>
			</c:if>
		</div>
		
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
			var contractpoint = eval('[${financing.fn_contractpoint}]');
			var cpstr = ""
			for (i = 0;i < contractpoint.length ;i ++ )
			{
				cpstr += "<tr><td>" + (i + 1) + "." + contractpoint[i].title + "</td></tr>";
				cpstr += "<tr><td>" + contractpoint[i].option + "</td></tr>";
			}
			document.getElementById("cparea").innerHTML = cpstr;
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