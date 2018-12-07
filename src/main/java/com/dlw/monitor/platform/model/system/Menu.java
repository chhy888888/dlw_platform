package com.dlw.monitor.platform.model.system;

import java.io.Serializable;
import java.util.List;
import lombok.Data;
/**
 * 
* 类名称：Menu.java
* 类描述： 
    创建人：GZ
* @version 1.0
 */
@Data
public class Menu   implements Serializable{
	
	private String MENU_ID;
	private String MENU_NAME;
	private String MENU_URL;
	private String PARENT_ID;
	private String MENU_ORDER;
	private String MENU_ICON;
	private String MENU_TYPE;
	private String target;
	
	private Menu parentMenu;
	private List<Menu> subMenu;
	
	private boolean hasMenu = false;
	
}
