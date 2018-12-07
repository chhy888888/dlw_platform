package com.dlw.monitor.platform.utils;

import org.springframework.context.ApplicationContext;


/**
 * 项目名称： 创建人：GZ
 * 
 */
public class Const {
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	public static final String SESSION_USER = "sessionUser";
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	public static final String SESSION_menuList = "menuList"; // 当前菜单
	public static final String SESSION_allmenuList = "allmenuList"; // 全部菜单
	public static final String SESSION_QX = "QX";
	public static final String SESSION_userpds = "userpds"; 
	public static final String SESSION_USERROL = "USERROL"; // 用户对象
	public static final String SESSION_USERNAME = "USERNAME"; // 用户名
	public static final String TRUE = "T";
	public static final String FALSE = "F";
	public static final String LOGIN = "/manager/login_toLogin.do"; // 登录地址
	public static final String AREA = "/system/getSystemDictionaries"; // 登录地址
	public static final String AREAINFO = "/system/getSystemDictionariesSubnode"; // 登录地址
	public static final String SYSNAME = "admin/config/SYSNAME.txt"; // 系统名称路径
	public static final String PAGE = "admin/config/PAGE.txt"; // 分页条数配置路径
	public static final String EMAIL = "admin/config/EMAIL.txt"; // 邮箱服务器配置路径
	public static final String SMS1 = "admin/config/SMS1.txt"; // 短信账户配置路径1
	public static final String SMS2 = "admin/config/SMS2.txt"; // 短信账户配置路径2
	public static final String NO_INTERCEPTOR_PATH = ".*/((html)|(index.html)|(static)|(favicon.ico)|(web)|(m)|(web2)|(plugins)|(index)|(login)|(logout)|(phoneCode)|(code)|(app)|(weixin)|(static)|(main)|(websocket)).*"; // 不对匹配该值的访问路径拦截（正则）
	public static final String SYSTEM_PATH = ".*/((manager)).*"; // 匹配该值的访问路径拦截（正则）

	public static ApplicationContext WEB_APP_CONTEXT = null; // 该值会在web容器启动时由WebAppContextListener初始化


	/**
	 * APP Constants
	 */
	// app注册接口_请求协议参数)
	public static final String[] APP_REGISTERED_PARAM_ARRAY = new String[] {
			"countries", "uname", "passwd", "title", "full_name",
			"company_name", "countries_code", "area_code", "telephone",
			"mobile" };
	public static final String[] APP_REGISTERED_VALUE_ARRAY = new String[] {
			"国籍", "邮箱帐号", "密码", "称谓", "名称", "公司名称", "国家编号", "区号", "电话", "手机号" };

	// app根据用户名获取会员信息接口_请求协议中的参数
	public static final String[] APP_GETAPPUSER_PARAM_ARRAY = new String[] { "USERNAME" };
	public static final String[] APP_GETAPPUSER_VALUE_ARRAY = new String[] { "用户名" };

	public static long lastCalc = 1l;
	public static final long PERIOD_DAY = 24 * 60 * 60 * 1000;  

}
