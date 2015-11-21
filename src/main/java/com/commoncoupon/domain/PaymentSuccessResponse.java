package com.commoncoupon.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * Class which saves all success payment details to db 
 *
 * <p>
 *   <b>Description:</b> When a payment is done payment gateway send a response to webhook URL 
 *   through webservice we serialize the response and saves to database
 *   <b>Reference:</b>https://www.instamojo.com/developers/rest/
 * </p>
 */
@Entity
@Table(name="payment_success_response")
public class PaymentSuccessResponse {
	
	@Id
	@GeneratedValue
	@Column(name="id", nullable=false)
	private long id;
	@Column(name="amount")
	private String amount;
	@Column(name="buyer_email")
	private String buyerEmail;
	@Column(name="buyer_name")
	private String buyerName;
	@Column(name="buyer_phone")
	private String buyerPhone;
	@Column(name="currency")
	private String currency;
	@Column(name="fees")
	private String fees;
	@Column(name="long_url")
	private String longUrl;
	@Column(name="mac")
	private String mac;
	@Column(name="payment_id")
	private String paymentId;
	/**
	 * <p>
	 *   <b>Description:</b> This is the payment request id which is created during payment link creation
	 * </p>
	 */
	@Column(name="payment_request_id")
	private String paymentRequestId;
	@Column(name="purpose")
	private String purpose;
	@Column(name="shortUrl")
	private String shortUrl;
	@Column(name="status")
	private String status;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
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

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getFees() {
		return fees;
	}

	public void setFees(String fees) {
		this.fees = fees;
	}

	public String getLongUrl() {
		return longUrl;
	}

	public void setLongUrl(String longUrl) {
		this.longUrl = longUrl;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getShortUrl() {
		return shortUrl;
	}

	public void setShortUrl(String shortUrl) {
		this.shortUrl = shortUrl;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getPaymentRequestId() {
		return paymentRequestId;
	}

	public void setPaymentRequestId(String paymentRequestId) {
		this.paymentRequestId = paymentRequestId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
}
