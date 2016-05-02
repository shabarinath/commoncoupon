package com.commoncoupon.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author SHABARINATH
 * 21-Nov-2015 3:02:15 pm 2015 
 */

@SuppressWarnings("serial")
@Entity
@Table(name="coupon")
@DiscriminatorColumn(name = "class_code", discriminatorType = DiscriminatorType.STRING)
public class Coupon extends Persistent {

	@Column(name="status")
	private boolean status; //Set whether email or sms sent or not 
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="sender_id", nullable=false)
	private User sender;
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="recipient_id")
	private User recipient;
	@Column(name="amount")
	private Long amount;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_on")
	private Date createdOn;
	@Column(name="is_dispatched")
	private boolean isDispatched;

	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public User getRecipient() {
		return recipient;
	}
	public void setRecipient(User recipient) {
		this.recipient = recipient;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public boolean isDispatched() {
		return isDispatched;
	}
	public void setDispatched(boolean isDispatched) {
		this.isDispatched = isDispatched;
	}
}
