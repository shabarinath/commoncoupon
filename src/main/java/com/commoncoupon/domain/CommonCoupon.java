package com.commoncoupon.domain;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

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
	
	public boolean isRedeemed() {
		return isRedeemed;
	}

	public void setRedeemed(boolean isRedeemed) {
		this.isRedeemed = isRedeemed;
	}

	
}
