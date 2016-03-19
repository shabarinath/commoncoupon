package com.commoncoupon.domain;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * @author SHABARINATH
 * 20-Nov-2015 2:02:15 am 2015 
 */

@SuppressWarnings("serial")
@Entity
@DiscriminatorValue(value = "othercoupon")
public class OtherCoupon extends Coupon {
	
	@Column(name="company_name")
	private String companyName;

	public String getCompanyName() {
		return companyName;
	}
	
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	/*@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_time")
	private Date createdTime;


	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}*/
}
