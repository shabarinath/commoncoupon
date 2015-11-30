package com.commoncoupon.dao;

import com.commoncoupon.domain.PaymentRequestResponse;

/**
 * @author SHABARINATH
 * 30-Nov-2015 12:56:45 am 2015 
 */

public interface PaymentDao {

	void savePaymentRequest(PaymentRequestResponse paymentRequestDetails) throws Exception ;

}

