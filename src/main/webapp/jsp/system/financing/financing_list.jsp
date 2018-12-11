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
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="fn_code" value="${pd.fn_code }" placeholder="这里输入项目编号" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="fn_name" value="${pd.fn_name }" placeholder="这里输入卖方/买方/保理名称" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="vertical-align:top;"> 
						<select class="chzn-select" name="fn_continent" id="fn_continent" data-placeholder="选择洲" onchange="chgcontinent(this.value);" style="vertical-align:top;width: 120px;" >
						<option value=""></option>
						<option value="">全部</option>
						<c:forEach items="${continentList}" var="continent" varStatus="vs">
						<option value="${continent.sd_id}">${continent.sd_item}</option>
						</c:forEach>
						</select>
					</td>
					<td style="vertical-align:top;"> 
						<select class="country-chzn-select" name="fn_country" id="fn_country" data-placeholder="选择国家" style="vertical-align:top;width: 120px;">
						<option value=""></option>
						<option value="">全部</option>
						</select>
					</td>
					<td><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:100px;" placeholder="发布时间开始" title="发布时间开始"/></td>
					<td><input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:100px;" placeholder="发布时间结束" title="发布时间结束"/></td>
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
						<th>买方国家/地区</th>
						<th>买方名称</th>
						<th>买方账期</th>
						<th>卖方名称</th>
						<th>信息有效期</th>
						<th>发布时间</th>
						<th>意向数</th>
						<th>需求状态</th>
						<th class="center">操作</th>
					</tr>
				</thead>			
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty financingList.rows}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${financingList.rows}" var="fn" varStatus="vs">
									
							<tr>
								<td class='center' style="width: 30px;">${(page.currentPage-1)*page.showCount+vs.index+1}</td>
								<td>${fn.fn_code }</td>
								<td>
							<c:forEach items="${countryList}" var="country" varStatus="vs">
								<c:if test="country.sd_id == fn.fn_country">
								${country.sd_item}
								</c:if>
							</c:forEach>
								</td>
								<td>${fn.fn_name }</td>
								<td>${fn.fn_accountperiod }</td>
								<td>${fn.cul_name_cn }</td>
								<td>${fn.fn_validity }</td>
								<td>${fn.fn_datetime }</td>
								<td>${fn.fi_cnt }</td>
								<td>
								<c:if test="${fn.fn_status==0}"><font color="blue">发布需求</font></c:if>
								<c:if test="${fn.fn_status==1 || fn.fn_status==2}"><font color="blue">意向阶段</font></c:if>
								<c:if test="${fn.fn_status==5 || fn.fn_status==6}"><font color="blue">合同阶段</font></c:if>
								<c:if test="${fn.fn_status==7 || fn.fn_status==8}"><font color="blue">确权阶段</font></c:if>
								<c:if test="${fn.fn_status==9}"><font color="blue">付款阶段</font></c:if>
								<c:if test="${fn.fn_status==99}"><font color="green">完成</font></c:if>
								<c:if test="${fn.fn_status==-1}"><font color="red">意向取消</font></c:if>
								</td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										
										
										<c:if test="${QX.edit == 1 }">
											<a class='btn btn-mini btn-info' title="编辑" onclick="editFinancing('${fn.fn_id }');"><i class='icon-edit'></i></a>
											<a class='btn btn-mini btn-info' title="保理意向" onclick="intention('${fn.fn_id }');"><i class='icon-comments'></i></a>
										</c:if>
										<c:if test="${QX.del == 1 }">
										 <a class='btn btn-mini btn-danger' title="删除" onclick="delUser('${fn.fn_id }','${fn.fn_code }');"><i class='icon-trash'></i></a>
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
		
		//修改
		function editFinancing(fn_id){
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
		
		//修改
		function intention(fn_id){
			top.mainFrame.tabAddHandler("z" + fn_id,"保理意向列表","<%=basePath%>manager/financing/listFinancingIntention.do?fn_id="+fn_id);
			top.jzts();
		}

		//删除
		function delFinancing(fn_id,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>manager/finiancing/delete.do?fn_id="+fn_id+"&tm="+new Date().getTime();
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

