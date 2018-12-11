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
		<input type="hidden" name="cul_id" id="cul_id" value="${customer.cul_id}"/>
		<input type="hidden" name="fa_id" id="fa_id" value="${factoring.fa_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover" >
			<tr >
				<td style="width:15%;text-align: right;padding-top: 13px;">网站账号:</td>
				<td style="width:35%;">
				<input type="text" name="cul_account" id="cul_account" value="${customer.cul_account}" maxlength="255" placeholder="网站账号" title="网站账号"/></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">登录密码：</td>
				<td style="width:35%;text-align: right;padding-top: 13px;">
				<input type="password" name="cul_password" id="cul_password" value="" maxlength="255" placeholder="登录密码" title="登录密码"/></td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">状态标识:</td>
				<td style="width:35%;">
					<select name="cul_status" id="cul_status">
							<option value="1" <c:if test="${customer.cul_status==1}">selected</c:if>>待审核</option>
							<option value="0" <c:if test="${customer.cul_status==0}">selected</c:if>>注册提交</option>
							<option value="9" <c:if test="${customer.cul_status==9}">selected</c:if>>审核通过</option>
							<option value="-1" <c:if test="${customer.cul_status==-1}">selected</c:if>>已禁用</option>
							<option value="-2" <c:if test="${customer.cul_status==-2}">selected</c:if>>审核不通过</option>
					</select>
				</td>
				
				<td style="width:15%;text-align: right;padding-top: 13px;"></td>
				<td style="width:35%;"></td>
			</tr>
			
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">企业名称(中文):</td>
				<td style="width:35%;">
				<input type="text" name="cul_name_cn" id="cul_name_cn" value="${customer.cul_name_cn}" maxlength="255" placeholder="企业名称(中文)" title="企业名称(中文)"/>
				</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">企业名称(英文):</td>
				<td style="width:35%;">
				<input type="text" name="cul_name_en" id="cul_name_en" value="${customer.cul_name_en}" maxlength="255" placeholder="企业名称(英文)" title="企业名称(英文)"/>
				</td>
		    </tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">企业类型:</td>
				<td style="width:35%;">
				<input type="text" name="ent_type" id="ent_type" value="${ent.ent_type}" maxlength="50" placeholder="企业类型" title="企业类型"/>
				</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">所在国家：</td>
				<td style="width:35%;">
				<select class="chzn-select" name="cul_continent" id="cul_continent" data-placeholder="选择洲" onchange="chgcontinent(this.value);" style="vertical-align:top;width: 120px;" >
					<option value=""></option>
					<option value="">全部</option>
					<c:forEach items="${continentList}" var="continent" varStatus="vs">
					<option value="${continent.sd_id}">${continent.sd_item}</option>
					</c:forEach>
					</select>
					<select class="country-chzn-select" name="cul_country" id="cul_country" data-placeholder="选择国家" style="vertical-align:top;width: 120px;">
						<option value=""></option>
						<option value="">全部</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">公司地址:</td>
				<td style="width:35%;"><input type="text" name="ent_address" id="ent_address" value="${factoring.ent_address}" maxlength="255" placeholder="公司地址" title="公司地址"/></td>
			
				<td style="width:15%;text-align: right;padding-top: 13px;">邮政编码:</td>
				<td style="width:35%;" ><input type="text" name="ent_postcode" id="ent_postcode" value="${factoring.ent_postcode}" maxlength="255" placeholder="邮政编码" title="邮政编码"/></td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">法人代表:</td>
				<td style="width:35%;"><input type="text" name="ent_legal_representative" id="ent_legal_representative" value="${factoring.ent_legal_representative}" maxlength="20" placeholder="法人代表" title="法人代表"/></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">公司邮箱:</td>
				<td style="width:35%;"><input type="text" name="cul_email" id="cul_email" value="${customer.cul_email}" maxlength="10" placeholder="公司邮箱" title="公司邮箱"/></td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">联系人:</td>
				<td style="width:35%;"><input type="text" name="ent_contactor" id="ent_contactor" value="${factoring.ent_contactor}" maxlength="20" placeholder="联系人" title="联系人"/></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">联系电话:</td>
				<td style="width:35%;"><input type="text" name="cul_phone" id="cul_phone" value="${customer.cul_phone}" maxlength="10" placeholder="联系电话" title="联系电话"/></td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">公司网址:</td>
				<td style="width:35%;"><input type="text" name="cul_website" id="cul_website" value="${customer.cul_website}" maxlength="20" placeholder="公司网址" title="公司网址"/></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">成立日期:</td>
				<td style="width:35%;">
				<span class="input-append">
				<input class="span10 date-picker" style="width:200px;" name="ent_createdate" id="ent_createdate" value="<fmt:formatDate value="${factoring.ent_createdate}" pattern="yyyy-MM-dd"/>" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="成立日期" title="成立日期"/>
				<span class="add-on" title="点击清空" onclick="$(this).prev().val('');"><i id="nav-search-icon" class="icon-remove"></i></span>
				</span>
				</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">年营业额:</td>
				<td style="width:35%;"><input type="text" name="ent_annual_turnover" id="ent_annual_turnover" value="${factoring.ent_annual_turnover}" maxlength="20" placeholder="年营业额" title="年营业额"/></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">主要出口国家:</td>
				<td style="width:35%;"><input type="text" name="ent_main_export_contries" id="ent_main_export_contries" value="${factoring.ent_main_export_contries}" maxlength="10" placeholder="主要出口国家" title="主要出口国家"/></td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">主要出口产品:</td>
				<td style="width:35%;"><input type="text" name="ent_main_export_product" id="ent_main_export_product" value="${factoring.ent_main_export_product}" maxlength="20" placeholder="年营业额" title="年营业额"/></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">结汇融资专用账号:</td>
				<td style="width:35%;">
				<input type="radio" name="ent_open_bankaccount" value="1" <c:if test='factoring.ent_open_bankaccount == 1'>checked</c:if>>开通
				<input type="radio" name="ent_open_bankaccount" value="0" <c:if test='factoring.ent_open_bankaccount == 1'>checked</c:if>>不开通
				</td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">收汇银行名称1:</td>
				<td style="width:35%;"><input type="text" name="ent_bank_account" id="ent_bank_account" value="" maxlength="200" placeholder="收汇银行名称" title="收汇银行名称"/></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">收汇银行账户1:</td>
				<td style="width:35%;"><input type="text" name="ent_bank_account" id="ent_bank_account" value="" maxlength="10" placeholder="收汇银行账户" title="收汇银行账户"/></td>
			</tr>
			<tr>
				<td style="width:15%;text-align: right;padding-top: 13px;">收汇银行名称2:</td>
				<td style="width:35%;"><input type="text" name="ent_bank_account" id="ent_bank_account" value="" maxlength="200" placeholder="收汇银行名称" title="收汇银行名称"/></td>
				<td style="width:15%;text-align: right;padding-top: 13px;">收汇银行账户2:</td>
				<td style="width:35%;"><input type="text" name="ent_bank_account" id="ent_bank_account" value="" maxlength="10" placeholder="收汇银行账户" title="收汇银行账户"/></td>
			</tr>
			<tr>	
				<td style="width:15%;text-align: right;padding-top: 13px;">营业执照:</td>
				<td style="width:35%;">
				<input type="file" id="file_upload" ><a href='javascript:uploadent.Method()' class='btn btn-mini btn-primary'>上传</a>
				<span id="KU_ent.NAME" onclick="showent.()" title="点击预览" style="cursor:pointer"><a href="javascript:;"></a></span><br>
				</td>
				<td style="width:15%;text-align: right;padding-top: 13px;">法人身份证:</td>
				<td style="width:35%;">
				<input type="file" id="file_upload" ><a href='javascript:uploadent.Method()' class='btn btn-mini btn-primary'>上传正面</a>
				<span id="KU_ent.NAME" onclick="showent.()" title="点击预览" style="cursor:pointer"><a href="javascript:;"></a></span><br>
				<input type="file" id="file_uploaddoc" ><a href='javascript:uploadWordMethod()' class='btn btn-mini btn-primary'>上传反面</a>
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
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="843"><input type="hidden" name="comm_from" value="0"><input type="hidden" name="comm_to" value="100000"></td>
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="843"><input type="hidden" name="comm_from" value="100000"><input type="hidden" name="comm_to" value="1000000"></td>
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="843"><input type="hidden" name="comm_from" value="1000000"><input type="hidden" name="comm_to" value="5000000"></td>
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="843"><input type="hidden" name="comm_from" value="5000000"><input type="hidden" name="comm_to" value="10000000"></td>
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="843"><input type="hidden" name="comm_from" value="10000000"><input type="hidden" name="comm_to" value="0"></td>
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
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="844"><input type="hidden" name="comm_from" value="0"><input type="hidden" name="comm_to" value="100000"></td>
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="844"><input type="hidden" name="comm_from" value="100000"><input type="hidden" name="comm_to" value="1000000"></td>
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="844"><input type="hidden" name="comm_from" value="1000000"><input type="hidden" name="comm_to" value="5000000"></td>
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="844"><input type="hidden" name="comm_from" value="5000000"><input type="hidden" name="comm_to" value="10000000"></td>
						<td><input type="text" name="comm_rate" style="width:100px;"><input type="hidden" name="comm_currency" value="844"><input type="hidden" name="comm_from" value="10000000"><input type="hidden" name="comm_to" value="0"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="4">
					<a class="btn btn-mini btn-primary" onclick="save(1);">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
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