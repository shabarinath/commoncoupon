package com.commoncoupon.dao;

import java.util.List;

import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.Coupon;
import com.commoncoupon.domain.CouponsCatalogue;

/**
 * @author SHABARINATH
 * 21-Nov-2015 11:55:20 pm 2015 
 */

public interface CouponDao {

	public void saveCoupon(Coupon coupon) throws Exception;

	public void saveCommonCoupon(CommonCoupon commonCoupon) throws Exception;

	public CommonCoupon getUnPaidCommonCouponByPaymentRequestId(String paymentRequestId) throws Exception;

	public CommonCoupon getUnRedeemedCoupon(String couponId, String password)  throws Exception;

	public List<CouponsCatalogue> getSupportedCouponsList() throws Exception;

}

