/*
 * $Id:  Exp $
 *
 * Copyright 2007 TimeLander, Inc. All rights reserved.
 * TimeLander PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package com.commoncoupon.mail;

public class MailServiceLocator {

	public static MailService getService(String mailType) {
		if (mailType.equalsIgnoreCase("default"))
			return new DefaultMailService();
		return null;
	}
}