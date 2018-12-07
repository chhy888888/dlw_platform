package com.dlw.monitor.platform.service.system;

import java.util.HashMap;
import java.util.List;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface SystemService {
	
	//查询数据库词典
	List getTypeInfo(HashMap<String,String> map);
	//查询数据库词典
	List getTypeInfo(HttpServletRequest request);
	//查询下级节点
	List getTypeInfoSubnode(HttpServletRequest request);
	//用户名查重
	int UserNameRepeat(HttpServletRequest request);
	//发送验证码
	String gettoEmilYzm(HttpServletRequest request);
	//修改用户信息
	HashMap<String,String> updateUserInfo(HttpServletRequest request);
	//修改用户密码
	int updateUserPSW(HttpServletRequest request);
	//添加用户
	int AddUserInfo(HttpServletRequest request);
	//查询合同重点
	List ContractInfo(HttpServletRequest request);
	
	
	
}
