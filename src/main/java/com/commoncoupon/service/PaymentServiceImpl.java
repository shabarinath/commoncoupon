package com.commoncoupon.service;

import com.commoncoupon.dao.PaymentDao;
import com.commoncoupon.domain.PaymentRequestResponse;


/**
 * @author SHABARINATH
 * 30-Nov-2015 12:45:42 am 2015 
 */

public class PaymentServiceImpl implements PaymentService {

	private PaymentDao paymentDao;

	public PaymentDao getPaymentDao() {
		return paymentDao;
	}

	public void setPaymentDao(PaymentDao paymentDao) {
		this.paymentDao = paymentDao;
	}

	@Override
	public void savePaymentRequest(PaymentRequestResponse paymentRequestDetails)
			throws Exception {
		paymentDao.savePaymentRequest(paymentRequestDetails);
	}
}

