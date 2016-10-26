package com.commoncoupon.service;

import java.util.List;

import com.commoncoupon.dao.CouponDao;
import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.Coupon;
import com.commoncoupon.domain.CouponsCatalogue;
import com.commoncoupon.domain.OtherCoupon;
import com.commoncoupon.domain.Transaction;


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
	public CommonCoupon getUnPaidCommonCouponByPaymentRequestId(String paymentRequestId)
			throws Exception {
		return couponDao.getUnPaidCommonCouponByPaymentRequestId(paymentRequestId);
	}

	@Override
	public CommonCoupon getUnRedeemedCoupon(String couponId, String password)
			throws Exception {
		return couponDao.getUnRedeemedCoupon(couponId, password);
	}

	@Override
	public List<CouponsCatalogue> getSupportedCouponsList() throws Exception {
		return couponDao.getSupportedCouponsList();
	}

	@Override
	public List<OtherCoupon> getOtherCouponsPurchasedByUserId(long userId)
			throws Exception {
		return couponDao.getOtherCouponsPurchasedByUserId(userId);
	}

	@Override
	public List<Transaction> getTransactionsDoneByUser(long userId)
			throws Exception {
		return couponDao.getTransactionsDoneByUser(userId);
	}
	
}
