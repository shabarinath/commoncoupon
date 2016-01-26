/*
 * $Id:  Exp $
 *
 * Copyright 2007 TimeLander, Inc. All rights reserved.
 * TimeLander PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.commoncoupon.mail;

@SuppressWarnings("serial")
public class TemplateProcessException extends Exception {
	
	public TemplateProcessException() {
	}

	public TemplateProcessException(String message) {
		super(message);
	}

	public TemplateProcessException(String message, Throwable cause) {
		super(message, cause);
	}

	public TemplateProcessException(Throwable cause) {
		super(cause);
	}
}
