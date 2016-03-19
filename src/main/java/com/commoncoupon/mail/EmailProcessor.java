/*
 * $Id:  Exp $
 *
 * Copyright 2007 TimeLander, Inc. All rights reserved.
 * TimeLander PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

/**
 * This class is used to maintain a pool of threads and in each thread email notification is being 
 * sent.
 */
package com.commoncoupon.mail;

import java.util.Date;
import java.util.Properties;
import java.util.concurrent.Callable;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class EmailProcessor implements Callable<Integer> {

    static private final Log log = LogFactory.getLog(EmailProcessor.class);
    
    private String from;
    private Object[] to;
    private Object[] cc;
    private String subject = null;
    private String content = null;
    private String mimeType = null;
    
    public EmailProcessor(String from, Object[] to, Object[] cc, String subject, String content, String mimeType) {
        this.from = from;
        this.to = to;
        this.cc = cc;
        this.subject = subject;
        this.content = content;
        this.mimeType = mimeType;
    }

    /**
     * Retrieves a Mail session from Tomcat's Resource Factory (JNDI)
     */
    protected Session getSession() {
        Session session = null;
        try {
            Context envCtx = (Context) (new InitialContext()).lookup("java:comp/env/");
            session = (Session) envCtx.lookup("mail/Session"); 
            /*If you get exception here remove activation.jar and mail.jar from web-inf lib
			*It should be present in only tomcat/lib
			*/
            log.info("Returning session");
        } catch (NamingException ex) {
            log.error("cannot locate resource named 'mail/Session'.", ex);
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
         // Get the Session object.
            session = Session.getInstance(props,
            new javax.mail.Authenticator() {
               protected PasswordAuthentication getPasswordAuthentication() {
                  return new PasswordAuthentication("search2let@gmail.com", "Tol3t@dm!n321");
               }
            });
        }
        return session;
    }

    public Integer call() throws Exception {
        MimeMessage message = new MimeMessage(getSession());

        try {
            if (from != null && (from != null && from.trim() != "")) {
                InternetAddress sentFrom = new InternetAddress(from);
                message.setFrom(sentFrom);
                if (log.isDebugEnabled())
                    log.debug("Email sent from: " + sentFrom);
            }
    
            if (to != null && to.length > 0) {
                InternetAddress[] sendTo = new InternetAddress[to.length];
                for (int i = 0; i < to.length; i++) {
                    sendTo[i] = new InternetAddress((String) to[i]);
                    if (log.isDebugEnabled())
                        log.debug("Sending e-mail to: " + to[i]);
                }
                message.setRecipients(Message.RecipientType.TO, sendTo);
            }
    
            if (cc != null && cc.length > 0) {
                InternetAddress[] copyTo = new InternetAddress[cc.length];
                for (int i = 0; i < cc.length; i++) {
                    copyTo[i] = new InternetAddress((String) cc[i]);
                    if (log.isDebugEnabled())
                        log.debug("Copying e-mail to: " + cc[i]);
                }
                message.setRecipients(Message.RecipientType.CC, copyTo);
            }
            message.setSentDate(new Date());
            message.setSubject(subject);
            message.setContent(content, mimeType);
            Transport.send(message);
        } catch (Exception e) {
            log.error("Failed to send email.", e);
            return (1);
        }
        
        return (0);
    }
    
}