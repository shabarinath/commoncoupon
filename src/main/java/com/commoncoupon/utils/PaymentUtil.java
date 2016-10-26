package com.commoncoupon.utils;

import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.commoncoupon.bean.PaymentRequestBean;
import com.commoncoupon.bean.PaymentRequestResponseBean;
import com.commoncoupon.bean.PaymentSuccessResponseBean;
import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.PaymentRequestResponse;
import com.commoncoupon.domain.Transaction;
import com.commoncoupon.domain.User;

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
			String paymentId, CommonCoupon coupon, User buyer) {
		try {
			PaymentGatewayClient pgClient = PaymentGatewayClient.getInstance();
			PaymentSuccessResponseBean paymentCompletionResponseBean = pgClient.getPaymentDetails(paymentId);
			Transaction transaction = Utils.setBeanPropsToTransactionDetailsToObj(paymentCompletionResponseBean, paymentRequestId
					,coupon, buyer);
			if(transaction == null) {
				throw new Exception("Transaction is null");
			}
			return transaction;
		}catch(Exception e) {
			logger.error("Exception occufred while generating transaction reason: ", e);
		}
		return null;
	}

	public static PaymentRequestBean preparePaymentBean(
			CommonCoupon commonCoupon) {
		try {
			if(commonCoupon != null) {
				User sender = commonCoupon.getSender();
				PaymentRequestBean paymentBean = new PaymentRequestBean();
				paymentBean.setAmount(String.valueOf(commonCoupon.getAmount()));
				paymentBean.setBuyerName(sender.getFirstName().concat(sender.getLastName()));
				paymentBean.setEmail(sender.getEmail());
				paymentBean.setPhone(sender.getMobileNumber());
				paymentBean.setPurpose("Payment For Gift Card");
				paymentBean.setRedirectUrl(Configuration.getProperty("payment.gateway.redirect.url"));
				paymentBean.setAllowRepeatedPayments("False");
				return paymentBean;
			}
		}catch(Exception e) {
			logger.error("Exception occured while preparing payment bean reason: ", e);
		}
		return null;
	}

}

