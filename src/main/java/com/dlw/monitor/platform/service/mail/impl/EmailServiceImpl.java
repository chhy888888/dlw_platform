package com.dlw.monitor.platform.service.mail.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dlw.monitor.platform.mypublicClass.EmailConfig;
import com.dlw.monitor.platform.service.mail.EmailService;

import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.Map;
import java.util.Set;

@Service(value="EmailService")
public class EmailServiceImpl implements EmailService {
    @Autowired
    private EmailConfig emailConfig;
    @Autowired
    private JavaMailSender mailSender;

    public void sendSimpleMail(String[] sendTo, String title, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(emailConfig.getEmailFrom());
        message.setTo(sendTo);
        message.setSubject(title);
        message.setText(content);
        mailSender.send(message);
    }

    public void sendHtmlMail(String[] sendTo, String title, String html) {
        MimeMessage message = mailSender.createMimeMessage();
        try{
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(emailConfig.getEmailFrom());
            helper.setTo(sendTo);
            helper.setSubject(title);
            helper.setText(html, true);
        }catch(Exception e){
            e.printStackTrace();
        }
        mailSender.send(message);
    }

    public void sendAttachmentsMail(String[] contactEmails, String[] cpEmials, String subject, String text, Map<String,File> attachments) {
        MimeMessage message = mailSender.createMimeMessage();
        try{
            MimeMessageHelper helper = new MimeMessageHelper(message,true);
            helper.setFrom(emailConfig.getEmailFrom());
            helper.setSubject(subject);
            helper.setTo(contactEmails);
            helper.setCc(cpEmials);
            helper.setText(text);
            if(attachments!=null && !attachments.isEmpty()){
                Set<Map.Entry<String,File>> fileSet = attachments.entrySet();
                for (Map.Entry f : fileSet) {
                    helper.addAttachment((String) f.getKey(), (File) f.getValue());
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        mailSender.send(message);
    }
}
