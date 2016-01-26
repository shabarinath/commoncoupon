/*
 * $Id:  Exp $
 *
 * Copyright 2007 TimeLander, Inc. All rights reserved.
 * TimeLander PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package com.commoncoupon.mail;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * LocalMailService.java
 */
public class DefaultMailService implements MailService {

    private static final String FROM_ADDR = "CommonCoupon<autoreply@commoncoupon.com>";

    private static final int NO_OF_THREADS = 1;

    private static final ExecutorService threadPool = Executors.newFixedThreadPool(NO_OF_THREADS);

    public static void init() {
        
    }
    
    public void sendMessage(Object[] to, Object[] cc, String subject, String content, String format)
            throws MailException {
        
        threadPool.submit(new EmailProcessor(FROM_ADDR, to, cc, subject, content, "text/" + format + "; charset=UTF-8"));
    }

}