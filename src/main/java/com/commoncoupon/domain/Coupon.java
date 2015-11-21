package com.commoncoupon.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="coupon")
@DiscriminatorColumn(name = "class_code", discriminatorType = DiscriminatorType.STRING)
public class Coupon {

	@Id
	@GeneratedValue
	@Column(name="id", nullable=false)
	private long id;
	@Column(name="coupon_id")
	private String couponId;  //Generate rand string as alphanumeric
	@Column(name="email_id")
	private String emailId; 
	@Column(name="status")
	private boolean status; //Set whether email or sms sent or not 
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="user_id", nullable=false)
	private User user;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_on")
	private Date createdOn;

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
