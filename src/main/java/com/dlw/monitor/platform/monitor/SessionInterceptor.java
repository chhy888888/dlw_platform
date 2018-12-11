package com.dlw.monitor.platform.monitor;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dlw.monitor.platform.mapper.primary.BaseMapper;
import com.dlw.monitor.platform.mypublicClass.RandomNumber;
@Component
public class SessionInterceptor implements HandlerInterceptor {
	@Autowired
    private BaseMapper baseMapper;
	
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("afterCompletion<<<>>>afterCompletion");
	}

	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("postHandle<<<>>>postHandle");
	}

	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		boolean bo = true;
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
		Map<String,String> mapUser = (Map) request.getSession().getAttribute("userMap");
//		HashMap<String,String> map = new RandomNumber().getRequestInfo(request);
		boolean loginR = true;
		if(null == mapUser){
			loginR = false;
		}
		/*RandomNumber ra = new RandomNumber();
		String sql = ra.getSelectInfo("sys_urls", new HashMap<String,String>());
		List<HashMap<String,String>> list = baseMapper.selectAllByPage(sql);
		String urls = "";
		if(null != list && !list.isEmpty()){
			urls = list.get(0).get("escape_url");
		}
		System.out.println("request.getRequestURI()>>>"+request.getRequestURI());
		if(request.getRequestURI().startsWith("/system")){
			bo = true;
		}else{
		}*/
//		if((!request.getRequestURI().startsWith("/api/manager") && !request.getRequestURI().startsWith("/api/system") && !urls.contains(request.getRequestURI())) && !loginR){
			/*String str = "<script type='text/javascript'>parent.window.location.href = '"+basePath+"exportfactoring/login';</script>";
			response.setCharacterEncoding("utf-8");
			PrintWriter pw = response.getWriter();
			pw.print(str);*/
			/*int code = 0;
			if(!loginR){
				code = 403;
			}else{
				code = 400;
			}
			bo = false;
			PrintWriter pw = response.getWriter();
			responseMessage(response,pw,code,bo);
		}else{*/
			/*int code = 200;
			PrintWriter pw = response.getWriter();
			responseMessage(response,pw,code,bo);*/
			/*int code = 0;
			if(!loginR && !"/exportfactoring/getQueryByUserInfo".equals(request.getRequestURI())){
				code = 403;
			}
			bo = false;
			PrintWriter pw = response.getWriter();
			responseMessage(response,pw,code,bo);*/
//		}
		/*if(!loginR){
			bo = false;
			String str = "<script type='text/javascript'>parent.window.location.href = '"+basePath+"exportfactoring/login';</script>";
			response.setCharacterEncoding("utf-8");
			PrintWriter pw = response.getWriter();
			pw.print(str);
		}*/
		return bo;
	}

	//请求不通过，返回错误信息给客户端 
	private void responseMessage(HttpServletResponse response, PrintWriter out,int code,boolean bo) {
		response.setContentType("application/json; charset=utf-8"); 
		Map<String,String> map = new HashMap<String,String>();
		String json = RandomNumber.getAjaxResultInfo(map, code, bo); 
		out.print(json); 
		out.flush(); 
		out.close(); 
	} 
public static void main(String[] args) {
	List<HashMap<String,String>> lsitmap= new ArrayList<HashMap<String,String>>();
	HashMap<String,String> map= new HashMap<String,String>();
	HashMap<String,String> mapxx= new HashMap<String,String>();
	map.put("cruces", "应收账款是否呢转让");
	mapxx.put("A", "xxx");
	mapxx.put("B", "xxx");
	mapxx.put("C", "xxx");
	map.put("option", JSON.toJSONString(mapxx));
	map.put("value", "A");
	lsitmap.add(map);
	map= new HashMap<String,String>();
	mapxx= new HashMap<String,String>();
	map.put("cruces", "支付全部还款之前，商品所有问题");
	mapxx.put("A", "xxx");
	mapxx.put("B", "xxx");
	mapxx.put("C", "xxx");
	mapxx.put("D", "xxx");
	map.put("option", JSON.toJSONString(mapxx));
	map.put("value", "D");
	lsitmap.add(map);
	System.out.println(JSON.toJSONString(lsitmap));
}

}
