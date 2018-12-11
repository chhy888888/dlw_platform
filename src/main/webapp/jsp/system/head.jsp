<div class="navbar navbar-inverse">
		  <div class="navbar-inner" style="background-color:#31a8e7;">
		   <div class="container-fluid">
			  <a class="brand"><small><img width="85" height="85" alt="CIDP Logo" src="static/images/logo.png"></small>出口融资运营管理平台</a>
 
			  
			  <ul class="nav  pull-right" >
					<li class="purple">
						<a href="javascript:void(0);" class="dropdown-toggle" id="tipsMessage" data-toggle="dropdown">
							<i class="icon-bell-alt icon-animated-bell icon-only"></i>
							<span class="badge badge-important">${infoMessage.allCount }</span>
						</a>
						<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-closer">
							<li class="nav-header">
								<i class="icon-warning-sign"></i> ${infoMessage.allCount } 通知计划
							</li>
						</ul>
					</li>
					 
					<li class="light-blue user-profile">
						<a class="user-menu dropdown-toggle" href="javascript:alert('预留功能,待开发');" data-toggle="dropdown">
							<img alt="FH" src="static/avatars/user.jpg" class="nav-user-photo" />
							<span id="user_info">
							</span>
							<i class="icon-caret-down"></i>
						</a>
						<ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<li><a onclick="editUserH();" style="cursor:pointer;"><i class="icon-user"></i> 修改资料</a></li>
							<li id="systemset"><a onclick="editSys();" style="cursor:pointer;"><i class="icon-cog"></i> 系统设置</a></li>
							<li id="productCode"><a onclick="productCode();" style="cursor:pointer;"><i class="icon-cogs"></i> 代码生成</a></li>
							<li class="divider"></li>
							<li><a href="manager/logout"><i class="icon-off"></i> 退出</a></li>
						</ul>
					</li>
					
			  </ul><!--/.ace-nav-->
		   </div><!--/.container-fluid-->
		  </div><!--/.navbar-inner-->
		</div><!--/.navbar-->
	
	
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/head.js"></script>
	<script type="text/javascript">
<!--
$(document).ready(function() {
			$("#tipsMessage").click();
		});
//-->
</script>
