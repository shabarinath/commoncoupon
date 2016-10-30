package com.commoncoupon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.commoncoupon.auth.AuthenticationContext;
import com.commoncoupon.constants.Constants;
import com.commoncoupon.domain.OtherCoupon;
import com.commoncoupon.domain.Transaction;
import com.commoncoupon.domain.User;
import com.commoncoupon.service.CouponService;
import com.commoncoupon.service.UserService;

/**
 * @author SHABARINATH
 * 24-Oct-2016 12:55:57 am 2016 
 */

@Controller
public class ProfileAndHistoryController {
	
private static final Logger log = LoggerFactory.getLogger(ProfileAndHistoryController.class);
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private UserService userDetailsService;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String getProfileDetails(Model model) throws Exception{
		try {
			User currentLoggedinUser = userDetailsService.getUserByEmail(AuthenticationContext.getLoggedInUserEmail());
			if(currentLoggedinUser == null) {
				model.addAttribute("error", Constants.SESSION_EXPIRED);
				return "error/error";
			}
			model.addAttribute("user", currentLoggedinUser);
			return "profile/profile";
		} catch(Exception e) {
			log.error("Unable to load Get Vouchers Page.", e);
			throw e;
		}
	}
	
	/*
	 * This method returns all transactions history for current loggedin user
	 */
	@RequestMapping(value = "/transactionHistory", method = RequestMethod.GET)
	public String getCommonCouponsPurchasedHistory(Model model, @RequestParam  String type) throws Exception{
		try {
			User currentLoggedinUser = userDetailsService.getCurrentLoggedInUser();
			if(currentLoggedinUser == null) {
				model.addAttribute("error", Constants.SESSION_EXPIRED);
				return "error/error";
			}
			if(type == null || type.trim().isEmpty()) {
				type = "commonCouponsPurchaseHistory"; //If type from request is empty by default assigning one
			}
			long userId = currentLoggedinUser.getId();
			if(type.equalsIgnoreCase("otherCouponsPurchaseHistory")) {
				List<OtherCoupon> otherCouponsBought = couponService.getOtherCouponsPurchasedByUserId(userId);
				model.addAttribute("transactions", otherCouponsBought);
			} else if (type.equalsIgnoreCase("commonCouponsPurchaseHistory")) {
				List<Transaction> commonCouponsPurchased = couponService.getTransactionsDoneByUser(userId);
				model.addAttribute("transactions", commonCouponsPurchased);
			} 
			//Later if required we can add below
			/*else if(type.equalsIgnoreCase("commonCouponsSentHistory")) {
				
			} else if(type.equalsIgnoreCase("commonCouponsReceivedHistory")) {
				
			}*/
			return "profile/transactions";
		} catch(Exception e) {
			log.error("Unable to load Get Vouchers Page.", e);
			throw e;
		}
	}


}

