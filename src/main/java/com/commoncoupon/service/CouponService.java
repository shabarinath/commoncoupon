package com.commoncoupon.service;

import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.Coupon;

/**
 * @author SHABARINATH
 * 21-Nov-2015 7:46:26 pm 2015 
 */

public interface CouponService {

	public Coupon getCoupon(long id) throws Exception;

	public void saveCoupon(Coupon coupon) throws Exception;

	public void saveOrUpdateCommonCoupon(CommonCoupon commonCoupon) throws Exception;

	public CommonCoupon getCouponByPaymentRequestId(
			String paymentRequestId) throws Exception;
}

