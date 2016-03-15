package com.commoncoupon.controller;

import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.commoncoupon.auth.AuthenticationContext;
import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.User;
import com.commoncoupon.service.CouponService;
import com.commoncoupon.service.PaymentService;
import com.commoncoupon.service.UserService;
import com.commoncoupon.utils.SecurityUtils;

/**
 * @author SHABARINATH
 * 08-Feb-2016 10:29:23 pm 2016 
 */

@Controller
@SessionAttributes("commonCoupon")
public class CouponRedeemController {

	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private UserService userDetailsService;
	
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value = "/redeemCommonCoupon", method = RequestMethod.POST)
	public String redeemCommonCoupon(@ModelAttribute CommonCoupon commonCoupon, BindingResult result, Model model) throws Exception {
		if(AuthenticationContext.getLoggedInUserEmail().isEmpty()) {
			throw new Exception("Invalid user session plz login again!!");
		}
		try{
			if(SecurityUtils.getLoggedInUser() == null) {
				throw new Exception("Cannot redeem without login !!");
			}
			if (validateRedemptionForm(commonCoupon, result)) {
				model.addAttribute("errors", result.getAllErrors());
				return "home/dashboard";
			}
			String couponId = commonCoupon.getCouponId();
			String password = commonCoupon.getPassword();
			CommonCoupon couponFromDB = couponService.getUnRedeemedCoupon(couponId, password);
			if(couponFromDB != null) {
				//User currentLoggedInUser = userDetailsService.getUserById(AuthenticationContext.getCurrentUserId());
				User currentLoggedInUser = userDetailsService.getUserByEmail(AuthenticationContext.getLoggedInUserEmail());
				long couponAmount = couponFromDB.getAmount();
				couponFromDB.setRedeemed(Boolean.TRUE);
				couponFromDB.setRedeemedBy(currentLoggedInUser);
				Calendar cal  = Calendar.getInstance();
				cal.add(Calendar.YEAR, +1);
				couponFromDB.setRedeemedAt(cal.getTime());
				long userWalletAmount = currentLoggedInUser.getAmount();
				userWalletAmount = userWalletAmount + couponAmount;
				currentLoggedInUser.setAmount(userWalletAmount);
				userDetailsService.saveUser(currentLoggedInUser);
				couponService.saveOrUpdateCommonCoupon(couponFromDB);
				model.addAttribute("walletAmount", userWalletAmount);
				couponService.saveOrUpdateCommonCoupon(couponFromDB);
				model.addAttribute("isRedeemSuccess", "true");
				return "home/dashboard";
			} else {
				model.addAttribute("invalidCoupon", "Invalid Coupon Details or Already redeemed!!!");
				return "home/dashboard";
			}
		}catch(Exception e) {
			logger.error("Exception occured in redeemCommonCoupon method reason: ", e);
		}
		return null;
	}
	
	/*@RequestMapping(value = "/redeemCommonCoupon", method = RequestMethod.POST)
	public ModelAndView printWelcome(@ModelAttribute CommonCoupon commonCoupon, BindingResult result, Model model) {

		ModelAndView mav = new ModelAndView("SubmitForm");
		mav.addObject("message", "Hello World!!!");
		return mav;

	}
	*/
	private boolean validateRedemptionForm(CommonCoupon commonCoupon, BindingResult result) {
		if(commonCoupon.getCouponId() == null || commonCoupon.getCouponId().length() <= 0) {
			result.rejectValue("couponId","","Cannot be Empty !!");
		}
		if(commonCoupon.getPassword() == null || commonCoupon.getPassword().length() <= 0) {
			result.rejectValue("password","","Cannot be Empty !!");
		}
		return (result.hasFieldErrors() || result.hasErrors());
	}
}

