package com.commoncoupon.service;

import com.commoncoupon.domain.PaymentRequestResponse;
import com.commoncoupon.domain.Transaction;

/**
 * @author SHABARINATH
 * 30-Nov-2015 12:45:12 am 2015 
 */

public interface PaymentService {

	void savePaymentRequest(PaymentRequestResponse paymentRequestDetails) throws Exception ;

	void saveTransactionDetails(Transaction transactionDetails) throws Exception ; 

}

