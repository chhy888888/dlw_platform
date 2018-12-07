package com.dlw.monitor.platform.Controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dlw.monitor.platform.mypublicClass.RandomNumber;
import com.dlw.monitor.platform.service.system.SystemService;

/**
 * 系统公共类
 * @author user	孙鹏
 *
 */
@Controller
@RequestMapping("/system")
public class SystemController {
	
	@Resource
	private SystemService systemService;
	
	/**
	 * 查询一级数据字典表
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getSystemDictionaries",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String SystemDictionariesListInfo(HttpServletRequest request){
		String json = "";
		try {
			List list = systemService.getTypeInfo(request);
			if(list.size() > 0){
				json = RandomNumber.getAjaxResultInfo(list, 200, true);
			}else{
				json = RandomNumber.getAjaxResultInfo(null, 404, false);
			}
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("查询错误！", 404, false);
			e.printStackTrace();
			return json;
		}
	}
	/**
	 * 查询下级节点
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getSystemDictionariesSubnode",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String SystemDictionariesSubnodeListInfo(HttpServletRequest request){
		String json = "";
		try {
			List list = systemService.getTypeInfoSubnode(request);
			if(list.size() > 0){
				json = RandomNumber.getAjaxResultInfo(list, 200, true);
			}else{
				json = RandomNumber.getAjaxResultInfo(null, 404, false);
			}
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("查询错误！", 404, false);
			e.printStackTrace();
			return json;
		}
	}
	/**
	 * 用户名查重
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getUserNameRepeat",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String UserNameRepeat(HttpServletRequest request){
		String json = "";
		try {
			int i = systemService.UserNameRepeat(request);
			if(i == 0){
				json = RandomNumber.getAjaxResultInfo("ok", 200, true);
			}else{
				json = RandomNumber.getAjaxResultInfo("no", 200, false);
			}
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("查询错误！", 404, false);
			e.printStackTrace();
			return json;
		}
	}
	/**
	 * 发送验证码
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/gettoEmilYzm",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String gettoEmilYzm(HttpServletRequest request){
		String json = "";
		try {
			String str = systemService.gettoEmilYzm(request);
			json = RandomNumber.getAjaxResultInfo(str, 200, true);
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("查询错误！", 404, false);
			e.printStackTrace();
			return json;
		}
	}
	/**
	 * 添加用户
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getaddUserInfo",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String AddUserInfo(HttpServletRequest request){
		String json = "";
		try {
			int str = systemService.AddUserInfo(request);
			json = RandomNumber.getAjaxResultInfo(str, 200, true);
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("查询错误！", 404, false);
			e.printStackTrace();
			return json;
		}
	}
	/**
	 * 修改用户信息
	 * @param request
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	@ResponseBody
	@RequestMapping(value = "/getupdateUserInfo",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String updateUserInfo(HttpServletRequest request){
		String json = "";
		try {
			HashMap<String,String> map = systemService.updateUserInfo(request);
			json = RandomNumber.getAjaxResultInfo(map, 200, true);
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("查询错误！", 404, false);
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return json;
		}
	}
	/**
	 * 修改用户密码
	 * @param request
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	@ResponseBody
	@RequestMapping(value = "/getupdateUserPSW",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String updateUserPSW(HttpServletRequest request){
		String json = "";
		try {
			int str = systemService.updateUserPSW(request);
			json = RandomNumber.getAjaxResultInfo(str, 200, true);
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("查询错误！", 404, false);
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return json;
		}
	}
	/**
	 * 查询合同重点
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getContractInfo",produces = {"application/json;charset=UTF-8"},method=RequestMethod.POST)
	public String ContractInfo(HttpServletRequest request){
		String json = "";
		try {
			List list = systemService.ContractInfo(request);
			if(list.size() > 0){
				json = RandomNumber.getAjaxResultInfo(list, 200, true);
			}else{
				json = RandomNumber.getAjaxResultInfo("暂无数据！", 200, true);
			}
			return json;
		} catch (Exception e) {
			json = RandomNumber.getAjaxResultInfo("系统错误！", 404, false);
			e.printStackTrace();
			return json;
		}
	}
	
	
	
	
	
	
	

}
