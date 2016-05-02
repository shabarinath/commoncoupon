package com.commoncoupon.domain;

import java.util.List;

/**
 * @author SHABARINATH
 * 30-Apr-2016 11:41:12 am 2016 
 */


/*
 * This wrapper is used to maintain all supported
 * coupons as list and send as modal attribute to 
 * frontend
 */
public class CouponsCatalogueWrapper {
	
	private List<CouponsCatalogue> couponsList;

	public List<CouponsCatalogue> getCouponsList() {
		return couponsList;
	}

	public void setCouponsList(List<CouponsCatalogue> couponsList) {
		this.couponsList = couponsList;
	}

}

