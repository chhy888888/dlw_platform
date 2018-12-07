package com.dlw.monitor.platform.mypublicClass;

import lombok.extern.apachecommons.CommonsLog;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;


@CommonsLog
public class Properties {
    
	private static final String[] IMAGE_SERVER = new String[] {
			"47.100.15.11"
	};
    private static final String[] ONLINE_SERVER = new String[]{
    		"47.52.201.218","47.52.198.26", "172.31.1.12" ,"172.31.1.13"
        };
    
    private static final String[] JOB_SERVER = new String[]{
    		"47.52.201.218",};
    
    private static final String[] ONLINE_TEST_SERVER = new String[] {
        "47.100.15.11"};
    
    public static String HOST = "http://b2b.ooway.com";
    
    public static boolean isPushOn = false;
    
    public static boolean isJobOn = false;
    
    public static boolean isEmailOn = false;
    
    public static boolean isMsgOn = false;
    
    public static boolean isNotifyOn = false;
    
    public static boolean isOnline = false;
    
    public static final String ip;
    
    public static final String hostName;
    
    public static final Map<String, String> HOSTNAME2NAME = new HashMap<String, String>();
    
    public static final String IMAGE_HOST = "http://47.100.15.11";
    
    public static final String IMAGE_TEST_HOST = "http://139.196.85.212";
    
    static {
        HOSTNAME2NAME.put("AY1407072222425403feZ", "online-0");
        HOSTNAME2NAME.put("iZ25yd71kssZ", "online-1");
        HOSTNAME2NAME.put("iZ25exjyn0nZ", "online-test");
        
        String initIp = "";
        String initHostName = "unkonwn host";
        try {
            InetAddress addr = InetAddress.getLocalHost();
            initIp = addr.getHostAddress().toString();
            initHostName = addr.getHostName();
        } catch (Exception e) {
            log.error(e, e);
        }
        ip = initIp;
        hostName = HOSTNAME2NAME.containsKey(initHostName) ? HOSTNAME2NAME.get(initHostName) : initHostName;
        HOST = "http://" + ip;
        for (String server : ONLINE_SERVER) {
            if (server.equals(ip)) {
                isPushOn = true;
                isEmailOn = true;
                isMsgOn = true;
                isNotifyOn = true;
                isOnline = true;
                HOST = "http://b2b.ooway.com";
            }
        }
        for (String server : JOB_SERVER) {
            if (server.equals(ip)) {
                isJobOn = true;
            }
        }
        for (String server : ONLINE_TEST_SERVER) {
            if (server.equals(ip)) {
                HOST = "http://47.100.15.11";
                isPushOn = true;
//                isEmailOn = true;
//                isMsgOn = true;
                isNotifyOn = true;
                isJobOn = true;
                HOST = "http://47.100.15.11";
            }
        }
        for(String server: IMAGE_SERVER) {
        		if(server.equals(ip)) {
        			HOST = "http://47.100.15.11";
        		}
        }
        log.info("init properties finished.");
        log.info("ip = " + ip);
        log.info("host = " + HOST);
        log.info("hostName = " + hostName);
        log.info("isOnline = " + isOnline);
        log.info("isPushOn = " + isPushOn);
        log.info("isJobOn = " + isJobOn);
        log.info("isEmailOn = " + isEmailOn);
        log.info("isMsgOn = " + isMsgOn);
        log.info("isNotifyOn = " + isNotifyOn);
    }
    public static void main(String[] args) {
		System.out.println(Properties.HOST);
	}
}
