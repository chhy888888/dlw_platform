<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title> </title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/default.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/icon.css" />
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
	<script type="text/javascript" src='<%=basePath %>js/outlook2.js'> </script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.easyui.min.js"></script>
	


    <script type="text/javascript">
	 var _menus = {};
	 var cul_type = "${mapUserInfo.cul_type}";
     if(cul_type == 1){
    	 _menus = {"menus":[
							{"menuid":"1","icon":"icon-sys","menuname":"系统管理",
								"menus":[{"menuname":"我的发布","icon":"icon-nav","url":"<%=basePath %>exportfactoring/wdfb"},
										{"menuname":"确权","icon":"icon-nav","url":"<%=basePath %>exportfactoring/mfqq"},
										{"menuname":"付款","icon":"icon-nav","url":"<%=basePath %>exportfactoring/fklist"},
										{"menuname":"我的设置","icon":"icon-nav","url":"<%=basePath %>exportfactoring/facility"}
									]
							}
					]};
     }else if(cul_type == 2){
    	 _menus = {"menus":[
							{"menuid":"1","icon":"icon-sys","menuname":"系统管理",
								"menus":[{"menuname":"融资需求","icon":"icon-nav","url":""},
								        {"menuname":"我的收藏","icon":"icon-nav","url":""},
										{"menuname":"融资状态","icon":"icon-nav","url":""},
										{"menuname":"审核签约","icon":"icon-nav","url":""},
										{"menuname":"我的设置","icon":"icon-nav","url":""}
									]
							}
					]};
     }else if(cul_type == 3){
    	 _menus = {"menus":[
  							{"menuid":"1","icon":"icon-sys","menuname":"系统管理",
								"menus":[{"menuname":"融资需求","icon":"icon-nav","url":""},
								        {"menuname":"我的收藏","icon":"icon-nav","url":""},
										{"menuname":"融资状态","icon":"icon-nav","url":""},
										{"menuname":"审核签约","icon":"icon-nav","url":""},
										{"menuname":"我的设置","icon":"icon-nav","url":""}
									]
							}
					]};
     }else if(cul_type == 4){
    	 _menus = {"menus":[
  							{"menuid":"1","icon":"icon-sys","menuname":"系统管理",
								"menus":[{"menuname":"融资需求","icon":"icon-nav","url":""},
								        {"menuname":"我的收藏","icon":"icon-nav","url":""},
										{"menuname":"融资状态","icon":"icon-nav","url":""},
										{"menuname":"审核签约","icon":"icon-nav","url":""},
										{"menuname":"我的设置","icon":"icon-nav","url":""}
									]
							}
					]};
     }else if(cul_type == 5){
    	 _menus = {"menus":[
							{"menuid":"1","icon":"icon-sys","menuname":"系统管理",
								"menus":[{"menuname":"账号审核","icon":"icon-nav","url":""},
								        {"menuname":"融资需求审核","icon":"icon-nav","url":""},
										{"menuname":"付款确认","icon":"icon-nav","url":""},
										{"menuname":"货代管理","icon":"icon-nav","url":""},
										{"menuname":"我的设置","icon":"icon-nav","url":""}
									]
							}
					]};
     }
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function close() {
            $('#w').window('close');
        }

        

        //修改密码
      /*   function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            })
            
        } */

        $(function() {

            /* openPwd();
            //
            $('#editpass').click(function() {
                $('#w').window('open');
            }); */

          /*   $('#btnEp').click(function() {
                serverLogin();
            }) */
		   var glName = "";
           var cul_type = "${mapUserInfo.cul_type}";
           if(cul_type == 1){
        	   glName = "卖家管理端";
           }else if(cul_type == 2){
        	   glName = "保理公司端";
           }else if(cul_type == 3){
        	   glName = "银行端";
           }else if(cul_type == 4){
        	   glName = "其他金融企业端";
           }else if(cul_type == 5){
        	   glName = "管理端";
           }
           $(".userName").html("${mapUserInfo.cul_name_cn}");
           $(".glName").html(glName);
			
            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = '/exportfactoring/login';
                    }
                });

            })
        });
    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
    <div region="north" border="false" style="overflow: hidden; height: 40px;
        background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 40px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 <span class="userName"></span> <a href="#" id="editpass">个人信息</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 20px; "><img src="<%=basePath %>images/blocks.gif" width="20" height="20" align="absmiddle" /> OOWAY <span style="padding-left:10px; font-size: 20px; " class="glName"></span> </span>
    </div>
    <div region="south" style="height: 30px; background: #D2E0F2; ">
        <div class="footer"></div>
    </div>
    <div region="west"  split="true"  title="导航菜单" style="width:180px;" id="west">
<div class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
				
			</div>

    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
		</div>
    </div>
    
    
    <!--修改密码窗口-->
   <!--  <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)"
                        onclick="closeLogin()">取消</a>
            </div>
        </div>
    </div> -->

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>


</body>
</html>