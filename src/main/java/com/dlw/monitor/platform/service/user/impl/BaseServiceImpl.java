package com.dlw.monitor.platform.service.user.impl;

import com.dlw.monitor.platform.mapper.primary.BaseMapper;
import com.dlw.monitor.platform.service.user.BaseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/16.
 */
@Service(value = "baseService")
public class BaseServiceImpl implements BaseService {
	@Autowired
    private BaseMapper baseMapper;
	
	public String addEntity(String sql) {
		return baseMapper.insert(sql).toString();
	}

	
	public String updateEntity(String sql) {
		return baseMapper.update(sql).toString();
	}

	
	public String deleteEntity(String sql) {
		return baseMapper.delete(sql).toString();
	}

	
	public Map selectAllEntities(int pageNum, int pageSize, String sql,HttpServletRequest request) {
		//将参数传给这个方法就可以实现物理分页了，非常简单。
		try {
			if(null != request){
				String page = request.getParameter("page");
				String rows = request.getParameter("rows");
				//前台传当前页，没则是初始值，否则给实际值
				if(!StringUtil.isEmpty(page) && "" != page){
					pageNum = Integer.valueOf(page);
				}
				//前台传记录数，没则是初始值，否则给实际值
				if(!StringUtil.isEmpty(rows) && "" != rows){
					pageSize = Integer.valueOf(rows);
				}
			}
			//分页关键代码
			PageHelper.startPage(pageNum, pageSize);
			List<HashMap<String,String>> list=baseMapper.selectAllByPage(sql);
			Map<String,Object> map = new HashMap<String,Object>();
			PageInfo<HashMap<String,String>> pageInfo=new PageInfo<HashMap<String,String>>(list);
			//此处封装easyui的分页格式
			map.put("total", pageInfo.getTotal());
			map.put("rows", pageInfo.getList());
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	


}
