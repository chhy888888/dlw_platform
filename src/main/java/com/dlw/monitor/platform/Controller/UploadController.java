package com.dlw.monitor.platform.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.dlw.monitor.platform.model.AjaxResult;
import com.dlw.monitor.platform.mypublicClass.ConvertToJson;
import com.dlw.monitor.platform.mypublicClass.ResultStatus;
import com.dlw.monitor.platform.utils.ImageUtils;
import com.dlw.monitor.platform.utils.PutImageUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 上传下载
 * @author  liqian
 */
@RestController
public class UploadController {
    /**
     * 上传文件
     * @param request
     * @param response
     * @param files
     * @return
     */
    @RequestMapping(value = "/upload/file", method = RequestMethod.POST)
    @ResponseBody
    public String uploadFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("files") MultipartFile files) {
        String url = null;
        try {
            //url = PutImageUtils.uploadBusiness(files.getBytes(), ImageUtils.getSuffixFile(files.getOriginalFilename()));
            url = PutImageUtils.uploadBusiness(files.getBytes(), files.getOriginalFilename().substring(files.getOriginalFilename().lastIndexOf(".") + 1));
        }  catch (Exception e) {
            return ConvertToJson.bean2json(new AjaxResult(ResultStatus.UPLOAD_ERROR_CODE,ResultStatus.UPLOAD_ERROR_STRING));
        }
        System.out.println(url);
        return ConvertToJson.bean2json(new AjaxResult(url));
    }
    /**
     * 上传图片
     * @param request
     * @param response
     * @param file
     * @return
     */
    @RequestMapping(value = "/upload/img", method = RequestMethod.POST)
    @ResponseBody
    public String uploadImg(HttpServletRequest request, HttpServletResponse response, @RequestParam("files") MultipartFile file) {
        String url = null;
        try {
            url = PutImageUtils.uploadBusiness(file.getBytes(), ImageUtils.getSuffix(file.getOriginalFilename()));
        }  catch (Exception e) {
            return ConvertToJson.bean2json(new AjaxResult(ResultStatus.UPLOAD_ERROR_CODE,ResultStatus.UPLOAD_ERROR_STRING));
        }
        return ConvertToJson.bean2json(new AjaxResult(url));
    }

    /**
     * 上传压缩文件
     * @param request
     * @param response
     * @param
     * @return
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public String upload(HttpServletRequest request, HttpServletResponse response, @RequestParam("files") MultipartFile file) {
        String url = null;
        try {
            url = PutImageUtils.uploadBusiness(file.getBytes(), ImageUtils.getSuffixZipFiles(file.getOriginalFilename()));
        }  catch (Exception e) {
            return ConvertToJson.bean2json(new AjaxResult(ResultStatus.UPLOAD_ERROR_CODE,ResultStatus.UPLOAD_ERROR_STRING));
        }
        return ConvertToJson.bean2json(new AjaxResult(url));
    }

    /**
     * 从服务器读取文件
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/download", method = RequestMethod.POST)
    @ResponseBody
    public String dowloadFile(HttpServletRequest request, HttpServletResponse response) {
        String filePath = request.getParameter("filePath");

        try {
            if (filePath != null && !filePath.equals("")) {
	               /*if (fileType.equals("img")) {
	                   AuthFileUtil.downImage(filePath, response);
	               }
	               if (fileType.equals("doc")) {
	                   AuthFileUtil.downDoc(filePath, response);
	               }*/
                PutImageUtils.down(filePath,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ConvertToJson.bean2json(new AjaxResult(ResultStatus.UPLOAD_ERROR_CODE,ResultStatus.UPLOAD_ERROR_STRING));
        }
        return null;

    }
}
