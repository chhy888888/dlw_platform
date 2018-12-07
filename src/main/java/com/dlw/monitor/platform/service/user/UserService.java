package com.dlw.monitor.platform.service.user;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
	
	//查询用户
	HashMap<String,String> getUserInfo(HttpServletRequest request);
	//增加用户
	int addUderinfo(HttpServletRequest request);
	//查询用户状态
	HashMap<String,String> userStatus(HttpServletRequest request);
	//修改密码
	int updateUserPassword(HttpServletRequest request);
	//查询单个用户
	HashMap<String,String> QueryByIdUserInfo(HttpServletRequest request);
	
}
