package com.dlw.monitor.platform.Controller;


import java.util.Enumeration;
import java.util.HashMap;
import java.util.concurrent.Semaphore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dlw.monitor.platform.mypublicClass.CodeUtils;
import com.dlw.monitor.platform.mypublicClass.RandomNumber;
import com.dlw.monitor.platform.service.user.UserService;

/**
 * 登陆表
 * @author user	用户表
 *
 */
@Controller
@RequestMapping("/exportfactoring")
public class loginController {
	//多线程
	Semaphore semaphore=new Semaphore(1000); 
	@Autowired
	private UserService UserService;
	
	/**
	 * 跳转登录
	 * @return
	 */
	@RequestMapping(value = "/login")
    public String login(HttpServletRequest request){
		//可用资源数
    	int availablePermits = semaphore.availablePermits();
    	if(availablePermits > 0) {
    		try {
    			//请求占用一个资源
				semaphore.acquire(1);
				Enumeration em = request.getSession().getAttributeNames();
				while(em.hasMoreElements()){
					request.getSession().removeAttribute(em.nextElement().toString());
				}
			} catch (InterruptedException e) {
				e.printStackTrace();
			}finally {
				//释放一个资源
				semaphore.release(1);
				System.out.println("释放资源");
			}
    	}

        return "login1";
    }
	/**
	 * 验证用户
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getQueryByUserInfo",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String QueryByUserInfo(HttpServletRequest request){
		String json = "";
		try {
			HashMap<String,String> map = UserService.getUserInfo(request);
			if(map != null){
				/*String token = JWT.sign(map, 60L* 1000L* 30L); 
				map.put("token", token);*/
				json = RandomNumber.getAjaxResultInfo(map, 200, true);
			}else{
				json = RandomNumber.getAjaxResultInfo(map, 404, false);
			}
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("系统错误！", 404, false);
			e.printStackTrace();
			return json;
		}
	}
	/**
	 * 用户注册
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getaddUderinfo",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String addUderinfo(HttpServletRequest request){
		String json = "";
		try {
			int i = UserService.addUderinfo(request); 
			if(i == 1){
				json = RandomNumber.getAjaxResultInfo("添加成功！", 200, true);
			}else{
				json = RandomNumber.getAjaxResultInfo("添加失败！", 404, false);
			}
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("系统错误！", 404, false);
			e.printStackTrace();
			return json;
		}
	}
	/**
	 * 查询用户状态
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getUserStatus",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String userStatus(HttpServletRequest request){
		String json = "";
		try {
			HashMap<String,String> map = UserService.userStatus(request); 
			if(null != map){
				json = RandomNumber.getAjaxResultInfo(map, 200, true);
			}else{
				json = RandomNumber.getAjaxResultInfo(map, 404, false);
			}
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("系统错误！", 404, false);
			e.printStackTrace();
			return json;
		}
	}
	/**
	 * 修改密码
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getupdateInfoPassword",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String updateInfoPassword(HttpServletRequest request){
		String json = "";
		try {
			int i = 0;
			String jPassword = request.getParameter("jpassword");
			HashMap<String,String> mapUserInfo = UserService.QueryByIdUserInfo(request);
			if(mapUserInfo != null){
				if(jPassword.equals(mapUserInfo.get("PASSWORD"))){
					i = UserService.updateUserPassword(request);
					if(i == 1){
						json = RandomNumber.getAjaxResultInfo("修改成功！", 200, true);
					}else{
						json = RandomNumber.getAjaxResultInfo("修改密码失败！", 404, false);
					}
				}else{
					json = RandomNumber.getAjaxResultInfo("密码填写不一致！", 404, false);
				}
			}else{
				json = RandomNumber.getAjaxResultInfo("用户不正确不可以修改。", 404, false);
			}
			
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("系统错误！", 404, false);
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping(value = "/loging")
	public String loging(HttpServletRequest request){
		HttpSession session = request.getSession();
		HashMap<String,String> mapUserInfo  = (HashMap<String, String>) session.getAttribute("userMap");
		request.setAttribute("mapUserInfo", mapUserInfo);
		return "index2";
	}
	@ResponseBody
	@RequestMapping(value = "/getMyrzv", method=RequestMethod.POST)
	public String getMyrzv(HttpServletRequest request){
		String str = CodeUtils.id();
		return RandomNumber.getAjaxResultInfo(str, 200, true);
	}
	@RequestMapping(value = "/getMyrz", method=RequestMethod.POST)
	public String getMyrz(HttpServletRequest request){
		String str = CodeUtils.id();
		request.setAttribute("fnid", str);
		return "rzzx/Myrz";
	}
	@RequestMapping(value = "/wdfb")
	public String getwdfb(HttpServletRequest request){
		return "rzzx/wdfb";
	}
	@RequestMapping(value = "/zsxy")
	public String gezsxy(HttpServletRequest request){
		return "rzzx/zsxy";
	}
	@RequestMapping(value = "/getZsxyXQinfo")
	public String zsxyXQinfo(HttpServletRequest request){
		request.setAttribute("fc_fnid", request.getParameter("fcid"));
		return "rzzx/zsxyXQInfo";
	}
	@ResponseBody
	@RequestMapping(value = "/getjrblbjlbv",produces = {"application/json;charset=UTF-8"}, method=RequestMethod.POST)
	public String getjrblbjlbv(HttpServletRequest request){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("fc_fnid", request.getParameter("fc_fnid"));
		map.put("Country", request.getParameter("Country"));
		map.put("fn_name", request.getParameter("fn_name"));
		map.put("fn_code", request.getParameter("fn_code"));
		return RandomNumber.getAjaxResultInfo(map, 200, true);
	}
	@RequestMapping(value = "/getjrblbjlb",produces = {"application/json;charset=UTF-8"}, method=RequestMethod.POST)
	public String getjrblbjlb(HttpServletRequest request){
		request.setAttribute("fc_fnid", request.getParameter("fc_fnid"));
		request.setAttribute("Country", request.getParameter("Country"));
		request.setAttribute("fn_name", request.getParameter("fn_name"));
		request.setAttribute("fn_code", request.getParameter("fn_code"));
		return "rzzx/blbjlb";
	}
	@RequestMapping(value = "/getccqdxy", method=RequestMethod.POST)
	public String getccqdxy(HttpServletRequest request){
		request.setAttribute("fiid", request.getParameter("fiid"));
		request.setAttribute("fnid", request.getParameter("fnid"));
		request.setAttribute("fi_status", request.getParameter("fi_status"));
		return "rzzx/rzzx";
	}
	@ResponseBody
	@RequestMapping(value = "/getccqdxyv", method=RequestMethod.POST)
	public String getccqdxyv(HttpServletRequest request){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("fiid", request.getParameter("fiid"));
		map.put("fnid", request.getParameter("fnid"));
		return RandomNumber.getAjaxResultInfo(map, 200, true);
	}
	@RequestMapping(value = "/rzxyxddd")
	public String rzxyxddd(HttpServletRequest request){
		return "rzzx/rzxyxddd";
	}
	@RequestMapping(value = "/getuserjr")
	public String getuserjr(HttpServletRequest request){
		return "register";
//		return "adduser";
	}
	@RequestMapping(value = "/toDsh")
	public String toDsh(HttpServletRequest request){
		return "dsh";
//		return "adduser";
	}
	@RequestMapping(value = "/mfqq")
	public String mfqq(HttpServletRequest request){
		return "rzzx/mfqq";
	}
	@RequestMapping(value = "/fklist")
	public String fklist(HttpServletRequest request){
		return "rzzx/fklist";
	}
	@RequestMapping(value = "/facility")
	public String getfacility(HttpServletRequest request){
		return "rzzx/Myfacility";
	}
	@RequestMapping(value = "/getupdateinfo")
	public String updateinfo(HttpServletRequest request){
		return "rzzx/updateinfo";
	}
	@RequestMapping(value = "/getmfqqinfo")
	public String getmfqqinfo(HttpServletRequest request){
		request.setAttribute("fcid", request.getParameter("fcid"));
		request.setAttribute("fnid", request.getParameter("fnid"));
		request.setAttribute("fcfacustomerid", request.getParameter("fcfacustomerid"));
		return "rzzx/mfqqinfo";
	}
	@RequestMapping(value = "/getzsxyinfo")
	public String getzsxyinfo(HttpServletRequest request){
		request.setAttribute("fcid", request.getParameter("fcid"));
		request.setAttribute("fnid", request.getParameter("fnid"));
		request.setAttribute("fiid", request.getParameter("fiid"));
		return "rzzx/zsxyinfo";
	}
	@RequestMapping(value = "/getfkinfo")
	public String getfkinfo(HttpServletRequest request){
		request.setAttribute("fcid", request.getParameter("fcid"));
		request.setAttribute("fnid", request.getParameter("fnid"));
		request.setAttribute("fcfacustomerid", request.getParameter("fcfacustomerid"));
		return "rzzx/fkinfo";
	}
	
	
	
}
