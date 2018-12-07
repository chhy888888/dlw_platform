package com.dlw.monitor.platform.mypublicClass;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.dlw.monitor.platform.model.AjaxResult;


/**
 * 懒人开发包
 * @author 孙鹏
 *
 */
public class RandomNumber {
	
	/**
	 * 格式化时间 
	 * 例如：yyyy-MM-dd hh:mm:ss
	 * @return
	 */
	public static String gettimes(String gs){
		SimpleDateFormat formatter = new SimpleDateFormat(gs);
		return formatter.format(new Date());
	}
	/**
	 * 三目运算
	 * @param info	要判断的字符串
	 * @return
	 */
	public static String getnullzk(String info){
		return info == null ? "": info;
	}
	public static String getnullzks(String info){
		String str = "";
		if(!"".equals(info) && !"null".equals(info) && null != info && "" != info){
			str = info;
		}
		return str;
	}
	public static int getnullzksNum(String info){
		String str = "0";
		if(!"".equals(info) && !"null".equals(info) && null != info && "" != info){
			str = info;
		}
		return Integer.valueOf(str);
	}
	
	/**
	 * 修改
	 * @param tablb			表明
	 * @param mapinfo		修改的数据
	 * @param mapwhere		查询条件
	 * @return
	 */
	public String get_update_info(String tablb,HashMap<String,String> mapinfo,HashMap<String,String> mapwhere){
		StringBuffer sb = new StringBuffer();
		sb.append(" UPDATE ");
		sb.append(tablb);
		sb.append(" SET ");
		Set<String> set = mapinfo.keySet();
		for(String key : set){
			sb.append(key);
			sb.append(" = ");
			sb.append("'"+mapinfo.get(key)+"',");
		}
		sb.append(" UPDATEDATE = '").append(gettimes("yyyy-MM-dd HH:MM:ss")).append("'");
		sb.append(" WHERE 1=1 ");
		Set<String> setwhere = mapwhere.keySet();
		for(String whereinfo : setwhere){
			sb.append(" AND ");
			sb.append(whereinfo);
			sb.append(" = ");
			sb.append("'"+mapwhere.get(whereinfo)+"'");
		}
		return sb.toString();
	}
	
	/**
	 * 添加
	 * @param tableName			表明
	 * @param map				插入的数据
	 * @return
	 */
	public String getaddInfo_pkID_sql(String tableName,HashMap<String,String> map){
		String sql = " INSERT INTO " + tableName +" ( ";
		Set<String> keySet = map.keySet();
		String key = "",values = "";
		for (Object keyName : keySet){
			key += ","+keyName;//info == null ? "": info
			values += ",'"+ (map.get(keyName) == null ? "0" : String.valueOf(map.get(keyName))) +"'";
		}
		sql += key.substring(1) + ",CREATEDATE) VALUES ( " +values.substring(1)+ ",'"+gettimes("yyyy-MM-dd HH:MM:ss")+"')";
		return sql;
	}
	/**
	 * 查询单表
	 * @param tableName		表明
	 * @param map			查询条件
	 * @return
	 */
	public String getSelectInfo(String tableName,HashMap<String,String> map){
		String sql = "select t.* from "+tableName+" t where 1=1 ";
		Set<String> keySet = map.keySet();
		for (Object keyName : keySet){
			sql += " and t."+keyName+"='"+map.get(keyName)+"' ";
		}
		return sql;
	}
	/**
	 * 前台传到后台的值转成HashMap
	 * @param request
	 * @return
	 */
	public HashMap<String,String> getRequestInfo(HttpServletRequest request){
		HashMap<String,String> hashmap = new HashMap<String,String>();
		Map<String,String[]> map = request.getParameterMap();
		Set<String> key = map.keySet();  
        //参数迭代器  
        Iterator<String> iterator = key.iterator(); 
        
        while(iterator.hasNext()){  
            String k = iterator.next();  
            if(!k.equals("1") && !k.equals("page") && !k.equals("rows") ){
            	// 新增%处理
//					hashmap.put(k, URLDecoder.decode(map.get(k)[0].toString().replaceAll("%(?![0-9a-fA-F]{2})", "%25").replaceAll("\\+", "%2B"), "UTF-8"));
            	if (map.get(k)[0] != null)
            	{
            		hashmap.put(k, map.get(k)[0].toString());
            	}
            }
        }
		return hashmap;
	}
	/**
	 * 非空验证
	 * @param str 验证的值
	 * @return
	 */
	public static boolean StringOntNullTM(String str){
		if (str == null || str.length() == 0 || "".equals(str) || "null".equals(str)) {
            return false;
        }
        return true;
	}
	
	/**
	 * 封装返回前台的数据
	 * @param data	数据
	 * @param code	返回代码
	 * @param message	返回信息
	 * @return
	 */
	public static String getAjaxResultInfo(Object data,int code,boolean message){
		AjaxResult aj = new AjaxResult();
		aj.setCode(code);
		aj.setMessage(message);
		aj.setData(data);
		return ConvertToJson.bean2json(aj);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
