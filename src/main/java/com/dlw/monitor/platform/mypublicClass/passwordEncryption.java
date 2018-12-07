package com.dlw.monitor.platform.mypublicClass;

import java.io.UnsupportedEncodingException;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;

public class passwordEncryption {
	private static final String cvt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
			+ "abcdefghijklmnopqrstuvwxyz" + "0123456789+/";
	private static final int fillchar = '=';
	private static final String ALGORITHM = "DES";
	private SecretKey deskey;
	private Cipher cipher;
	public static String Md5Key = "OOWAYKEY";
	
	public String getPasswordKey(String password){
		passwordEncryption sc = new passwordEncryption();
		try {
			sc.setKey(passwordEncryption.Md5Key);
			String scstr = sc.encrypt(password);
			password = passwordEncryption.encodeBase64(scstr.getBytes("ISO8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return password;
	}
	
	//密码转换
	private void setKey(String key) {
		deskey = new javax.crypto.spec.SecretKeySpec(key.getBytes(), ALGORITHM);
		try {
			cipher = Cipher.getInstance(ALGORITHM);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//密码转换
	private String encrypt(String message) {
		byte[] result = doCrypt(Cipher.ENCRYPT_MODE, message.getBytes());
		try {
			return new String(result, "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	//密码转换
	private synchronized byte[] doCrypt(int type, byte[] input) {
		byte[] output = null;
		try {
			cipher.init(type, deskey);
			output = cipher.doFinal(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return output;
	}
	//转换密码2
	private static String encodeBase64(byte[] data) {

		int c;
		int len = data.length;
		StringBuffer ret = new StringBuffer(((len / 3) + 1) * 4);
		for (int i = 0; i < len; ++i) {
			c = (data[i] >> 2) & 0x3f;
			ret.append(cvt.charAt(c));
			c = (data[i] << 4) & 0x3f;
			if (++i < len)
				c |= (data[i] >> 4) & 0x0f;

			ret.append(cvt.charAt(c));
			if (i < len) {
				c = (data[i] << 2) & 0x3f;
				if (++i < len)
					c |= (data[i] >> 6) & 0x03;

				ret.append(cvt.charAt(c));
			} else {
				++i;
				ret.append((char) fillchar);
			}

			if (i < len) {
				c = data[i] & 0x3f;
				ret.append(cvt.charAt(c));
			} else {
				ret.append((char) fillchar);
			}
		}
		return ret.toString();

	}
	public static void main(String[] args) {
		String str = new passwordEncryption().getPasswordKey("123456");
		System.out.println(">>>>>>>>>>>>"+str);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
