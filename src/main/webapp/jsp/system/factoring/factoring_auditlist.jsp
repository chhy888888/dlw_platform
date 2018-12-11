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
			<c:if test="${cul_status==0}">
			<form action="manager/factoring/listAudit.do" method="post" name="userForm" id="userForm">
			</c:if>
			<c:if test="${cul_status==-2}">
			<form action="manager/factoring/listAuditNotPass.do" method="post" name="userForm" id="userForm">
			</c:if>
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="account" value="${pd.account }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:100px;" placeholder="申请日期开始" title="申请日期开始"/></td>
					<td><input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:100px;" placeholder="申请日期" title="申请日期结束"/></td>
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
						<th>账号</th>
						<th>企业名称</th>
						<th>联系方式</th>
						<th>所在地</th>
						<th>注册时间</th>
						<th>状态</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty factoringList.rows}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${factoringList.rows}" var="fa" varStatus="vs">
									
							<tr>
								<td class='center' style="width: 30px;">${(page.currentPage-1)*page.showCount+vs.index+1}</td>
								<td>${fa.cul_account }</td>
								<td>${fa.cul_name_cn }</td>
								<td>${fa.cul_phone }</td>
								<td>${fa.fa_address }</td>
								<td>${fa.cul_regdate }</td>
								<td><c:if test="${fa.cul_status==1}">正常</c:if><c:if test="${fa.cul_status==0}">未审核</c:if><c:if test="${fa.cul_status==-1}">已封禁</c:if><c:if test="${fa.cul_status==-2}">审核未通过</c:if></td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										
										
										<c:if test="${QX.edit == 1 }">
											<a class='btn btn-mini btn-info' title="编辑" onclick="editUser('${fa.cul_id }');"><i class='icon-edit'></i></a>
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
		
		
		//修改
		function editUser(user_id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = '<%=basePath%>manager/factoring/goAudit.do?customerid='+user_id;
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
			
			
		});
		
		
		
		</script>
		
	</body>
</html>

