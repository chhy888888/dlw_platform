package com.dlw.monitor.platform.utils;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;

import com.dlw.monitor.platform.mypublicClass.Properties;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PutImageUtils {
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private final static String IMAGE_HOST =  Properties.IMAGE_TEST_HOST;
	private final static String UP_HOST =  Properties.IMAGE_TEST_HOST;
	public static final int NO_CRC32 = 0;
	
	private static final String APP_KEY = "uploader";
	private static final String SECRET_KEY = "open sesame";
	
	public static final int DEFAULT_TIMEOUT = 5000;
	/**
	 * 图片类型
	 * @author wanglongtao
	 * 文档  图片 验证  许可证  业务
	 */
	public enum ImageType {
		DOC, IMAGE, VerfifyFile, Lic ; 
	}

	public static String[] typeName = {"/doc/usr", "/img/usr", "/reg/doc", "/reg/lic"};
	public static String getImageKey(ImageType type, String ext) {
		return typeName[type.ordinal()] + "/" + DATE_FORMAT.format(new Date()) + (int) (Math.random() * 100) + "." + ext;
	}
	
	public static String uploadVerfifyFile(byte[] contents, String ext) throws Exception {
		String name = getImageKey(ImageType.VerfifyFile, ext);
		return upload(name, contents);
	}
	
	public static String uploadLic(byte[] contents, String ext) throws Exception {
		String name = getImageKey(ImageType.Lic, ext);
		return upload(name, contents);
	}
	
	public static String uploadBusiness(byte[] contents, String ext)  throws Exception{
		String name = getImageKey(ImageType.DOC, ext);
		return upload(name, contents);
	}
	
	/**
	 * @param accessToken
	 * @param contents
	 * @param ext
	 * @return
	 * @throws Exception
	 */
	public static String uploadFile(byte[] contents, String ext) throws Exception {
		String name = getImageKey(ImageType.DOC, ext);
		return upload(name, contents);
	}
	
	public static String uploadImage(byte[] contents, String ext) throws Exception {
		String name = getImageKey(ImageType.IMAGE, ext);
		return upload(name, contents);
	}
	public static String upload(String name, byte[] contents) throws Exception {
		try {
			String url = UP_HOST;
			put(url + name, contents);
			return IMAGE_HOST + name;
		}catch (Exception e) {
			return null;
		}
	}
	private static void put(String putUrl, byte[] contents) throws Exception {
		HttpURLConnection connection = (HttpURLConnection) new URL(putUrl).openConnection();
		try {
			connection.setConnectTimeout(DEFAULT_TIMEOUT);
			connection.setReadTimeout(DEFAULT_TIMEOUT);
			connection.setUseCaches(false);
			connection.setDoOutput(true);
			connection.setRequestMethod("PUT");
			connection.setRequestProperty("Authorization", getHeader());
			connection.setRequestProperty("Content-Type", "multipart/form-data");
			if (contents != null) {
				OutputStream outstream = connection.getOutputStream();
				try {
					outstream.write(contents);
				} finally {
					IOUtils.closeQuietly(outstream);
				}
			}
			String result = IOUtils.toString(connection.getInputStream(), Charset.forName("utf-8"));
			if(!result.equals("")) {
				throw new Exception();
			}
		} finally {
			IOUtils.close(connection);
		}
	}
	
	private static String getHeader() {
	    String auth = APP_KEY + ":" + SECRET_KEY;
	    byte[] encodedAuth = Base64.encodeBase64(auth.getBytes(Charset.forName("UTF-8")));
	    String authHeader = "Basic " + new String(encodedAuth);
	    return authHeader;
	  }

	public static byte[] File2byte(File file)
    {
        byte[] buffer = null;
        try
        {
            FileInputStream fis = new FileInputStream(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] b = new byte[1024];
            int n;
            while ((n = fis.read(b)) != -1)
            {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        }
        catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return buffer;
    }
	
	/**
	 * 下载
	 * @param path
	 * @param response
	 * @throws Exception
	 */
	public static void down(String path, HttpServletResponse response) throws Exception {
		//path 是带路径的文件名称
		InputStream content = null;
		HttpURLConnection connection = (HttpURLConnection) new URL(path).openConnection();
		try {
			connection.setConnectTimeout(DEFAULT_TIMEOUT);
			connection.setReadTimeout(DEFAULT_TIMEOUT);
			connection.setUseCaches(false);
			connection.setDoOutput(true);
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Authorization", getHeader());
			
			content = (InputStream)connection.getInputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		BufferedInputStream bis = null;
		ServletOutputStream out = null;
		String ext = path.substring(path.lastIndexOf(".") + 1, path.length());
		String fileName = path.substring(path.lastIndexOf("/")+1, path.length());
		try {
			//1.设置文件ContentType类型，这样设置，会自动判断下载文件类型   
	        response.setContentType("multipart/form-data");   
			response.setHeader("content-disposition", "attachment;filename="+URLEncoder.encode(fileName, "UTF-8"));
			bis = new BufferedInputStream(content);
			out = response.getOutputStream();
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				out.write(buff, 0, bytesRead);
			}
			
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
			if (bis != null) {
				bis.close();
			}
		}
		out.close();
	}

}
