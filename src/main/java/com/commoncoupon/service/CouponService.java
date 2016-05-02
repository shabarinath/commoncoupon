package com.commoncoupon.service;

import java.util.List;

import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.Coupon;
import com.commoncoupon.domain.CouponsCatalogue;

/**
 * @author SHABARINATH
 * 21-Nov-2015 7:46:26 pm 2015 
 */

public interface CouponService {

	public Coupon getCoupon(long id) throws Exception;

	public void saveCoupon(Coupon coupon) throws Exception;

	public void saveOrUpdateCommonCoupon(CommonCoupon commonCoupon) throws Exception;

	public CommonCoupon getUnPaidCommonCouponByPaymentRequestId(
			String paymentRequestId) throws Exception;

	public CommonCoupon getUnRedeemedCoupon(String couponId, String password) throws Exception;

	public List<CouponsCatalogue> getSupportedCouponsList() throws Exception;
}

