package com.commoncoupon.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.IndexColumn;

/**
 * @author SHABARINATH
 * 06-Nov-2015 11:02:15 pm 2015 
 */

@SuppressWarnings("serial")
@Entity
@Table(name="users")
@DiscriminatorColumn(name = "TYPE", discriminatorType = DiscriminatorType.STRING)
public class User extends Persistent{
	
	@Column(name="first_name")
	private String firstName; 
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="password")
	private String password;
	
	@Column(name="email")
	private String email;
	
	@Column(name="active",nullable=false)
	private boolean active=true;
	
	@Column(name="account_expired",nullable=false)
	private boolean accountExpired=false;
	
	@Column(name="credentials_expired",nullable=false)
	private boolean credentialsExpired=false; 
	
	@Column(name="account_locked",nullable=false)
	private boolean accountLocked = false;
	
	@Column(name="mobile_number")
	private String mobileNumber; 
	
	@OneToMany(mappedBy="user",fetch=FetchType.EAGER,cascade={CascadeType.ALL,CascadeType.MERGE})
	private List<UserRole> userRoles = new ArrayList<UserRole>();
	
	@Transient
	private transient String currentPassword;
	
	@Transient
	private transient String confirmPassword;
	
	/**
	 * Amount present in user wallet
	 *
	 * <p>
	 *   <b>Note:</b> amount by default should be zero
	 * </p>
	 */
	@Column(name="amount",nullable=false)
	private long amount;
	
	/**
	 * Method saves all success payments against user
	 *
	 * <p>
	 *   <b>Note:</b> We get email for success payments response get user by email id and set payments to user
	 *   <b>Reference:</b>https://www.instamojo.com/developers/request-a-payment-api/#toc-webhook
	 * </p>
	 */
	@OneToMany(fetch=FetchType.LAZY)
    @JoinTable(name="payment_user_mapping", joinColumns = { 
        @JoinColumn(name="sender_id", nullable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="payment_id", nullable=false, updatable=false) 
    })
	@IndexColumn(name = "list_index")
	List<PaymentSuccessResponse> successPayments = new ArrayList<PaymentSuccessResponse>();
	
	
	@OneToMany(fetch=FetchType.LAZY)
    @JoinTable(name="user_coupon_mapping", joinColumns = { 
        @JoinColumn(name="user_id", nullable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="coupon_id", nullable=false, updatable=false) 
    })
	@IndexColumn(name = "list_index")
	List<Coupon> coupons = new ArrayList<Coupon>();
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean getAccountExpired() {
		return accountExpired;
	}

	public void setAccountExpired(boolean accountExpired) {
		this.accountExpired = accountExpired;
	}

	public boolean getCredentialsExpired() {
		return credentialsExpired;
	}

	public void setCredentialsExpired(boolean credentialsExpired) {
		this.credentialsExpired = credentialsExpired;
	}

	public boolean getAccountLocked() {
		return accountLocked;
	}

	public void setAccountLocked(boolean accountLocked) {
		this.accountLocked = accountLocked;
	}
	
	public List<UserRole> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(List<UserRole> userRoles) {
		this.userRoles = userRoles;
	}

	public String getCurrentPassword() {
		return currentPassword;
	}

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public List<PaymentSuccessResponse> getSuccessPayments() {
		return successPayments;
	}

	public void setSuccessPayments(List<PaymentSuccessResponse> successPayments) {
		this.successPayments = successPayments;
	}

	public List<Coupon> getCoupons() {
		return coupons;
	}

	public void setCoupons(List<Coupon> coupons) {
		this.coupons = coupons;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
}
