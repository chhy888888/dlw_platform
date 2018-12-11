<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../top.jsp"%> 
		<script src="/plugins/select2/dist/js/select2.min.js"></script>
    	<link href="/plugins/select2/dist/css/select2.min.css" rel="stylesheet">
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="manager/financing/listFinancingPay.do" method="post" name="servicechargeForm" id="servicechargeForm">
				<input type="hidden" name="fc_id" id="fc_id">
			<table>
				<tr>
					<td style="padding-top:10px;">
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="fn_code" value="${pd.fn_code }" placeholder="这里输入项目编号" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td>
						<select class="selectpicker bla bla bli"  name="cul_id" data-live-search="true" id="cul_id" data-placeholder="-请选择-">
						</select>
					</td>
					<td>
					<select class="chzn-select" name="fc_pay_status" id="fc_pay_status"  data-placeholder="支付状态">
						<option value=""></option>
						<option value="" <c:if test="${pd.fc_pay_status != 1 && pd.fc_pay_status != 2 && pd.fc_pay_status != 3 && pd.fc_pay_status != 4 && pd.fc_pay_status != 0}"> selected</c:if>>全部</option>
						<option value="1" <c:if test="${pd.fc_pay_status == 1}"> selected</c:if>>预付款</option>
						<option value="2" <c:if test="${pd.fc_pay_status == 2}"> selected</c:if>>保理融资款</option>
						<option value="3" <c:if test="${pd.fc_pay_status == 2}"> selected</c:if>>买家尾款</option>
						<option value="4" <c:if test="${pd.fc_pay_status == 2}"> selected</c:if>>保理尾款</option>
					</select>
					</td>
					<td style="padding-top:10px;"><input class="span10 date-picker" name="paydatestart" id="paydatestart"  value="${pd.paydatestart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:100px;" placeholder="需求发布时间开始" title="需求发布时间开始"/></td>
					<td style="padding-top:10px;"><input class="span10 date-picker" name="paydateend" name="paydateend"  value="${pd.paydateend}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:100px;" placeholder="需求发布时间结束" title="需求发布时间结束"/></td>
					<c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					</c:if>
				</tr>
			</table>
			<!-- 检索  -->
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th>序号</th>
						<th>项目编号</th>
						<th>出口商</th>
						<th>资金方</th>
						<th>预付款</th>
						<th>融资款</th>
						<th>保理尾款实付</th>
						<th>正式协议时间</th>
						<th>订单状态</th>
						<th class="center">查看</th>
					</tr>
				</thead>
										
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty financingPayList.rows}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${financingPayList.rows}" var="fp" varStatus="vs">
							<fmt:parseDate value="${fp.fc_finalpaydate}" pattern="yyyy-MM-dd" var="fc_finalpaydate"></fmt:parseDate>
							<fmt:parseDate value="${fp.fc_financingpaydate}" pattern="yyyy-MM-dd" var="fc_financingpaydate"></fmt:parseDate>
							<fmt:formatNumber value="${(fc_finalpaydate.getTime()-fc_financingpaydate.getTime())/1000/60/60/24}" pattern="#0" var="daynum"/>
							<c:set var="needreceive" value="${fp.fc_declarationanmount-fp.fc_advancecharge}"/>
							<c:set var="moneyforinterest" value="${(fp.fc_declarationanmount-fp.fc_advancecharge)}"/>
							<c:set var="money" value="${(fp.fc_declarationanmount-fp.fc_advancecharge)*fp.fc_scale/100}"/>
							<c:if test="${(fp.fc_declarationanmount-fp.fc_advancecharge)*fp.fc_scale/100>fp.fc_creditlimit}">
								<c:set var="moneyforinterest" value="${fp.fc_creditlimit/(fp.fc_scale/100)}"/>
								<c:set var="money" value="${fp.fc_creditlimit}"/>
							</c:if>
							<c:set var="tailmoney" value="${fp.fc_declarationanmount - fp.fc_advancecharge - money}"/>
							<c:set var="interest" value="${moneyforinterest*(fp.fc_yearrate/100)*daynum/360}"/>
							<c:set var="paytailmoney" value="${fp.fc_declarationanmount - fp.fc_advancecharge - money - interest}"/>
									
							<tr>
								<td class='center' style="width: 30px;">${(page.currentPage-1)*page.showCount+vs.index+1}</td>
								<td>${fp.fn_code }</td>
								<td>${fp.culent_name_cn }</td>
								<td>${fp.culfa_name_cn }</td>
								<td>
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${fp.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${fp.fc_advancecharge }</td>
								<td>
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${fp.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${money}</td>
								<td>
								<c:forEach items="${currencyList}" var="currency" varStatus="vs">
									<c:if test="${fp.fc_declarationanmount == currency.sd_id}">${currency.sd_item_en}</c:if>
								</c:forEach>
								${paytailmoney}</td>
								<td><fmt:parseDate value="${fp.fc_datetime}" pattern="yyyy-MM-dd" var="fc_datetime"></fmt:parseDate>
								<fmt:formatDate value="${fc_datetime}" pattern="yyyy-MM-dd" var="fc_datetime_str"/>
								${fc_datetime_str}</td>
								<td>
								<c:if test='fp.fc_advancepaydate != "" && fp.fc_financingpaydate == ""'>支付预付款</c:if>
								<c:if test='fp.fc_financingpaydate != "" && fp.fc_finalpaydate == ""'>支付融资款</c:if>
								<c:if test='fp.fc_finalpaydate != "" && fp.fc_finalfapaydate == ""'>买家支付尾款</c:if>
								<c:if test='fp.fc_finalfapaydate != ""'>保理支付尾款</c:if>
								</td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										
										
										<c:if test="${QX.edit == 1 }">
											<a class='btn btn-mini btn-info' title="详情" onclick="viewfinancing('${fp.fc_fnid }');"><i class='icon-edit'></i></a>
										</c:if>
									</div>
								</td>
							</tr>
						
						</c:forEach>
						</c:if>
						
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="10" class="center">您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="10" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
					
				
				</tbody>
			</table>
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${pageinfo.pageStr}</div></td>
			</tr>
		</table>
		</div>
			
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		
		
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#servicechargeForm").submit();
		}
		
		//修改
		function viewfinancing(fn_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = '<%=basePath%>manager/financing/viewFinancingDetail.do?fn_id='+fn_id;
			 diag.Width = 1150;
			 diag.Height = 1055;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
			//日期框
			$('.date-picker').datepicker();
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
			$("#cul_id").select2({  
				language: "zh-CN",  
				allowClear: true,  
				width: "190px",  
				height:"20px",  
				placeholder: "请选择用户",  

				ajax: {  
				url: "<%=basePath%>manager/customer/listCustomerForAjax.do",  
				dataType: 'json', 
				contentType: "application/x-www-form-urlencoded; charset=utf-8",  
				delay: 250,  
				data: function (params) {  
					return {  

						cul_name: params.term 
					};  
				},  
				cache: true,
				processResults: function (res, params) { 
					var options = [];  
					for (var i = 0, len = res.data.length; i < len; i++) {  
						var option = {  
							"id": res.data[i].cul_id,  
							"text": res.data[i].cul_name_cn?res.data[i].cul_name_cn:res.data[i].cul_name_en
						};  
						options.push(option);  

					}
					return {  
						results: options 
					};  
				}  
			},  
			escapeMarkup: function (markup) {  
				return markup;  
			},  
			loadMorePadding:0,
			minimumInputLength: 1  
			}); 
		});
		
		
		</script>
		
	</body>
</html>

