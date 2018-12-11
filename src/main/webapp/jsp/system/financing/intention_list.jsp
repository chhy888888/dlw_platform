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
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="manager/financing/listFinancingNeeds.do" method="post" name="userForm" id="userForm">
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<td>项目编号：${financing.fn_code}</td>
					<td>临时加价：<input type="text" id="fn_priceup" name="fn_priceup" value="${financing.fn_priceup}">%</td>
				</tr>
				<tr>
					<td>买方国家：
					<c:forEach items="${continentList}" var="continent" varStatus="vs">
						<c:if test="${financing.fn_continent == continent.sd_id}">${continent.sd_item}</c:if>
					</c:forEach>
					<c:forEach items="${countryList}" var="country" varStatus="vs">
						<c:if test="${financing.fn_country == country.sd_id}">${country.sd_item}</c:if>
					</c:forEach>
					</td>
					<td>买方：${financing.fn_name}</td>
				</tr>
			</table>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th>序号</th>
						<th>已签意向</th>
						<th>资金方</th>
						<th>年利率</th>
						<th>融资比例</th>
						<th class="center">操作</th>
					</tr>
				</thead>			
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty intentionList.rows}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${intentionList.rows}" var="fi" varStatus="vs">
									
							<tr>
								<td class='center' style="width: 30px;">${(page.currentPage-1)*page.showCount+vs.index+1}</td>
								<td class="center">
								<c:if test="fi.fi_yearrate_type == 1">
									<a class='btn btn-mini btn-info' title="已签订意向"><i class='icon-check'></i></a>
								</c:if>
								</td>
								<td>${fi.cul_name_cn }</td>
								<c:if test="${fi.fi_yearrate_type == 1}">
								<td>${fi.fi_yearrate_from }~${fi.fi_yearrate_to}</td>
								</c:if>
								<c:if test="${fi.fi_yearrate_type != 1}">
								<td>${fi.fi_yearrate_from }</td>
								</c:if>
								<td>${fi.fi_scale }</td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										
										
										<c:if test="${QX.cha == 1 }">
											<a class='btn btn-mini btn-info' title="查看意向报价" onclick="editUser('${fa.cul_id }');"><i class='icon-folder-open-alt'></i></a>
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
			$("#userForm").submit();
		}
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
						var maxIndex=$("#fn_country option:last").attr("index");
						for (i = maxIndex;i > 1 ;i -- )
						{
							$("#fn_country option:last").remove();
						}
						var html = "";
						for (i = 0;i < data.data.length ;i ++ )
						{
							html += "<option value='" + data.data[i].sd_id + "'>" + data.data[i].sd_item + "</option>";
						}
						$("#fn_country").append(html);
						$('.country-chzn-select').trigger('liszt:updated');
					}
				}
			});
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>manager/factoring/goAdd.do';
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editUser(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = '<%=basePath%>manager/factoring/goEdit.do?customerid='+user_id;
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delUser(userId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>manager/factoring/delete.do?customerid="+userId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
			//日期框
			$('.date-picker').datepicker();
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			$(".country-chzn-select").chosen(); 
			$(".country-chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
		});
		
		
		
		</script>
		
	</body>
</html>

