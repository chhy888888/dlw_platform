<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,String> map = (Map) request.getSession().getAttribute("userMap");
String ZZJG_ID = map.get("ZZJG_ID");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>场次管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/default.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/icon.css" />
	<script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/generalJS.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/locale/easyui-lang-zh_CN.js"></script> 
</head>
<body>
<div style="width:100%;height:600px">
	<form id = "selectccinfo">
		<table style="width:100%;" >
			<tr>
				<td align="right">考试场次：</td>
				<td><input class="easyui-textbox" style="width:150px;" id = "selectccName" name = "selectccName">
				</td>
				<td align="right">工种：</td>
				<td>
					<select class="easyui-combobox" style="width:150px;" id = "selectgzlb" name = "selectgzlb">   
					</select>
				</td>
				<td align="right">考试模式：</td>
				<td>
				<select class="easyui-combobox" style="width:150px;" id = "selectsftysj" name = "selectsftysj">   
					<option value = "">---请选择---</option>
					<option value = "1">统一</option>
					<option value = "2">不统一</option>
				</select>
				</td>
				<td align="right">考试时间：</td>
				<td>
					<input id = "selectkssjk" name = "selectkssjk" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:100px;"/>---
					<input id = "selectkssjj" name = "selectkssjj" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:100px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="8" align='center'>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="paperListInfo()">查询</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="paperAdd()">新增</a>
			</tr>
		</table>
	</form>

		<div style="width:100%;height:94.5%;">
	<table id="paperdg" title="场次管理" style="width:100%;height:100%;"
			data-options="rownumbers:true,singleSelect:true,pagination:true,url:'<%=basePath %>examRoom/allkscc?ran='+Math.random(),method:'post'">
		<thead>
			<tr>
				<th data-options="field:'ZZJG_ID',align:'center'" style="width: 15%">组织机构名称</th>
				<th data-options="field:'GZ_ID',align:'center'" style="width: 10%">工种</th>
				<th data-options="field:'CC_NAME',align:'center'" style="width: 22%">考试场次</th>
				<th data-options="field:'SFTYSJ',align:'center'" style="width: 10%">考试模式</th>
				<th data-options="field:'KSSJ',align:'center'" style="width: 22%">考试时间</th>
				<th data-options="field:'KSSC',align:'center'" style="width: 10%">考试时长</th>
				<th data-options="field:'xiangqing',align:'center'" style="width: 10%">操作</th>
			</tr>
		</thead>
	</table>
</div>
	<script type="text/javascript">
		var ZZJG_ID = '<%=ZZJG_ID%>';
		$(function(){
			/* var pager = $('#paperdg').datagrid().datagrid('getPager'); */	// get the pager of datagrid
			$("#paperdg").datagrid({
				pageSize:20
			});
			$('#paperdg').datagrid('getPager').pagination({//分页栏下方文字显示
				beforePageText: '第',//页数文本框前显示的汉字    
                afterPageText: '页    共 {pages} 页',  
                displayMsg:'当前显示从第{from}条到{to}条 共{total}条记录'
             });
			//工种
			$('#selectgzlb').combobox({
                url: '<%=basePath %>SystemsManagement/Listsjcdz?fid=b8bacf2523357652843',
                editable: false, //不可编辑状态
                valueField: 'id',
                textField: 'zd_name',
                loadFilter:function(data){
                	var obj = {};  
                    obj.id = '';  
                   	obj.zd_name = '---请选择---';
                    data.splice(0,0,obj);
                    return data;
                }
            });
			$('#selectsftysj').combobox({ 
                editable:false  //是否可编辑
            });
		
			$(document).keyup(function(event){
		          if(event.keyCode ==13){  
		        	  paperListInfo();  
		         }  
		     });
			
		$("#paperAddInfo #SFTYSJ").combobox({
			onSelect:function(record){
				if(record.value == '1'){
					$("#paperAddInfo #KSSC").textbox('setValue', "");
					$('#paperAddInfo #KSSC').textbox('textbox').attr('readonly',true); 
					var kssj = $("#paperAddInfo #KSKSSJ").datetimebox("getValue");
					var jssj = $("#paperAddInfo #KSJSSJ").datetimebox("getValue");
					if(kssj != "" && jssj != ""){
						$("#paperAddInfo #KSSC").textbox('setValue', GetDateDiff(kssj,jssj,"minute"));
					}
				}else if(record.value == '2'){
					$("#paperAddInfo #KSSC").textbox('setValue', "");
					$('#paperAddInfo #KSSC').textbox('textbox').attr('readonly',false); 
				}
			}
		})
		//计算时间
		$("#paperUpdateInfo #SFTYSJ").combobox({
			onSelect:function(record){
				$("#paperUpdateInfo #SFTYSJ").combobox({
					onSelect:function(record){
						if(record.value == '1'){
							$("#paperUpdateInfo #KSSC").textbox('setValue', "");
							$('#paperUpdateInfo #KSSC').textbox('textbox').attr('readonly',true); 
							var kssj = $("#paperUpdateInfo #KSKSSJ").datetimebox("getValue");
							var jssj = $("#paperUpdateInfo #KSJSSJ").datetimebox("getValue");
							if(kssj != "" && jssj != ""){
								$("#paperUpdateInfo #KSSC").textbox('setValue', GetDateDiff(kssj,jssj,"minute"));
							}
						}else if(record.value == '2'){
							$("#paperUpdateInfo #KSSC").textbox('setValue', "");
							$('#paperUpdateInfo #KSSC').textbox('textbox').attr('readonly',false); 
						}
					}
				})
			}
		})
		
		$('#paperAddInfo #KSKSSJ').datetimebox({
			   //showSeconds:false,
			   //required:true,
			   onChange:function(date){
				   getaddsjjs();
			   }
		}); 
		$('#paperAddInfo #KSJSSJ').datetimebox({
			   //showSeconds:false,
			  //  required:true,
			   onChange:function(date){
				   getaddsjjs();
			   }
		}); 
		$('#paperUpdateInfo #KSKSSJ').datetimebox({
			   //showSeconds:false,
			   //required:true,
			   onChange:function(date){
				   getjssjadd();
			   }
		});
		$('#paperUpdateInfo #KSJSSJ').datetimebox({
			   //showSeconds:false,
			  // required:true,
			   onChange:function(date){
				   getjssjadd();
			   }
		});
		
		})
		function getaddsjjs(){
			var record = $("#paperAddInfo #SFTYSJ").combobox("getValue");
			if(record == '1'){
				$("#paperAddInfo #KSSC").textbox('setValue', "");
				$('#paperAddInfo #KSSC').textbox('textbox').attr('readonly',true); 
				var kssj = $("#paperAddInfo #KSKSSJ").datetimebox("getValue");
				var jssj = $("#paperAddInfo #KSJSSJ").datetimebox("getValue");
				if(kssj != "" && jssj != ""){
					$("#paperAddInfo #KSSC").textbox('setValue', GetDateDiff(kssj,jssj,"minute"));
				}
			}else if(record == '2'){
				//$("#paperAddInfo #KSSC").textbox('setValue', "");
				$('#paperAddInfo #KSSC').textbox('textbox').attr('readonly',false); 
			}
		}
		function  getjssjadd(){
			var record = $("#paperUpdateInfo #SFTYSJ").combobox("getValue");
			if(record == '1'){
				$("#paperUpdateInfo #KSSC").textbox('setValue', "");
				$('#paperUpdateInfo #KSSC').textbox('textbox').attr('readonly',true); 
				var kssj = $("#paperUpdateInfo #KSKSSJ").datetimebox("getValue");
				var jssj = $("#paperUpdateInfo #KSJSSJ").datetimebox("getValue");
				if(kssj != "" && jssj != ""){
					$("#paperUpdateInfo #KSSC").textbox('setValue', GetDateDiff(kssj,jssj,"minute"));
				}
			}else if(record == '2'){
				//$("#paperAddInfo #KSSC").textbox('setValue', "");
				$('#paperUpdateInfo #KSSC').textbox('textbox').attr('readonly',false); 
			}
		}
		//查询
		function paperListInfo(){
			$('#paperdg').datagrid('load',{
				selectccName: $('#selectccName').textbox('getValue'),
				selectgzlb: $('#selectgzlb').combobox('getValue'),
				selectsftysj: $('#selectsftysj').combobox('getValue'),
				selectkssjk: $('#selectkssjk').combobox('getValue'),
				selectkssjj: $('#selectkssjj').combobox('getValue'),
				ran: Math.random()
			});
		}
		
		//加载操作
		function rowformater(value,row,index){
			var str = "";
				str += '<a href="javascript:;" class="easyui-linkbutton" onclick="paperQuery(\''+row.ID+'\')">详情</a>&nbsp;|';
				str += '<a href="javascript:;" class="easyui-linkbutton" onclick="paperUpdate(\''+row.ID+'\',\''+row.KSSJ+'\')">修改</a>&nbsp;|';
				str += '<a href="javascript:;" class="easyui-linkbutton" onclick="paperDelete(\''+row.ID+'\',\''+row.KSSJ+'\')">删除</a>&nbsp;';
			return str;
		}
		
		//详情
		function paperQuery(id){
			$('#paperQuery').window('open');
			
			var uls = "<%=basePath %>examRoom/queryByidkscc?id="+id;
			uls = uls;
			$.ajax({
				type : "post",
				url : uls,
				dataType : "text",
				async : false,
				success : function(dataInfo) {
					//格式化
					var data = $.parseJSON(dataInfo);
					$("#paperQuery #CC_NAME").html(data.CC_NAME);
					$("#paperQuery #ZZJG_ID").html(data.ZZJGNAME);
					$("#paperQuery #GZ_ID").html(data.GZNAME);
					$("#paperQuery #KSSC").html(data.KSSC);
					$("#paperQuery #SFTYSJ").html(data.SFT);
					$("#paperQuery #KSKSSJ").html( data.KSKSSJ);
					$("#paperQuery #KSJSSJ").html(data.KSJSSJ);
					$("#paperQuery #BZ").html(data.BZ);
				}
			});
			
		}
		//新增
		function paperAdd(){
			$('#paperAdd').window('open');
			$('#paperAdd').form('clear');//刷新表单
			$('#paperAddInfo #SFTYSJ').combobox({ 
                editable:false  //是否可编辑
            });
			//组织机构
			$('#paperAddInfo #ZZJG_ID').combobox({
                url: '<%=basePath %>SystemsManagement/allzzjgname',
                editable: false, //不可编辑状态
                valueField: 'id',
                textField: 'zzjg_name',
               	loadFilter:function(data){
                   	var obj = {};  
                       obj.id = '';  
                      	obj.zzjg_name = '---请选择---';
                       data.splice(0,0,obj);
                       return data;
                 }
            });
			$("#paperAddInfo #ZZJG_ID").combobox('setValue', ZZJG_ID);
			//工种
			$('#paperAddInfo #GZ_ID').combobox({
                url: '<%=basePath %>SystemsManagement/Listsjcdz?fid=b8bacf2523357652843',
                editable: false, //不可编辑状态
                valueField: 'id',
                textField: 'zd_name',
                loadFilter:function(data){
                   	var obj = {};  
                       obj.id = '';  
                      	obj.zd_name = '---请选择---';
                       data.splice(0,0,obj);
                       return data;
                 }
            });
		}
		//修改
		function paperUpdate(id,kssj){
			var ks = kssj.split("~")[0];
			var js = kssj.split("~")[1];
			var dd = getNowFormatDate();
			if(ks < dd && dd < js){
				$.messager.alert('提示','正在考试中的场次不可以修改！');
				return ;
			}
			
			$('#paperUpdate').window('open');
			$('#paperUpdateInfo #SFTYSJ').combobox({ 
                editable:false  //是否可编辑
            });
			//组织机构
			$('#paperUpdateInfo #ZZJG_ID').combobox({
                url: '<%=basePath %>SystemsManagement/allzzjgname',
                editable: false, //不可编辑状态
                valueField: 'id',
                textField: 'zzjg_name',
                loadFilter:function(data){
                   	var obj = {};  
                       obj.id = '';  
                      	obj.zzjg_name = '---请选择---';
                       data.splice(0,0,obj);
                       return data;
                 }
            });
			//$("#paperUpdateInfo #ZZJG_ID").combobox('setValue', ZZJG_ID);
			//工种
			$('#paperUpdateInfo #GZ_ID').combobox({
                url: '<%=basePath %>SystemsManagement/Listsjcdz?fid=b8bacf2523357652843',
                editable: false, //不可编辑状态
                valueField: 'id',
                textField: 'zd_name',
               	loadFilter:function(data){
                      	var obj = {};  
                          obj.id = '';  
                          obj.zd_name = '---请选择---';
                          data.splice(0,0,obj);
                          return data;
                    }
            });
			getQueryByIdInfo(id);
		}
		//删除
		function paperDelete(id,kssj){
			var ks = kssj.split("~")[0];
			var js = kssj.split("~")[1];
			var dd = getNowFormatDate();
			if(ks < dd && dd < js){
				$.messager.alert('提示','正在考试中的场次不可以删除！');
				return ;
			}
			
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){ 
				if (r){
					var uls = "<%=basePath %>examRoom/deletekscc?id="+id;
					$.ajax({
						type : "post",
						url : uls,
						success : function(data) {
							if(data == '1'){
								paperListInfo();
								$.messager.alert('提示','删除成功！');
							}else{
								$.messager.alert('提示','删除失败！');
							}
						}
					});
				}    
			});
			paperListInfo()
		}
		//修改提交
		function paperUpdateInfoSubmit(){
			if(!getdataInfo("考试开始时间",$("#paperUpdateInfo #KSKSSJ").datetimebox("getValue"))){
				return ;
			}
			if(!getdataInfo("考试结束时间",$("#paperUpdateInfo #KSJSSJ").datetimebox("getValue"))){
				return ;
			}
			if(!getdataInfo("考试模式",$("#paperUpdateInfo #SFTYSJ").combobox("getValue"))){
				return ;
			}
			var record = $("#paperUpdateInfo #SFTYSJ").combobox("getValue");
			var kssj = $("#paperUpdateInfo #KSKSSJ").datetimebox("getValue");
			var jssj = $("#paperUpdateInfo #KSJSSJ").datetimebox("getValue");
			if(record == '1'){
				$("#paperUpdateInfo #KSSC").textbox('setValue', "");
				$('#paperUpdateInfo #KSSC').textbox('textbox').attr('readonly',true); 
				if(kssj != "" && jssj != ""){
					$("#paperUpdateInfo #KSSC").textbox('setValue', GetDateDiff(kssj,jssj,"minute"));
				}
				var str = $("#paperUpdateInfo #KSSC").textbox("getValue");
				if(str <= 0){
					$.messager.alert('提示','考试开始时间应早于考试结束时间！');
					return ;
				}
			}else if(record == '2'){
				//$("#paperUpdateInfo #KSSC").textbox('setValue', "");
				$('#paperUpdateInfo #KSSC').textbox('textbox').attr('readonly',false); 
				var sf=GetDateDiff(kssj,jssj,"minute");
				if(sf<=0){
					$.messager.alert('提示','考试开始时间应早于考试结束时间！');
					return ;
				}
				
			}
			if(!getdataInfo("考试场次",$("#paperUpdateInfo #CC_NAME").textbox("getValue"))){
				return ;
			}
			if(!getdataInfo("机构名称",$("#paperUpdateInfo #ZZJG_ID").combobox("getValue"))){
				return ;
			}
			if(!getdataInfo("工种",$("#paperUpdateInfo #GZ_ID").combobox("getValue"))){
				return ;
			}
		
			if(!getdataNumber("考试时长",$("#paperUpdateInfo #KSSC").textbox("getValue"))){
				return ;
			}
			
			var info = "";
			var uls = "<%=basePath %>examRoom/updatekscc?1=1";
			var params= $("#paperUpdateInfo").serializeArray();
			$.each(params, function(i, param){
				info += "&"+param.name+"="+encodeURIComponent(encodeURIComponent(param.value));
			});
			uls = uls + info;
			$.ajax({
				type : "post",
				url : uls,
				success : function(data) {
					if(data == '1'){
						paperListInfo();
						$.messager.alert('提示','修改成功！');
					}else{
						$.messager.alert('提示','修改失败！');
					}
				}
			});
			paperListInfo();
			$('#paperUpdate').window('close');
		}
		//添加提交
		function paperInfoSubmit(){
			if(!getdataInfo("考试开始时间",$("#paperAddInfo #KSKSSJ").datetimebox("getValue"))){
				return ;
			}
			if(!getdataInfo("考试结束时间",$("#paperAddInfo #KSJSSJ").datetimebox("getValue"))){
				return ;
			}
			if(!getdataInfo("考试场次",$("#paperAddInfo #CC_NAME").textbox("getValue"))){
				return ;
			}
			if(!getdataInfo("机构名称",$("#paperAddInfo #ZZJG_ID").combobox("getValue"))){
				return ;
			}
			if(!getdataInfo("工种",$("#paperAddInfo #GZ_ID").combobox("getValue"))){
				return ;
			}
			if(!getdataInfo("考试模式",$("#paperAddInfo #SFTYSJ").combobox("getValue"))){
				return ;
			}
			var record = $("#paperAddInfo #SFTYSJ").combobox("getValue");
			var kssj = $("#paperAddInfo #KSKSSJ").datetimebox("getValue");
			var jssj = $("#paperAddInfo #KSJSSJ").datetimebox("getValue");
			if(record == '1'){
				$("#paperAddInfo #KSSC").textbox('setValue', "");
				$('#paperAddInfo #KSSC').textbox('textbox').attr('readonly',true); 
				if(kssj != "" && jssj != ""){
					$("#paperAddInfo #KSSC").textbox('setValue', GetDateDiff(kssj,jssj,"minute"));
				}
				var str = $("#paperAddInfo #KSSC").textbox("getValue");
				if(str <= 0){
					$.messager.alert('提示','考试开始时间应早于考试结束时间！');
					return ;
				}
			}else if(record == '2'){
				//$("#paperAddInfo #KSSC").textbox('setValue', "");
				$('#paperAddInfo #KSSC').textbox('textbox').attr('readonly',false); 
				var sf=GetDateDiff(kssj,jssj,"minute");
				if(sf<=0){
					$.messager.alert('提示','考试开始时间应早于考试结束时间！');
					return ;
				}
				
			}
			
			if(!getdataNumber("考试时长",$("#paperAddInfo #KSSC").textbox("getValue"))){
				return ;
			}
			var info = "";
			var uls = "<%=basePath %>examRoom/addkscc?1=1";
			var params= $("#paperAddInfo").serializeArray();
			$.each(params, function(i, param){
				info += "&"+param.name+"="+encodeURIComponent(encodeURIComponent(param.value));
			});
			uls = uls + info;
			$.ajax({
				type : "post",
				url : uls,
				success : function(data) {
					if(data == '1'){
						paperListInfo();
						$.messager.alert('提示','添加成功！');
					}else{
						$.messager.alert('提示','添加失败！');
					}
				}
			});
			paperListInfo();
			$('#paperAdd').window('close');
		}
		//查询试题信息
		function getQueryByIdInfo(id){
			var uls = "<%=basePath %>examRoom/queryByidkscc?id="+id;
			uls = uls;
			$.ajax({
				type : "post",
				url : uls,
				dataType : "text",
				async : false,
				success : function(dataInfo) {
					//格式化
					var data = $.parseJSON(dataInfo);
					$("#paperUpdateInfo #CC_NAME").textbox('setValue', data.CC_NAME);
					$("#paperUpdateInfo #ZZJG_ID").combobox('setValue', data.ZZJG_ID);
					$("#paperUpdateInfo #GZ_ID").combobox('setValue', data.GZ_ID);
					$("#paperUpdateInfo #KSSC").textbox('setValue', data.KSSC);
					$("#paperUpdateInfo #SFTYSJ").combobox('setValue', data.SFTYSJ);
					$("#paperUpdateInfo #KSKSSJ").datetimebox('setValue', data.KSKSSJ);
					$("#paperUpdateInfo #KSJSSJ").datetimebox('setValue', data.KSJSSJ);
					$("#paperUpdateInfo #BZ").textbox('setValue', data.BZ);
					$("#paperUpdateInfo #ID").val(data.ID);
				}
			});
			paperListInfo();
		}
	</script>
	<!--时间控件-->
	<script type="text/javascript">
		function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
	</script>
	<!-- 新增 -->
	<div id="paperAdd" class="easyui-window" minimizable = "false" title="新增考试场次" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:300px;padding:10px;">
		<form id = "paperAddInfo">
			<table width="100%" >
				<tr>
					<td align="right" width="20%"><samp style="color: red;">*</samp>考试场次：</td>
					<td colspan="3">
						<input class="easyui-textbox" style="width:90%;" id = "CC_NAME" name = "CC_NAME">
					</td>
				</tr>
				<tr>
					<td align="right" width="20%"><samp style="color: red;">*</samp>机构名称：</td>
					<td width="30%">
						<select class="easyui-combobox" style="width:150px;" id="ZZJG_ID" name="ZZJG_ID">   
						</select>
					</td>
					<td align="right" width="20%"><samp style="color: red;">*</samp>工种：</td>
					<td width="30%">
					<select class="easyui-combobox" style="width:150px;" id = "GZ_ID" name = "GZ_ID">   
					</select>
					</td>
				</tr>
				<tr>
					<td align="right"><samp style="color: red;">*</samp>考试开始时间：</td>
					<td>
						<input class="easyui-datetimebox" style="width:150px" id = "KSKSSJ" name = "KSKSSJ">
					</td>
					<td align="right"><samp style="color: red;">*</samp>考试结束时间：</td>
					<td>
						<input class="easyui-datetimebox" style="width:150px" id = "KSJSSJ" name = "KSJSSJ">
					</td>
				</tr>
				<tr>
					<td align="right" width="20%"><samp style="color: red;">*</samp>考试模式：</td>
					<td width="30%">
					<select class="easyui-combobox" style="width:150px;" id = "SFTYSJ" name = "SFTYSJ">   
						<option value = "">---请选择---</option>
						<option value = "1">统一</option>
						<option value = "2">不统一</option>
					</select>
					</td>
					<td align="right" width="150px"><samp style="color: red;">*</samp>考试时长：</td>
					<td>
					<input class="easyui-textbox" style="width:150px;" id = "KSSC" name = "KSSC">
					</td>
				</tr>
				
				<tr>
					<td align="right">备注：</td>
					<td colspan="3"><input class="easyui-textbox" style="width:90%;" id = "BZ" name = "BZ"></td>
				</tr>
				<tr>
					<td colspan="4"  align="center">
					<br />
					</td>
				</tr>
				<tr>
					<td colspan="4"  align="center">
					<a href="#" class="easyui-linkbutton" style="width:80px;" onclick="paperInfoSubmit()">提交</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 修改 -->
	<div id="paperUpdate" class="easyui-window" minimizable = "false" title="修改考试场次" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:300px;padding:10px;">
		<form id = "paperUpdateInfo">
			<table width="100%"  class="table-style-2" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right" width="20%"><samp style="color: red;">*</samp>考试场次：</td>
					<td colspan="3">
						<input class="easyui-textbox" style="width:90%;" id = "CC_NAME" name = "CC_NAME">
					</td>
				</tr>
				<tr>
					<td align="right" width="20%"><samp style="color: red;">*</samp>机构名称：</td>
					<td width="30%">
						<select class="easyui-combobox" style="width:150px;" id="ZZJG_ID" name="ZZJG_ID">   
						</select>
					</td>
					<td align="right" width="20%"><samp style="color: red;">*</samp>工种：</td>
					<td width="30%">
					<select class="easyui-combobox" style="width:150px;" id = "GZ_ID" name = "GZ_ID">   
					</select>
					</td>
				</tr>
				<tr>
					<td align="right"><samp style="color: red;">*</samp>考试开始时间：</td>
					<td>
						<input class="easyui-datetimebox" style="width:150px" id = "KSKSSJ" name = "KSKSSJ">
					</td>
					<td align="right"><samp style="color: red;">*</samp>考试结束时间：</td>
					<td>
						<input class="easyui-datetimebox" style="width:150px" id = "KSJSSJ" name = "KSJSSJ">
					</td>
				</tr>
				<tr>
					<td align="right" width="20%"><samp style="color: red;">*</samp>考试模式：</td>
					<td width="30%">
					<select class="easyui-combobox" style="width:150px;" id = "SFTYSJ" name = "SFTYSJ">   
						<option value = "">---请选择---</option>
						<option value = "1">统一</option>
						<option value = "2">不统一</option>
					</select>
					</td>
					<td align="right" width="150px"><samp style="color: red;">*</samp>考试时长：</td>
					<td>
					<input class="easyui-textbox" style="width:150px;" id = "KSSC" name = "KSSC">
					</td>
				</tr>
				
				<tr>
					<td align="right">备注：</td>
					<td colspan="3"><input class="easyui-textbox" style="width:90%;" id = "BZ" name = "BZ"></td>
				</tr>
				<tr>
					<td colspan="4"  align="center">
					<br />
					</td>
				</tr>
				<tr>
					<td colspan="4"  align="center">
					<a href="#" class="easyui-linkbutton" style="width:80px;" onclick="paperUpdateInfoSubmit()">提交</a>
					</td>
				</tr>
			</table>
			<input type = "hidden" id = "ID" name = "ID">
		</form>
	</div>	
	<!-- 详情 -->
	<div id="paperQuery" class="easyui-window" minimizable = "false" title="查看考试场次" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:300px;padding:10px;">
		<table width="100%"  class="table-style-1" cellspacing="0" cellpadding="0">
			<tr>
				<td align="right" width="20%">考试场次：</td>
				<td colspan="3" id = "CC_NAME">
				</td>
			</tr>
			<tr>
				<td align="right" width="20%">机构名称：</td>
				<td width="30%" id="ZZJG_ID">
				</td>
				<td align="right" width="20%">工种：</td>
				<td width="30%" id = "GZ_ID">
				</select>
				</td>
			</tr>
			<tr>
				<td align="right" width="150px">考试时长：</td>
				<td id = "KSSC">
				</td>
				<td align="right" width="20%">考试模式：</td>
				<td width="30%" id = "SFTYSJ">
				<!-- <select class="easyui-combobox" style="width:150px;" id = "SFTYSJ" name = "SFTYSJ">   
					<option value = "">---请选择---</option>
					<option value = "1">统一</option>
					<option value = "2">不统一</option>
				</select> -->
				</td>
			</tr>
			
			<tr>
				<td align="right">考试开始时间：</td>
				<td id = "KSKSSJ" name = "KSKSSJ">
d				</td>
				<td align="right">考试结束时间：</td>
				<td id = "KSJSSJ" name = "KSJSSJ">
				</td>
			</tr>
			<tr>
				<td align="right">备注：</td>
				<td colspan="3" id = "BZ" name = "BZ"></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>