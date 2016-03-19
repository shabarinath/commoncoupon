package com.commoncoupon.bean;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;


@JsonIgnoreProperties(ignoreUnknown = true)
public class PaymentRequestResponseBean {
	@JsonProperty("payment_request")
	private PaymentRequestBean paymentRequestBean;
	
	@JsonProperty("success")
	private String isSuccess;

	public PaymentRequestBean getPaymentRequest() {
		return paymentRequestBean;
	}

	public void setPaymentRequest(PaymentRequestBean paymentRequest) {
		this.paymentRequestBean = paymentRequest;
	}

	public String getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}
}
