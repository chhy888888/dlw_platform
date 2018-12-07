package com.dlw.monitor.platform.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dlw.monitor.platform.model.AjaxResult;
import com.dlw.monitor.platform.mypublicClass.ConvertToJson;
import com.dlw.monitor.platform.mypublicClass.ResultStatus;
import com.dlw.monitor.platform.service.mail.EmailService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 发送邮件
 * @author  liqian
 */
@RestController
@RequestMapping("/mail")
public class MailController {

  @Resource
  private EmailService emailService;

    @PostMapping(value="/send",produces = {"application/json;charset=UTF-8"})
    public String send(HttpServletRequest request){
        try {
            String[] sendTo = request.getParameterValues("sendTo");
            String title = "测试邮件标题";
            String content = "测试邮件内容";
            emailService.sendSimpleMail(sendTo, title, content);
            return ConvertToJson.bean2json(new AjaxResult(ResultStatus.SEND_SUCCESS_STRING));
        }catch (Exception e){
            e.printStackTrace();
            return ConvertToJson.bean2json(new AjaxResult(ResultStatus.SEND_ERROR_CODE,ResultStatus.SEND_ERROR_STRING));
        }

    }

}
