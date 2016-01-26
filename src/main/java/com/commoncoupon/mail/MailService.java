/*
 * $Id:  Exp $
 *
 * Copyright 2007 TimeLander, Inc. All rights reserved.
 * TimeLander PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.commoncoupon.mail;

/**
 * MailService.java
 */
public interface MailService {
    
    public void sendMessage(Object[] to, Object[] cc, String subject, String content, String format)
            throws MailException;
    
}