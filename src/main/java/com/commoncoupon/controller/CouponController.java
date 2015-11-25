package com.commoncoupon.controller;

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

import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.Recipient;
import com.commoncoupon.domain.Sender;
import com.commoncoupon.domain.User;
import com.commoncoupon.service.CouponService;
import com.commoncoupon.service.UserService;
import com.commoncoupon.utils.Utils;

/**
 * @author SHABARINATH
 * 21-Nov-2015 7:41:17 pm 2015 
 */

@Controller
@SessionAttributes("CommonCoupon")
public class CouponController {
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private UserService userDetailsService;
	
	@RequestMapping(value = "/saveCoupon", method = RequestMethod.POST)
	public String saveCoupon(@ModelAttribute CommonCoupon commonCoupon, BindingResult result, Model model) throws Exception {
		try {
			if (validateFormData(commonCoupon, result)) {
				return "home/home";
			}
			

			String couponCode = Utils.generateCouponCode();
			commonCoupon.setCouponId(couponCode);
			commonCoupon.setPassword("change.me");//TODO:set it dynamically
			commonCoupon.setRedeemed(false);
			commonCoupon.setStatus(false);
			Sender senderFromDb = (Sender) userDetailsService.getUserByEmail(commonCoupon.getSender().getEmail());
			if(senderFromDb == null) {
				/*
				 * Creating sender and receiver(recipient is optional) users when coupon is created 
				 */
				//Creating Sender here
				Sender sender = new Sender();
				sender.setFirstName(commonCoupon.getSender().getFirstName());
				sender.setLastName(commonCoupon.getSender().getLastName());
				sender.setEmail(commonCoupon.getSender().getEmail());
				sender.setMobileNumber(commonCoupon.getSender().getMobileNumber());
				PasswordEncoder passEn = new PasswordEncoder();
				sender.setPassword(passEn.encodePassword("change.me", null));
				commonCoupon.setSender(sender);
			} else {
				commonCoupon.setSender(senderFromDb);
			}
			if(commonCoupon.getRecipient() != null && commonCoupon.getRecipient().getEmail() != null) {
				Recipient recipientFromDb = (Recipient) userDetailsService.getUserByEmail(commonCoupon.getSender().getEmail());
				if(recipientFromDb == null) {
					//Creating Recipient here
					Recipient recipient = new Recipient();
					recipient.setEmail(commonCoupon.getRecipient().getEmail());
					commonCoupon.setRecipient(recipient);
				} else {
					commonCoupon.setRecipient(recipientFromDb);
				}
			}
			couponService.saveCommonCoupon(commonCoupon);
		} catch(Exception e) {
			logger.error("Exception occured while saving coupon reason: "+e);
		}
		return "home/success";
	}
	
	private boolean validateFormData(CommonCoupon commonCoupon, BindingResult result) {
		if (Utils.isEmpty(commonCoupon.getSender().getEmail())) {
			result.rejectValue("sender.email","","Cannot be Empty !!");
		} 
		if(Utils.isEmpty(commonCoupon.getSender().getFirstName())) {
			result.rejectValue("sender.firstName","","Cannot be Empty !!");
		} 
		if(Utils.isEmpty(commonCoupon.getSender().getLastName())) {
			result.rejectValue("sender.lastName","","Cannot be Empty !!");
		}
		if(Utils.isEmpty(commonCoupon.getSender().getMobileNumber())) {
			result.rejectValue("sender.mobileNumber","","Cannot be Empty !!");
		} 
		return (result.hasFieldErrors() || result.hasErrors());
	}
}

