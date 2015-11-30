package com.commoncoupon.utils;

import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.commoncoupon.bean.PaymentRequestResponseBean;
import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.PaymentRequestResponse;

/**
 * @author SHABARINATH
 * 30-Nov-2015 12:18:25 am 2015 
 */

public class PaymentUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentUtil.class);

	public static PaymentRequestResponse generatePaymentRequest(CommonCoupon commonCoupon) {
		try {
			PaymentGatewayClient pgClient = PaymentGatewayClient.getInstance();
			PaymentRequestResponseBean paymentRequestResponseBean = pgClient.createPaymentLink(commonCoupon);
			PaymentRequestResponse requestResponseObj = Utils.setPaymentRequestResponseToObj(paymentRequestResponseBean);
			if(requestResponseObj != null) {
				Log.info("Payment Request Response: "+requestResponseObj.getRedirectUrl());
			}
			return requestResponseObj;
		}catch(Exception e) {
			logger.error("Exception occured in generatePaymentRequest(): ", e);
		}
		return null;
	}

}

