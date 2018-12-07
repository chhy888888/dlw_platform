package com.dlw.monitor.platform.service.system.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlw.monitor.platform.mapper.primary.BaseMapper;
import com.dlw.monitor.platform.model.system.Role;
import com.dlw.monitor.platform.model.system.User;
import com.dlw.monitor.platform.mypublicClass.RandomNumber;
import com.dlw.monitor.platform.service.system.UserService;
import com.dlw.monitor.platform.utils.DateUtil;
import com.dlw.monitor.platform.utils.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
    private BaseMapper baseMapper;
	
	public RandomNumber ra = new RandomNumber();	//工具类
	//修改信息
	HashMap<String,String> mapupdata = new HashMap<String,String>();
	//条件信息
	HashMap<String,String> mapwhere = new HashMap<String,String>();
	
	//======================================================================================
	
	/*
	* 通过id获取数据
	*/
	public HashMap<String,String> findByUiId(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		sb.append(" select USER_ID,USERNAME,PASSWORD,NAME,RIGHTS,ROLE_ID,LAST_LOGIN,IP,STATUS,BZ,SKIN,EMAIL,NUMBER,PHONE from sys_user ");
		Map<String,String> mapwhere = ra.getRequestInfo(request);
		sb.append(" where isdel=0 and USER_ID = '" + mapwhere.get("USER_ID") + "'");
		return baseMapper.selectAllByPage(sb.toString()).get(0);
	}
	/*
	* 通过loginname获取数据
	*/
	
	public HashMap<String,String> findByUId(Map map){
		StringBuffer sb = new StringBuffer();
		sb.append(" select USER_ID,USERNAME,PASSWORD,NAME,RIGHTS,ROLE_ID,LAST_LOGIN,IP,STATUS,BZ,SKIN,EMAIL,NUMBER,PHONE from sys_user ");
		sb.append(" where isdel=0 and USERNAME = '" + map.get("USERNAME") + "'");
		List<HashMap<String,String>> list = baseMapper.selectAllByPage(sb.toString());
		return (list == null || list.size() == 0)?null:list.get(0);
	}
	
	/*
	* 通过邮箱获取数据
	*/
	
	public HashMap<String,String> findByUE(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		sb.append(" select USER_ID,USERNAME,PASSWORD,NAME,RIGHTS,ROLE_ID,LAST_LOGIN,IP,STATUS,BZ,SKIN,EMAIL,NUMBER,PHONE from sys_user ");
		mapwhere = ra.getRequestInfo(request);
		sb.append(" where isdel=0 and EMAIL = '" + mapwhere.get("EMAIL") + "'");
		if (mapwhere.get("USERNAME") != null && !mapwhere.get("USERNAME").toString().equals(""))
		{
			sb.append(" and USERNAME='" + mapwhere.get("USERNAME") + "'");
		}
		List<HashMap<String,String>> list = baseMapper.selectAllByPage(sb.toString());
		return (list == null || list.size() == 0)?null:list.get(0);
	}
	
	/*
	* 通过编号获取数据
	*/
	
	public HashMap<String,String> findByUN(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		sb.append(" select USER_ID,USERNAME,PASSWORD,NAME,RIGHTS,ROLE_ID,LAST_LOGIN,IP,STATUS,BZ,SKIN,EMAIL,NUMBER,PHONE from sys_user ");
		Map<String,String> mapwhere = ra.getRequestInfo(request);
		sb.append(" where isdel=0 and NUMBER = '" + mapwhere.get("NUMBER") + "'");
		if (mapwhere.get("USERNAME") != null && !mapwhere.get("USERNAME").toString().equals(""))
		{
			sb.append(" and USERNAME='" + mapwhere.get("USERNAME") + "'");
		}
		
		List<HashMap<String,String>> list = baseMapper.selectAllByPage(sb.toString());
		return (list == null || list.size() == 0)?null:list.get(0);
	}
	
	/*
	* 保存用户
	*/
	
	public String saveU(HashMap<String,String> map){
		String tabname = "sys_user";
		map.remove("chkpwd");
		map.put("USER_ID", UuidUtil.get32UUID());
		String sql = ra.getaddInfo_pkID_sql(tabname, map);
		return baseMapper.insert(sql).toString();
	}
	/*
	* 修改用户
	*/
	
	public String editU(HashMap<String,String> map){
		String tabname = "sys_user";
		mapwhere.put("USER_ID", map.get("USER_ID"));
		if(map.get("PASSWORD") == null || "".equals(map.get("PASSWORD"))){
			map.remove("PASSWORD");
		}
		map.remove("chkpwd");
		map.remove("USER_ID");
		String sql = ra.get_update_info(tabname, map, mapwhere);
		return baseMapper.update(sql).toString();
	}
	/*
	* 换皮肤
	*/
	
	public String setSKIN(HttpServletRequest request){
		String tabnema = "sys_user";
		HashMap<String,String> map = ra.getRequestInfo(request);
		mapwhere.put("USERNAME", (String)request.getSession().getAttribute("USERNAME"));
		String sql = ra.get_update_info(tabnema, map, mapwhere);
		return baseMapper.update(sql).toString();
	}
	/*
	* 删除用户
	*/
	
	public String deleteU(HttpServletRequest request){
		String tabnema = "sys_user";
		HashMap<String,String> map = ra.getRequestInfo(request);
		mapwhere = new HashMap<String,String>();
		mapwhere.put("USER_ID", map.get("USER_ID"));
		map = new HashMap();
		map.put("isdel", "1");
		String sql = ra.get_update_info(tabnema, map, mapwhere);
		return baseMapper.update(sql).toString();
	}
	/*
	*用户列表(用户组)
	*/
	
	public Map listPdPageUser(int pageNum, int pageSize,Map map){
		StringBuffer sb = new StringBuffer();
		sb.append("select  u.USER_ID,u.USERNAME,u.PASSWORD,u.LAST_LOGIN,u.NAME,u.IP,u.EMAIL,u.NUMBER,u.PHONE,r.ROLE_ID,r.ROLE_NAME from sys_user u, sys_role r where u.isdel=0 and u.ROLE_ID = r.ROLE_ID  and u.USERNAME != 'admin' and (r.ROLE_ID != '7' and r.PARENT_ID != '7') ");
		Set<String> setwhere = map.keySet();
		for(String whereinfo : setwhere){
			if (whereinfo.equals("USERNAME") && !map.get(whereinfo).equals(""))
			{
				sb.append(" AND (");
				sb.append("u.USERNAME");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"'");
				sb.append(" OR ");
				sb.append("u.EMAIL");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"'");
				sb.append(" OR ");
				sb.append("u.NUMBER");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"'");
				sb.append(" OR ");
				sb.append("u.NAME");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"'");
				sb.append(" OR ");
				sb.append("u.PHONE");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"')");
			}else if (whereinfo.equals("lastLoginStart") && !map.get(whereinfo).equals("")){
				sb.append(" AND ");
				sb.append("LAST_LOGIN");
				sb.append(" >= ");
				sb.append("'"+map.get(whereinfo)+"'");
			}else if (whereinfo.equals("lastLoginEnd") && !map.get(whereinfo).equals("")){
				sb.append(" AND ");
				sb.append("LAST_LOGIN");
				sb.append(" <= ");
				sb.append("'"+map.get(whereinfo)+"'");
			}else if (whereinfo.equals("ROLE_ID") && !map.get(whereinfo).equals("")){
				sb.append(" AND ");
				sb.append("u.ROLE_ID");
				sb.append(" <= ");
				sb.append("'"+map.get(whereinfo)+"'");
			}
		}
		Map mapreturn = this.selectAllEntities(pageNum, pageSize, sb.toString(), map);
		return mapreturn;
	}
	
	/*
	*用户列表(全部)
	*/
	
	public Map listAllUser(int pageNum, int pageSize,Map map){
		StringBuffer sb = new StringBuffer();
		sb.append("select  u.USER_ID,u.USERNAME,u.PASSWORD,u.LAST_LOGIN,u.NAME,u.IP,u.EMAIL,u.NUMBER,u.PHONE,r.ROLE_ID,r.ROLE_NAME from sys_user u, sys_role r where u.isdel=0 and u.ROLE_ID = r.ROLE_ID and u.USERNAME != 'admin' and (r.ROLE_ID != '7' and r.PARENT_ID != '7') ");
		Set<String> setwhere = map.keySet();
		for(String whereinfo : setwhere){
			if (whereinfo.equals("USERNAME") && !map.get(whereinfo).equals(""))
			{
				sb.append(" AND (");
				sb.append("u.USERNAME");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"'");
				sb.append(" OR ");
				sb.append("u.EMAIL");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"'");
				sb.append(" OR ");
				sb.append("u.NUMBER");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"'");
				sb.append(" OR ");
				sb.append("u.NAME");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"'");
				sb.append(" OR ");
				sb.append("u.PHONE");
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"')");
			}else{
				sb.append(" AND ");
				sb.append(whereinfo);
				sb.append(" = ");
				sb.append("'"+map.get(whereinfo)+"'");
			}
		}
		Map mapreturn = this.selectAllEntities(pageNum, pageSize, sb.toString(), map);
		return mapreturn;
	}
	
	/*
	* 保存用户IP
	*/
	
	public String saveIP(HttpServletRequest request){
		String tabnema = "sys_user";
		HashMap<String,String> map = new HashMap();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		map.put("IP", ip);
		mapwhere.put("USERNAME", request.getSession().getAttribute("USERNAME").toString());
		String sql = ra.get_update_info(tabnema, map, mapwhere);
		return baseMapper.update(sql).toString();
	}
	
	/*
	* 登录判断
	*/
	
	public HashMap<String,String> getUserByNameAndPwd(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		sb.append(" select USER_ID,USERNAME,PASSWORD,NAME,RIGHTS,ROLE_ID,LAST_LOGIN,IP,STATUS,BZ,SKIN,EMAIL,NUMBER,PHONE from sys_user ");
		Map<String,String> mapwhere = ra.getRequestInfo(request);
		sb.append(" where isdel=0");
		if (mapwhere.get("USERNAME") != null && !mapwhere.get("USERNAME").toString().equals("") && mapwhere.get("PASSWORD") != null && !mapwhere.get("PASSWORD").toString().equals(""))
		{
			sb.append(" AND (");
			sb.append("(USERNAME = '" + mapwhere.get("USERNAME") + "' and PASSWORD = MD5('" + mapwhere.get("PASSWORD") + "'))");
			sb.append(" OR ");
			sb.append("(USERNAME = '" + mapwhere.get("USERNAME") + "' and PASSWORD = MD5('" + mapwhere.get("PASSWORD") + "'))");
			sb.append(" OR ");
			sb.append("(USERNAME = '" + mapwhere.get("USERNAME") + "' and PASSWORD = MD5('" + mapwhere.get("PASSWORD") + "'))");
		}
		return baseMapper.selectAllByPage(sb.toString()).get(0);
	}
	/*
	* 跟新登录时间
	*/
	
	public String updateLastLogin(String USER_ID){
		String tabnema = "sys_user";
		HashMap<String,String> map = new HashMap();
		map.put("LAST_LOGIN", DateUtil.getTime().toString());
		mapwhere.put("USER_ID", USER_ID);
		String sql = ra.get_update_info(tabnema, map, mapwhere);
		return baseMapper.update(sql).toString();
	}
	
	/*
	*通过id获取数据
	*/
	
	public User getUserAndRoleById(String USER_ID)  {
		StringBuffer sb = new StringBuffer();
		sb.append("select  u.USER_ID,u.USERNAME,u.NAME,u.RIGHTS as USER_RIGHTS,u.PASSWORD,u.SKIN,r.ROLE_ID,r.ROLE_NAME,r.RIGHTS as ROLE_RIGHTS from sys_user u left join sys_role r on u.ROLE_ID=r.ROLE_ID where u.STATUS=0 and u.USER_ID='" + USER_ID + "'");
		Map userMap =  baseMapper.selectAllByPage(sb.toString()).get(0);
		User user = new User();
		Role role = new Role();
		user.setUSER_ID(userMap.get("USER_ID").toString());
		user.setUSERNAME(userMap.get("USERNAME").toString());
		user.setNAME(userMap.get("NAME").toString());
		user.setRIGHTS(userMap.get("USER_RIGHTS").toString());
		user.setPASSWORD(userMap.get("PASSWORD").toString());
		user.setSKIN(userMap.get("SKIN").toString());	
		role.setROLE_ID(userMap.get("ROLE_ID").toString());
		role.setROLE_NAME(userMap.get("ROLE_NAME").toString());
		role.setRIGHTS(userMap.get("ROLE_RIGHTS").toString());
		user.setRole(role);
		return user;
		
	}
	
	
	public Map selectAllEntities(int pageNum, int pageSize, String sql,Map map) {
		//将参数传给这个方法就可以实现物理分页了，非常简单。
		try {
			if(null != map){
				String page = String.valueOf(map.get("page"));
				String rows = String.valueOf(map.get("rows"));
				//前台传当前页，没则是初始值，否则给实际值
				if(map.get("page") != null && !StringUtil.isEmpty(page) && "" != page){
					pageNum = Integer.valueOf(page);
				}
				//前台传记录数，没则是初始值，否则给实际值
				if(map.get("rows") != null && !StringUtil.isEmpty(rows) && "" != rows){
					pageSize = Integer.valueOf(rows);
				}
			}
			//分页关键代码
			PageHelper.startPage(pageNum, pageSize);
			List<HashMap<String,String>> list=baseMapper.selectAllByPage(sql);
			Map<String,Object> mapreturn = new HashMap<String,Object>();
			PageInfo<HashMap<String,String>> pageInfo=new PageInfo<HashMap<String,String>>(list);
			//此处封装easyui的分页格式
			mapreturn.put("total", pageInfo.getTotal());
			mapreturn.put("rows", pageInfo.getList());
			mapreturn.put("pageinfo", pageInfo);
			return mapreturn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
