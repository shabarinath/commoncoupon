package com.commoncoupon.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author SHABARINATH
 * 21-Nov-2015 10:02:15 am 2015 
 */

@SuppressWarnings("serial")
@Entity
@DiscriminatorValue(value = "commoncoupon")
public class CommonCoupon extends Coupon {
	@Column(name="is_redeemed", columnDefinition="false")
	private boolean isRedeemed;
	
	/**
	 * Status of payment for coupon
	 * <p>
	 *   <b>Note:</b> By default we set payment status for coupon as NOT_INITIATED and after payment is done we update 
	 *   the transaction status as FAILED or SUCCESS after transaction is done
	 * </p>
	 */
	@Enumerated(EnumType.STRING)
	@Column(name="payment_status", nullable=false)
	private PaymentStatus paymentStatus;
	
	/**
	 * Once we create payment request link using instamojo set paymentrequestId from response here
	 */
	@Column(name="payment_request_id", columnDefinition="false")
	private String paymentRequestId;
	
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="redeemed_by")
	private User redeemedBy;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="redeemed_at")
	private Date redeemedAt;
	
	public String getPaymentRequestId() {
		return paymentRequestId;
	}

	public void setPaymentRequestId(String paymentRequestId) {
		this.paymentRequestId = paymentRequestId;
	}

	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public boolean isRedeemed() {
		return isRedeemed;
	}

	public void setRedeemed(boolean isRedeemed) {
		this.isRedeemed = isRedeemed;
	}

	public User getRedeemedBy() {
		return redeemedBy;
	}

	public void setRedeemedBy(User redeemedBy) {
		this.redeemedBy = redeemedBy;
	}

	public Date getRedeemedAt() {
		return redeemedAt;
	}

	public void setRedeemedAt(Date redeemedAt) {
		this.redeemedAt = redeemedAt;
	}

	
}
