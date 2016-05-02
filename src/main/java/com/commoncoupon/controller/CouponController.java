package com.commoncoupon.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.PaymentRequestResponse;
import com.commoncoupon.domain.PaymentStatus;
import com.commoncoupon.domain.User;
import com.commoncoupon.domain.UserRole;
import com.commoncoupon.service.CouponService;
import com.commoncoupon.service.PaymentService;
import com.commoncoupon.service.UserService;
import com.commoncoupon.utils.PaymentUtil;
import com.commoncoupon.utils.RandomString;
import com.commoncoupon.utils.Utils;

/**
 * @author SHABARINATH
 * 21-Nov-2015 7:41:17 pm 2015 
 */

@Controller
@SessionAttributes("commonCoupon")
public class CouponController {
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private UserService userDetailsService;
	
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value = "/saveCoupon", method = RequestMethod.POST)
	public String saveCoupon(@ModelAttribute CommonCoupon commonCoupon, BindingResult result, Model model) throws Exception {
		PaymentRequestResponse paymentRequestDetails = null;
		try {
			if (validateFormData(commonCoupon, result)) {
				model.addAttribute("errors", result.getAllErrors());
				model.addAttribute("hasErrors", "true");
				FieldError senderFirstNameError = result.getFieldError("sender.firstName");
				FieldError senderLastNameError = result.getFieldError("sender.lastName");
				FieldError senderEmailError = result.getFieldError("sender.email");
				FieldError senderMobileError = result.getFieldError("sender.mobileNumber");
				FieldError recipientEmailError = result.getFieldError("recipient.email");
				FieldError amountError = result.getFieldError("amount");
				if(amountError != null) {
					model.addAttribute("divId", "#leaf_1");
				} else if(senderFirstNameError != null || senderLastNameError!= null
						|| senderEmailError != null || senderMobileError != null) {
					model.addAttribute("divId", "#leaf_2");
				} else if(recipientEmailError != null) {
					model.addAttribute("divId", "#leaf_3");
				}
				return "home/home";
			}
			User sender = userDetailsService.getUserByEmail(commonCoupon.getSender().getEmail());
			if(sender == null) {
				 /** Creating sender and receiver(recipient is optional) users when coupon is created */
				//Creating Sender here
				sender = new User();
				sender.setFirstName(commonCoupon.getSender().getFirstName());
				sender.setLastName(commonCoupon.getSender().getLastName());
				sender.setEmail(commonCoupon.getSender().getEmail());
				sender.setMobileNumber(commonCoupon.getSender().getMobileNumber());
				String randPassword = Utils.generateCouponPassword();
				sender.setPassword(randPassword); 
				sender.setActive(Boolean.TRUE);
				UserRole userRole = new UserRole();
				userRole.setAuthority("ROLE_USER");
				userRole.setUser(sender);
				List<UserRole> userRoles = new ArrayList<UserRole>();
				userRoles.add(userRole);
				sender.setUserRoles(userRoles);
				commonCoupon.setSender(sender);
			} else {
				sender.setFirstName(commonCoupon.getSender().getFirstName());
				sender.setLastName(commonCoupon.getSender().getLastName());
				sender.setMobileNumber(commonCoupon.getSender().getMobileNumber());
				commonCoupon.setSender(sender);
			}
			paymentRequestDetails = PaymentUtil.generatePaymentRequest(commonCoupon);
			if(paymentRequestDetails == null || (paymentRequestDetails.getLongUrl() == null 
					&& paymentRequestDetails.getLongUrl().length() < 0)) {
				return "error/errorPage"; //TODO: Create error page here
			}
			paymentService.savePaymentRequest(paymentRequestDetails);
			commonCoupon.setPaymentRequestId(paymentRequestDetails.getPaymentRequestId());
			String couponCode = Utils.generateCouponCode();
			commonCoupon.setCouponId(couponCode);
			commonCoupon.setPaymentStatus(PaymentStatus.NOT_INITIATED); //Update this once transaction is success
			commonCoupon.setPassword(RandomString.generateCouponPassword());
			commonCoupon.setRedeemed(false);
			commonCoupon.setStatus(false);
			Calendar cal  = Calendar.getInstance();
			cal.add(Calendar.YEAR, +1);
			commonCoupon.setExpiryDate(cal.getTime());
			if(!Utils.isEmpty(commonCoupon.getRecipient().getEmail())) {
				//This block is to handle case where sender and recipient emails are same
				if(commonCoupon.getRecipient().getEmail().equalsIgnoreCase(commonCoupon.getSender().getEmail())) {
					commonCoupon.setRecipient(sender);
				}
			}
			if(commonCoupon.getRecipient() != null && commonCoupon.getRecipient().getEmail() != null
			&& !(commonCoupon.getRecipient().getEmail().equalsIgnoreCase(commonCoupon.getSender().getEmail()))) {
				User recipientFromDb =  userDetailsService.getUserByEmail(commonCoupon.getRecipient().getEmail());
				if(recipientFromDb == null) {
					//Creating Recipient here
					User recipient = new User();
					recipient.setEmail(commonCoupon.getRecipient().getEmail());
					//Assigning roles to user
					UserRole userRole = new UserRole();
					userRole.setAuthority("ROLE_USER");
					userRole.setUser(recipient);
					List<UserRole> userRoles = new ArrayList<UserRole>();
					userRoles.add(userRole);
					recipient.setUserRoles(userRoles);
					commonCoupon.setRecipient(recipient);
				} else {
					commonCoupon.setRecipient(recipientFromDb);
				}
			}
			couponService.saveOrUpdateCommonCoupon(commonCoupon);
			model.addAttribute("coupon", commonCoupon);
			model.addAttribute("redirectUrl", paymentRequestDetails.getLongUrl());
			return "misc/redirect";
		} catch(Exception e) {
			logger.error("Exception occured while saving coupon reason: "+e);
		}
		return null;
	}
	
	private boolean validateFormData(CommonCoupon commonCoupon, BindingResult result) {
		if(commonCoupon.getAmount() == null) {
			result.rejectValue("amount","","Cannot be Empty !!");
		}
		if(commonCoupon.getAmount() == null) {
			result.rejectValue("amount","","Cannot be Empty !!");
		}
		if(commonCoupon.getAmount() != null && (commonCoupon.getAmount() < 9 || commonCoupon.getAmount() > 5000)) {
			result.rejectValue("amount","","Enter between 9 and 5000");
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
		if (Utils.isEmpty(commonCoupon.getSender().getEmail())) {
			result.rejectValue("sender.email","","Cannot be Empty !!");
		} else {
			Utils util = new Utils();
			boolean isValidEmailAddress = util.isValidEmail(commonCoupon.getSender().getEmail());
			if(!isValidEmailAddress) {
				result.rejectValue("sender.email","","Not a valid Email !!");
			}
		}
		if (Utils.isEmpty(commonCoupon.getRecipient().getEmail())) {
			result.rejectValue("recipient.email","","Cannot be Empty !!");
		} else {
			Utils util = new Utils();
			boolean isValidEmailAddress = util.isValidEmail(commonCoupon.getRecipient().getEmail());
			if(!isValidEmailAddress) {
				result.rejectValue("recipient.email","","Not a valid Email !!");
			}
		}
		return (result.hasFieldErrors() || result.hasErrors());
	}
}

