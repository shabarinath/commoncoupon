package com.commoncoupon.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.Coupon;
import com.commoncoupon.domain.CouponsCatalogue;
import com.commoncoupon.domain.OtherCoupon;
import com.commoncoupon.domain.PaymentStatus;
import com.commoncoupon.domain.Transaction;

/**
 * @author SHABARINATH
 * 21-Nov-2015 11:55:51 pm 2015 
 */

public class CouponDaoImpl implements CouponDao {
	
	private HibernateTemplate hibernateTemplate;
	
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	@Override
	public void saveCoupon(Coupon coupon) throws Exception {
		hibernateTemplate.saveOrUpdate(coupon);
	}

	@Override
	public void saveCommonCoupon(CommonCoupon commonCoupon) throws Exception {
		hibernateTemplate.saveOrUpdate(commonCoupon);
	}

	@SuppressWarnings("unchecked")
	@Override
	public CommonCoupon getUnPaidCommonCouponByPaymentRequestId(String paymentRequestId)
			throws Exception {
		//from CommonCoupon commonCoupon WHERE commonCoupon.paymentRequestId = ? AND commonCoupon.isRedeemed = ? AND coupon.paymentStatus != ?
		List<CommonCoupon> commonCoupon = hibernateTemplate.find("from CommonCoupon commonCoupon WHERE commonCoupon.paymentRequestId = ? AND commonCoupon.paymentStatus = ?", paymentRequestId, PaymentStatus.NOT_INITIATED/*, false, PaymentStatus.SUCCESS*/);
		if(commonCoupon.size()>0) 
			return commonCoupon.get(0);
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public CommonCoupon getUnRedeemedCoupon(String couponId, String password)
			throws Exception {
		List<CommonCoupon> commonCoupon = hibernateTemplate.find("from CommonCoupon commonCoupon WHERE commonCoupon.couponId = ? AND commonCoupon.password = ? AND commonCoupon.isRedeemed = ? ", couponId, password, Boolean.FALSE);
		if(commonCoupon.size()>0)
			return commonCoupon.get(0);
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CouponsCatalogue> getSupportedCouponsList() throws Exception {
		List<CouponsCatalogue> supportedCouponsList = hibernateTemplate.find("from CouponsCatalogue");
		return supportedCouponsList;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<OtherCoupon> getOtherCouponsPurchasedByUserId(long userId)
			throws Exception {
		List<OtherCoupon> otherCoupons = hibernateTemplate.find("FROM OtherCoupon oc WHERE oc.sender.id = ? ORDER BY oc.createdOn DESC", userId);
		return otherCoupons;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Transaction> getTransactionsDoneByUser(long userId)
			throws Exception {
		List<Transaction> transactionsList = hibernateTemplate.find("FROM Transaction t WHERE t.buyer.id = ? ORDER BY t.createdTime DESC", userId);
		return transactionsList;
	}
}

