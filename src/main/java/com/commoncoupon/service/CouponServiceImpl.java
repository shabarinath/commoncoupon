package com.commoncoupon.service;

import com.commoncoupon.dao.CouponDao;
import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.Coupon;


/**
 * @author SHABARINATH
 * 21-Nov-2015 7:47:50 pm 2015 
 */

public class CouponServiceImpl implements CouponService {

	private CouponDao couponDao;
	
	public CouponDao getCouponDao() {
		return couponDao;
	}

	public void setCouponDao(CouponDao couponDao) {
		this.couponDao = couponDao;
	}

	@Override
	public Coupon getCoupon(long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveCoupon(Coupon coupon) throws Exception {
		couponDao.saveCoupon(coupon);
	}

	@Override
	public void saveOrUpdateCommonCoupon(CommonCoupon commonCoupon) throws Exception {
		couponDao.saveCommonCoupon(commonCoupon);
	}

	@Override
	public CommonCoupon getCouponByPaymentRequestId(String paymentRequestId)
			throws Exception {
		return couponDao.getCommonCouponByPaymentRequestId(paymentRequestId);
	}
	
}
