package com.dlw.monitor.platform.mypublicClass;

import java.beans.*;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.*;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class ConvertToJson {
	 
    /**
      * 对象转换为Json
      * @param obj
      * @return
      */
     public static String object2json(Object obj) {
         StringBuilder json = new StringBuilder();
         if (obj == null) {
             json.append("\"\"");
         } else if (obj instanceof String || obj instanceof Integer
                 || obj instanceof Float || obj instanceof Boolean
                 || obj instanceof Short || obj instanceof Double
                 || obj instanceof Long || obj instanceof BigDecimal
                 || obj instanceof BigInteger || obj instanceof Byte) {
             json.append("\"").append(string2json(obj.toString())).append("\"");
         } else if (obj instanceof Object[]) {
             json.append(array2json((Object[]) obj));
         } else if (obj instanceof List) {
             json.append(list2json((List<?>) obj));
         } else if (obj instanceof Map) {
             json.append(map2json((Map<?, ?>) obj));
         } else if (obj instanceof Set) {
             json.append(set2json((Set<?>) obj));
         } else {
             json.append(bean2json(obj));
         }
         return json.toString();
     }
    
     /**
      * 对象bean转换为Json
      * @param bean
      * @return
      */
     public static String bean2json(Object bean) {
         StringBuilder json = new StringBuilder();
         json.append("{");
         PropertyDescriptor[] props = null;
         try {
             props = Introspector.getBeanInfo(bean.getClass(), Object.class)
                     .getPropertyDescriptors();
         } catch (IntrospectionException e) {
         }
         if (props != null) {
             for (int i = 0; i < props.length; i++) {
                 try {
                     String name = object2json(props[i].getName());
                     String value = object2json(props[i].getReadMethod().invoke(
                             bean));
                     json.append(name);
                     json.append(":");
                     json.append(value);
                     json.append(",");
                 } catch (Exception e) {
                 }
             }
             json.setCharAt(json.length() - 1, '}');
         } else {
             json.append("}");
         }
         return json.toString();
     }
 
    /**
      * List集合转换为Json
      * @param list
      * @return
      */
     public static String list2json(List<?> list) {
         StringBuilder json = new StringBuilder();
         json.append("[");
         if (list != null && list.size() > 0) {
             for (Object obj : list) {
                 json.append(object2json(obj));
                 json.append(",");
             }
             json.setCharAt(json.length() - 1, ']');
         } else {
             json.append("]");
         }
         return json.toString();
     }
 
    /**
      * 对象数组转换为Json
      * @param array
      * @return
      */
     public static String array2json(Object[] array) {
         StringBuilder json = new StringBuilder();
         json.append("[");
         if (array != null && array.length > 0) {
             for (Object obj : array) {
                 json.append(object2json(obj));
                 json.append(",");
             }
             json.setCharAt(json.length() - 1, ']');
         } else {
             json.append("]");
         }
         return json.toString();
     }
 
    /**
      * Map集合转换为Json
      * @param map
      * @return
      */
     public static String map2json(Map<?, ?> map) {
         StringBuilder json = new StringBuilder();
         json.append("{");
         if (map != null && map.size() > 0) {
             for (Object key : map.keySet()) {
                 json.append(object2json(key));
                 json.append(":");
                 json.append(object2json(map.get(key)));
                 json.append(",");
             }
             json.setCharAt(json.length() - 1, '}');
         } else {
             json.append("}");
         }
         return json.toString();
     }
 
    /**
      * Set集合转为Json
      * @param set
      * @return
      */
     public static String set2json(Set<?> set) {
         StringBuilder json = new StringBuilder();
         json.append("[");
         if (set != null && set.size() > 0) {
             for (Object obj : set) {
                 json.append(object2json(obj));
                 json.append(",");
             }
             json.setCharAt(json.length() - 1, ']');
         } else {
             json.append("]");
         }
         return json.toString();
     }
 
    /**
      * 字符串转换为Json
      * @param s
      * @return
      */
     public static String string2json(String s) {
         if (s == null)
             return "";
         StringBuilder sb = new StringBuilder();
         for (int i = 0; i < s.length(); i++) {
             char ch = s.charAt(i);
             switch (ch) {
             case '"':
                 sb.append("\\\"");
                 break;
             case '\\':
                 sb.append("\\\\");
                 break;
             case '\b':
                 sb.append("\\b");
                 break;
             case '\f':
                 sb.append("\\f");
                 break;
             case '\n':
                 sb.append("\\n");
                 break;
             case '\r':
                 sb.append("\\r");
                 break;
             case '\t':
                 sb.append("\\t");
                 break;
             case '/':
                 sb.append("\\/");
                 break;
             default:
                 if (ch >= '\u0000' && ch <= '\u001F') {
                     String ss = Integer.toHexString(ch);
                     sb.append("\\u");
                     for (int k = 0; k < 4 - ss.length(); k++) {
                         sb.append('0');
                     }
                     sb.append(ss.toUpperCase());
                 } else {
                     sb.append(ch);
                 }
             }
         }
         return sb.toString();
     }
     /**
      * json转map
      * @param str
      * @return
      */
     public static Map getjsontoMap (String str){
	     Map json = (Map) JSONObject.parse(str);  
	     Map mapInfo = new HashMap();
	     for (Object map : json.entrySet()){  
	    	 mapInfo.put(((Map.Entry)map).getKey(), ((Map.Entry)map).getValue());
	     }
	     return mapInfo;
     }
     /**
      * 将json数组解析出来,生成自定义数据的数组
      * @param data 包含用户自定义数据的json
      * @return 自定义信息的数据
      * @throws JSONException
      */
	public static List<Map<String, Object>> Json2UserDefine(String data) {
		List<Map<String, Object>> list = null;
		if (data.equals(""))
			return list;
		try {
			JSONArray jsonArray = JSONArray.parseArray(data);
			JSONObject jsonObject;
			list = new ArrayList<Map<String, Object>>();
			for (int i = 0; i < jsonArray.size(); i++) {
				jsonObject = jsonArray.getJSONObject(i);
				list.add(getjsontoMap(jsonObject.toString()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
    	 
         /*List<HashMap<String,String>> items = new ArrayList<HashMap<String,String>>();
         if (data.equals("")) return items;
         JSONArray array = JSONArray.parseArray(data);
         
         JSONObject object = null;
         HashMap<String,String> item = null;
         for (int i = 0; i < array.size(); i++) {
             object = array.getJSONObject(i);
             String key = object..getString(Api.KEY);
             String value = object.getString(Api.VALUE);
             item = new MoreInfo(key, value);
             items.add(item);
         }
         */
     }
     
     
     
     
     
}

