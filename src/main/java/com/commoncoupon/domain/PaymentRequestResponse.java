package com.commoncoupon.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;


@JsonIgnoreProperties(ignoreUnknown = true)
public class PaymentRequestResponse {
	@JsonProperty("payment_request")
	private PaymentRequest paymentRequest;
	
	@JsonProperty("success")
	private String isSuccess;

	public PaymentRequest getPaymentRequest() {
		return paymentRequest;
	}

	public void setPaymentRequest(PaymentRequest paymentRequest) {
		this.paymentRequest = paymentRequest;
	}

	public String getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}
}
