package com.dlw.monitor.platform.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth0.jwt.internal.org.apache.commons.lang3.StringUtils;
import com.dlw.monitor.platform.mapper.primary.BaseMapper;
import com.dlw.monitor.platform.mypublicClass.RandomNumber;
import com.dlw.monitor.platform.mypublicClass.passwordEncryption;
import com.dlw.monitor.platform.service.user.UserService;
/**
 * 用户表
 * @author user
 *
 */
@Service(value = "UserService")
public class UserServiceImpl implements UserService {
	@Autowired
    private BaseMapper baseMapper;
	
	public RandomNumber ra  = new RandomNumber();
	//修改信息
	HashMap<String,String> mapupdata = new HashMap<String,String>();
	//条件信息
	HashMap<String,String> mapwhere = new HashMap<String,String>();
	
	
	/**
	 * 查询用户信息
	 */
	
	public HashMap<String, String> getUserInfo(HttpServletRequest request) {
		String username = request.getParameter("cul_account");
		String password = request.getParameter("cul_password");
		password = new passwordEncryption().getPasswordKey(password);
		String sql = "select t.*,q.* from customer_login t left JOIN  enterprise q on q.ent_customerid = t.cul_id where 1=1 and t.cul_account = '"+username+"' and t.cul_password = '"+password+"'";
		List list = baseMapper.selectAllByPage(sql);
		if(list.size() > 0 ){
			HashMap<String,String> mapUserInfo = baseMapper.selectAllByPage(sql).get(0);
			HttpSession session = request.getSession();
	    	session.setAttribute("userMap", mapUserInfo);
			return mapUserInfo;
		}
		return null;
	}
	/**
	 * 增加用户
	 */
	
	public int addUderinfo(HttpServletRequest request) {
		String tabname = "customer_login";
		HashMap<String,String> mapUserinfo = ra.getRequestInfo(request);
		String sql = ra.getaddInfo_pkID_sql(tabname, mapUserinfo);
		return Integer.valueOf(baseMapper.insert(sql));
	}
	/**
	 * 修改用户
	 */
	
	public int updateUserPassword(HttpServletRequest request) {
		String tabname = "customer_login";
		mapupdata.put("PASSWORD", request.getParameter("password"));
		mapwhere.put("USER_ID", request.getParameter("user_id"));
		String sql = ra.get_update_info(tabname, mapupdata, mapwhere);
		return Integer.valueOf(baseMapper.update(sql));
	}
	/**
	 * 通过主键查询用户信息
	 */
	
	public HashMap<String, String> QueryByIdUserInfo(HttpServletRequest request) {
		String tabname = "customer_login";
		String sql = ra.getSelectInfo(tabname, ra.getRequestInfo(request));
		HashMap<String,String> map = baseMapper.selectAllByPage(sql).get(0);
		if(map != null){
			return map;
		}else{
			return null;
		}
	}
	
	public HashMap<String,String> userStatus(HttpServletRequest request) {
		Map<String,String> mapUser = (Map) request.getSession().getAttribute("userMap");
		if(null != mapUser && !mapUser.isEmpty()){
			String cu_id = String.valueOf(mapUser.get("cul_id"));
			String sql = "select t.*,q.* from customer_login t left JOIN  enterprise q on q.ent_customerid = t.cul_id where 1=1 and t.cul_id = '"+cu_id+"'";
			List<HashMap<String,String>> listMap = baseMapper.selectAllByPage(sql);
			if(listMap.size() > 0 ){
				HashMap<String,String> mapUserInfo = listMap.get(0);
				return mapUserInfo;
			}
		}
		/*String cul_id = request.getParameter("cul_id");
		if(!"null".equals(cul_id) && !StringUtils.isEmpty(cul_id)){
			String tabsql = "select status from customer_login t where t.cul_id='"+cul_id+"'";
			List<HashMap<String,String>> maps = baseMapper.selectAllByPage(tabsql);
			HashMap<String,String> map = null;
			if(null != maps && !maps.isEmpty()){
				map = maps.get(0);
				return map;
			}else{
				return null;
			}
		}*/
		return null;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
