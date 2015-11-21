package com.commoncoupon.domain;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;


@Entity
@DiscriminatorValue(value = "commoncoupon")
public class CommonCoupon extends Coupon {
	
	@Column(name="is_redeemed", columnDefinition="false")
	private boolean isRedeemed;
	
}
