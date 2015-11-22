package com.commoncoupon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.commoncoupon.service.CouponService;

/**
 * @author SHABARINATH
 * 21-Nov-2015 7:41:17 pm 2015 
 */

@Controller
@SessionAttributes("coupon")
public class CouponController {
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	@Autowired
	private CouponService couponService;
}

