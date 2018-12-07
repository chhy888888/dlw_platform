package com.dlw.monitor.platform.service.mail;

import java.io.File;
import java.util.Map;

public interface EmailService {
    /**
     * 发送简单邮件
     * @param sendTo 收件人
     * @param title  标题
     * @param content 内容
     */
    void sendSimpleMail(String[] sendTo, String title, String content);

    /**
     * 发送html邮件
     * @param sendTo 收件人
     * @param title  标题
     * @param html  内容，html
     */
    void sendHtmlMail(String[] sendTo, String title, String html);

    /**
     * 发送邮件（多个收件人，多个抄送人，多个附件）
     * @param contactEmails 收件人
     * @param cpEmials  抄送人
     * @param subject  主题
     * @param text    内容
     * @param attachments  附件
     */
    void sendAttachmentsMail(String[] contactEmails,String[] cpEmials,String subject,String text, Map<String, File> attachments);

}
