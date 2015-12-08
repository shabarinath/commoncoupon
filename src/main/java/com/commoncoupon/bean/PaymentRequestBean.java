package com.commoncoupon.bean;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class PaymentRequestBean {
	
	@JsonProperty("id")
	private String id;
	@JsonProperty("phone")
	private String phone;
	@JsonProperty("email")
	private String email;
	@JsonProperty("buyer_name")
	private String buyerName;
	@JsonProperty("amount")
	private String amount;
	@JsonProperty("purpose")
	private String purpose;
	@JsonProperty("status")
	private String status;
	@JsonProperty("send_sms")
	private String sendSms;
	@JsonProperty("send_email")
	private String SendEmail;
	@JsonProperty("sms_status")
	private String smsStatus;
	@JsonProperty("email_status")
	private String emailStatus;
	@JsonProperty("shorturl")
	private String shortUrl;
	@JsonProperty("longurl")
	private String longUrl;
	@JsonProperty("redirect_url")
	private String redirectUrl;
	@JsonProperty("webhook")
	private String webhook;
	@JsonProperty("created_at")
	private String createdAt;
	@JsonProperty("modified_at")
	private String modifiedAt;
	@JsonProperty("allow_repeated_payments")
	private String allowRepeatedPayments;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getAllowRepeatedPayments() {
		return allowRepeatedPayments;
	}
	public void setAllowRepeatedPayments(String allowRepeatedPayments) {
		this.allowRepeatedPayments = allowRepeatedPayments;
	}
}
