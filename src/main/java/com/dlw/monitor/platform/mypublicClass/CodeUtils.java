package com.dlw.monitor.platform.mypublicClass;
import java.security.SecureRandom;

public class CodeUtils
{
  public static String id()
  {
    String key = System.nanoTime()+"";
    try {
      key = Long.toHexString(System.nanoTime()) + String.format("%08x", new Object[] { Integer.valueOf(SecureRandom.getInstance("SHA1PRNG").nextInt(2147483647)) });
    } catch (Exception e) {
      key = id_old();
      e.printStackTrace();
    }
    
    return key;
  }

  public static String id_old()
  {
    int sj = (int)(Math.random() * 9999.0D);
    String nm = System.nanoTime()+"";
    String key = sj + nm;
    
    return key;
  }

  public static void main(String[] args)
  {
    System.out.println(id());
	  
  }
}
