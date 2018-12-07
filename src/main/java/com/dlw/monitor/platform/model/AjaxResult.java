package com.dlw.monitor.platform.model;

/**
 * 往前台返回的实体类
 * @author user 孙鹏
 *
 */
public class AjaxResult {
	public static int code200 = 200;
	
	public static int code404 = 404;
	
	//返回信息
	public boolean message;
	//返回编码
	public Integer code;
	//返回数据
	public Object data;

	public AjaxResult(){}

	public AjaxResult(boolean message, Integer code, Object data){
		this.message = message;
		this.data = data;
		this.code = code;
	}

	public AjaxResult(Integer code,Object data){
		this.message = false;
		this.code = code;
		this.data = data;
	}

	public AjaxResult(Object data){
		this.code = code200;
		this.message = true;
		this.data = data;
	}
	
	public boolean isMessage() {
		return message;
	}
	public void setMessage(boolean message) {
		this.message = message;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
}
