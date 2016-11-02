package com.commoncoupon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.commoncoupon.auth.AuthenticationContext;
import com.commoncoupon.constants.Constants;
import com.commoncoupon.domain.OtherCoupon;
import com.commoncoupon.domain.Transaction;
import com.commoncoupon.domain.User;
import com.commoncoupon.service.CouponService;
import com.commoncoupon.service.UserService;
import com.commoncoupon.utils.Utils;

/**
 * @author SHABARINATH
 * 24-Oct-2016 12:55:57 am 2016 
 */

@Controller
@SessionAttributes("user")
public class ProfileAndHistoryController {
	
private static final Logger log = LoggerFactory.getLogger(ProfileAndHistoryController.class);
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private UserService userDetailsService;
	
	@RequestMapping(value = "/saveProfile", method = RequestMethod.POST)
	public String saveProfile(@ModelAttribute User user, BindingResult result, Model model) throws Exception {
		try {
			if (validateFormData(user, result)) {
				return "profile/userProfileForm";
			}
			User currentLoggedinUser = userDetailsService.getCurrentLoggedInUser();
			currentLoggedinUser.setFirstName(user.getFirstName());
			currentLoggedinUser.setLastName(user.getLastName());
			PasswordEncoder passEn = new PasswordEncoder();
			currentLoggedinUser.setPassword(passEn.encodePassword(user.getPassword(), null));
			userDetailsService.saveUser(currentLoggedinUser);
		}catch(Exception e) {
			log.error("Exception occured while saving profile reason: ", e);
		}
		model.addAttribute("msg", "Account Details Update Successfully !!");
		return "home/success";
	}
	
	private boolean validateFormData(User user, BindingResult result) throws Exception {
		if (Utils.isEmpty(user.getFirstName())) {
			result.rejectValue("firstName","","First Name is mandatory");
		}
		if (Utils.isEmpty(user.getLastName())) {
			result.rejectValue("lastName","","Last Name is mandatory");
		} 
		if(!Utils.isEmpty(user.getCurrentPassword()) && Utils.isEmpty(user.getPassword())) {
			result.rejectValue("password", "", "Please Enter Password");
		}
		if(Utils.isEmpty(user.getCurrentPassword()) && !Utils.isEmpty(user.getPassword())) {
			result.rejectValue("currentPassword", "", "Please Enter Password");
		} else if(!Utils.isEmpty(user.getCurrentPassword()) && !Utils.isEmpty(user.getPassword())) {
			PasswordEncoder passEn = new PasswordEncoder();
			User currentLoggedInUser = userDetailsService.getCurrentLoggedInUser();
			if(!passEn.isPasswordValid(currentLoggedInUser.getPassword(), user.getCurrentPassword(), null)) {
				result.rejectValue("currentPassword", "", "Incorrect Password !!");
			}
		}
		return (result.hasFieldErrors() || result.hasErrors());
	}
	
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
	
	@RequestMapping(value = "/loadProfileForm", method = RequestMethod.GET)
	public String getProfileForm(Model model) throws Exception{
		try {
			User currentLoggedinUser = userDetailsService.getCurrentLoggedInUser();
			if(currentLoggedinUser == null) {
				model.addAttribute("error", Constants.SESSION_EXPIRED);
				return "error/error";
			}
			model.addAttribute("user", currentLoggedinUser);
			return "profile/userProfileForm";
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

