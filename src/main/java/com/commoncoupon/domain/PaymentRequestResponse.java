package com.commoncoupon.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author SHABARINATH
 * 21-Nov-2015 2:07:15 pm 2015 
 */

/**
 * Class which saves all requests that are made to create payment requests
 *
 * <p>
 *   <b>Description:</b> When user clicks on pay from our website we create a link to payment
 *   gateway where he needs to be redirected after payment link creation we get this as response.
 *   <b>Reference:</b>https://www.instamojo.com/developers/request-a-payment-api/#toc-create-new-payment-request
 * </p>
 */
@SuppressWarnings("serial")
@Entity
@Table(name="payment_request_response")
public class PaymentRequestResponse extends Persistent {
	
	@Column(name="payment_id")
	private String paymentId;
	@Column(name="phone")
	private String phone;
	@Column(name="email")
	private String email;
	@Column(name="buyer_name")
	private String buyerName;
	@Column(name="amount")
	private String amount;
	@Column(name="purpose")
	private String purpose;
	@Column(name="status")
	private String status;
	@Column(name="send_sms")
	private String sendSms;
	@Column(name="send_email")
	private String SendEmail;
	@Column(name="sms_status")
	private String smsStatus;
	@Column(name="email_status")
	private String emailStatus;
	@Column(name="short_url")
	private String shortUrl;
	@Column(name="long_url")
	private String longUrl;
	@Column(name="redirect_url")
	private String redirectUrl;
	@Column(name="webhook")
	private String webhook;
	@Column(name="created_at")
	private String createdAt;
	@Column(name="modified_at")
	private String modifiedAt;
	@Column(name="allow_repeated_payments")
	private boolean allowRepeatedPayments;
	@Column(name="is_success")
	private String isSuccess;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;
	
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSendSms() {
		return sendSms;
	}
	public void setSendSms(String sendSms) {
		this.sendSms = sendSms;
	}
	public String getSendEmail() {
		return SendEmail;
	}
	public void setSendEmail(String sendEmail) {
		SendEmail = sendEmail;
	}
	public String getSmsStatus() {
		return smsStatus;
	}
	public void setSmsStatus(String smsStatus) {
		this.smsStatus = smsStatus;
	}
	public String getEmailStatus() {
		return emailStatus;
	}
	public void setEmailStatus(String emailStatus) {
		this.emailStatus = emailStatus;
	}
	public String getShortUrl() {
		return shortUrl;
	}
	public void setShortUrl(String shortUrl) {
		this.shortUrl = shortUrl;
	}
	public String getLongUrl() {
		return longUrl;
	}
	public void setLongUrl(String longUrl) {
		this.longUrl = longUrl;
	}
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	public String getWebhook() {
		return webhook;
	}
	public void setWebhook(String webhook) {
		this.webhook = webhook;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getModifiedAt() {
		return modifiedAt;
	}
	public void setModifiedAt(String modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	public boolean isAllowRepeatedPayments() {
		return allowRepeatedPayments;
	}
	public void setAllowRepeatedPayments(boolean allowRepeatedPayments) {
		this.allowRepeatedPayments = allowRepeatedPayments;
	}
	public String getIsSuccess() {
		return isSuccess;
	}
	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
}
