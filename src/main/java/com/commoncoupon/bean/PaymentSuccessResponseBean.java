package com.commoncoupon.bean;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PaymentSuccessResponseBean {
	@JsonProperty("payment")
	PaymentSuccessBean[] paymentSuccessBean;
	
	@JsonProperty("success")
	private String isSuccess;

	public PaymentSuccessBean[] getPaymentSuccessBean() {
		return paymentSuccessBean;
	}

	public void setPaymentSuccessBean(PaymentSuccessBean[] paymentSuccessBean) {
		this.paymentSuccessBean = paymentSuccessBean;
	}

	public String getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}
	
}
