package com.commoncoupon.utils;

import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.commoncoupon.bean.PaymentRequestResponseBean;
import com.commoncoupon.bean.PaymentSuccessResponseBean;
import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.PaymentRequestResponse;
import com.commoncoupon.domain.Transaction;

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

	public static Transaction getTransactionDetails(String paymentRequestId,
			String paymentId) {
		try {
			PaymentGatewayClient pgClient = PaymentGatewayClient.getInstance();
			PaymentSuccessResponseBean paymentCompletionResponseBean = pgClient.getPaymentDetails(paymentId);
			Transaction transaction = Utils.setBeanPropsToTransactionDetailsToObj(paymentCompletionResponseBean, paymentRequestId);
			if(transaction == null) {
				throw new Exception("Transaction is null");
			}
			return transaction;
		}catch(Exception e) {
			logger.error("Exception occufred while generating transaction reason: ", e);
		}
		return null;
	}

}

