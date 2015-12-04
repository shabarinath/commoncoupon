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
	
	@JsonProperty("buyer_email")
	private String buyerEmail;

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

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getPaymentGateWayFees() {
		return paymentGateWayFees;
	}

	public void setPaymentGateWayFees(String paymentGateWayFees) {
		this.paymentGateWayFees = paymentGateWayFees;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
}

