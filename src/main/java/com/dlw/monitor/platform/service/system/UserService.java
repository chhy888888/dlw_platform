package com.dlw.monitor.platform.service.system;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.dlw.monitor.platform.model.system.User;



@Service("userService")
public interface UserService {

	/*
	* 通过id获取数据
	*/
	HashMap<String, String> findByUiId(HttpServletRequest request);
	/*
	* 通过loginname获取数据
	*/
	HashMap<String, String> findByUId(Map map);
	
	/*
	* 通过邮箱获取数据
	*/
	HashMap<String, String> findByUE(HttpServletRequest request);
	
	/*
	* 通过编号获取数据
	*/
	HashMap<String, String> findByUN(HttpServletRequest request);
	
	/*
	* 保存用户
	*/
	String saveU(HashMap<String,String> map);
	/*
	* 修改用户
	*/
	String editU(HashMap<String,String> map);
	/*
	* 换皮肤
	*/
	String setSKIN(HttpServletRequest request);
	/*
	* 删除用户
	*/
	String deleteU(HttpServletRequest request);
	/*
	*用户列表(用户组)
	*/
	Map listPdPageUser(int pageNum, int pageSize,Map map);
	
	/*
	*用户列表(全部)
	*/
	Map listAllUser(int pageNum, int pageSize,Map map);
	
	/*
	* 保存用户IP
	*/
	String saveIP(HttpServletRequest request);
	
	/*
	* 登录判断
	*/
	HashMap<String, String> getUserByNameAndPwd(HttpServletRequest request);
	/*
	* 跟新登录时间
	*/
	String updateLastLogin(String USER_ID);
	
	/*
	*通过id获取数据
	*/
	User getUserAndRoleById(String USER_ID) ;

	Map selectAllEntities(int pageNum, int pageSize, String sql,
			Map map);
	
}
