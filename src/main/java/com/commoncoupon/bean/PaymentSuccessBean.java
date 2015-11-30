package com.commoncoupon.bean;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author SHABARINATH
 * 30-Nov-2015 11:58:33 pm 2015 
 */

public class PaymentSuccessBean {
	
	@JsonProperty("payment_id")
	private String paymentId;
	
	@JsonProperty("buyer_name")
	private String buyerName;
	
	@JsonProperty("buyer_phone")
	private String buyerPhone;

	@JsonProperty("status")
	private String status;
	
	@JsonProperty("currency")
	private String currency;
	
	@JsonProperty("amount")
	private String amount;
	
	@JsonProperty("fees")
	private String paymentGateWayFees;
	
	@JsonProperty("created_at")
	private String createdAt;
}

