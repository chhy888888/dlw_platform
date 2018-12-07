package com.dlw.monitor.platform.service.system.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dlw.monitor.platform.mapper.primary.BaseMapper;
import com.dlw.monitor.platform.mypublicClass.RandomNumber;
import com.dlw.monitor.platform.mypublicClass.passwordEncryption;
import com.dlw.monitor.platform.service.mail.EmailService;
import com.dlw.monitor.platform.service.system.SystemService;


/**
 * 系统表
 * @author user
 *
 */
@Service(value = "SystemService")
public class SystemServiceImpl implements SystemService {
	
	@Autowired
    private BaseMapper baseMapper;
	@Autowired
	private EmailService emailService;
	
	public RandomNumber ra  = new RandomNumber();;
	
	/**
	 * 查询一级数据库字典表
	 */
	public List getTypeInfo(HashMap<String,String> map) {
		String str = map.get("sd_flag"),sql = "";
		String str2 =(String)map.get("sd_flag");
		if(RandomNumber.StringOntNullTM(str)){
			sql = "select t.* from sys_dictionaries t where 1=1 and t.sd_flag = '"+str+"'";
		}
		if(RandomNumber.StringOntNullTM(str2)){
			sql = "select t.* from sys_dictionaries t where 1=1 and t.sd_flag = '"+str2+"'";
		}
		if(RandomNumber.StringOntNullTM(sql)){
			return baseMapper.selectAllByPage(sql);
		}else{
			return null;
		}
	}
	/**
	 * 查询一级数据库字典表
	 */
	public List getTypeInfo(HttpServletRequest request) {
		String str = request.getParameter("sd_flag"),sql = "";
		String str2 =(String)request.getAttribute("sd_flag");
		if(RandomNumber.StringOntNullTM(str)){
			sql = "select t.* from sys_dictionaries t where 1=1 and t.sd_flag = '"+str+"'";
		}
		if(RandomNumber.StringOntNullTM(str2)){
			sql = "select t.* from sys_dictionaries t where 1=1 and t.sd_flag = '"+str2+"'";
		}
		if(RandomNumber.StringOntNullTM(sql)){
			return baseMapper.selectAllByPage(sql);
		}else{
			return null;
		}
	}
	/**
	 * 查询下级节点
	 */
	public List getTypeInfoSubnode(HttpServletRequest request) {
		String str = request.getParameter("sd_parentid"),sql = "";
		if(RandomNumber.StringOntNullTM(str)){
			sql = "select t.* from sys_dictionaries t where 1=1 and t.sd_parentid = '"+str+"'";
			return baseMapper.selectAllByPage(sql);
		}
		return null;
	}
	public int UserNameRepeat(HttpServletRequest request) {
		String username = request.getParameter("username");
		String sql = "select l.* from customer_login l where 1=1 and l.cul_account = '"+username+"' ";
		List list = baseMapper.selectAllByPage(sql);
		return list.size();
	}
	public String gettoEmilYzm(HttpServletRequest request) {
		String username = request.getParameter("username");
		String emil = request.getParameter("emil");
		//验证码
		String yzm = String.valueOf(Math.round(Math.random() * 9999));
//		HashMap<String,String> insMap = new HashMap<String,String>();
//		insMap.put("cul_account", username);
//		insMap.put("cul_email", emil);
//		insMap.put("cul_code", yzm);
//		insMap.put("cul_type", "1");
//		String sql = ra.getaddInfo_pkID_sql("customer_login", insMap);
//		int i = baseMapper.insert(sql);
		StringBuffer  sql = new StringBuffer(" update customer_login t set t.cul_code='"+yzm+"' where t.cul_account='").append(username).append("'");
		baseMapper.update(sql.toString());
		if(true){
			String[] sendTo = emil.split(",");
	        String title = "大路网发至您的送验证码";
	        String content = "验证码："+yzm;
	        emailService.sendSimpleMail(sendTo, title, content);
			return yzm;
		}
		return "";
	}
	public int AddUserInfo(HttpServletRequest request) {
//		HashMap<String,String> wheremap = new HashMap<String,String>();
		HashMap<String,String> updatemap = ra.getRequestInfo(request);
		updatemap.put("cul_password", new passwordEncryption().getPasswordKey(updatemap.get("cul_password")));
		/*wheremap.put("cul_account", updatemap.get("cul_account"));
		updatemap.remove("cul_account");*/
		String sql = ra.getaddInfo_pkID_sql("customer_login", updatemap);
		System.out.println(sql);
		return baseMapper.update(sql);
	}
	public HashMap<String,String> updateUserInfo(HttpServletRequest request) {
		HashMap<String,String> wheremap = new HashMap<String,String>();
		HashMap<String,String> wheremapgl = new HashMap<String,String>();
		HashMap<String,String> updatemap = ra.getRequestInfo(request);
		HashMap<String,String> updatemapgl = new HashMap<String,String>();
		HashMap<String,String> updatemap1 = new HashMap<String,String>();
		for (String key : updatemap.keySet()) {
			if(!key.startsWith("cul_") && !"isdel".equals(key)){
        		updatemapgl.put(key, updatemap.get(key));
        	}else{
        		updatemap1.put(key, updatemap.get(key));
        	}
		}
		String cul_account = updatemap.get("cul_account");
		String ent_customerid = updatemap.get("cul_id");
		String sqlis = " select t.* from enterprise t where t.ent_customerid='"+ent_customerid+"'";
		List list = baseMapper.selectAllByPage(sqlis);
		if(null != list && list.size() > 0){
			wheremapgl.put("ent_customerid", ent_customerid);
			String sqlgl = ra.get_update_info("enterprise", updatemapgl,wheremapgl);
			baseMapper.update(sqlgl);
		}else{
			updatemapgl.put("ent_customerid", ent_customerid);
			String sql = ra.getaddInfo_pkID_sql("enterprise", updatemapgl);
			baseMapper.update(sql);
		}
		wheremap.put("cul_id", ent_customerid);
		updatemap1.remove("cul_id");
		updatemap1.remove("cul_account");
		updatemap1.put("cul_status","1");
		String sql = ra.get_update_info("customer_login", updatemap1,wheremap);
		int i = baseMapper.update(sql);
		if(i>0){
			sql = "select t.*,q.* from customer_login t left JOIN  enterprise q on q.ent_customerid = t.cul_id where 1=1 and t.cul_id = '"+ent_customerid+"'";
			List<HashMap<String,String>> listMap = baseMapper.selectAllByPage(sql);
			if(listMap.size() > 0 ){
				HashMap<String,String> mapUserInfo = listMap.get(0);
				HttpSession session = request.getSession();
				session.setAttribute("userMap", mapUserInfo);
				return mapUserInfo;
			}
		}
		return null;
		
	}
	public int updateUserPSW(HttpServletRequest request) {
		HashMap<String,String> wheremap = new HashMap<String,String>();
		HashMap<String,String> updatemap = ra.getRequestInfo(request);
		updatemap.put("cul_password", new passwordEncryption().getPasswordKey(updatemap.get("cul_password")));
		String cul_account = updatemap.get("cul_id");
		wheremap.put("cul_id", cul_account);
		updatemap.remove("cul_id");
		String sql = ra.get_update_info("customer_login", updatemap,wheremap);
		System.out.println(sql);
		return baseMapper.update(sql);
		
	}
	public List ContractInfo(HttpServletRequest request) {
		String sql = "select t.* from sys_contractpoint t where 1=1  and t.scp_country in ("+request.getParameter("scp_country")+")";
		return baseMapper.selectAllByPage(sql);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
