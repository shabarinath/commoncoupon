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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.PaymentRequestResponse;
import com.commoncoupon.domain.PaymentStatus;
import com.commoncoupon.domain.Transaction;
import com.commoncoupon.domain.User;
import com.commoncoupon.service.CouponService;
import com.commoncoupon.service.PaymentService;
import com.commoncoupon.service.UserService;
import com.commoncoupon.utils.PaymentUtil;
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
				PasswordEncoder passEn = new PasswordEncoder();
				sender.setPassword(passEn.encodePassword("change.me", null)); //TODO: Generate random password here
				commonCoupon.setSender(sender);
			} else {
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
			commonCoupon.setPassword("change.me");//TODO: Generate randam password here
			commonCoupon.setRedeemed(false);
			commonCoupon.setStatus(false);
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
	
	@RequestMapping(value="/saveTransactionDetails", method = RequestMethod.GET)
	public String saveTransactionDetails(Model model, @RequestParam  String paymentRequestId, @RequestParam String paymentId) 
			throws Exception {
		try {
			if(paymentRequestId == null || paymentRequestId.length() == 0 || paymentId == null || paymentId.length() == 0) {
				return "error/errorPage";
			}
			CommonCoupon couponFromDb = couponService.getCouponByPaymentRequestId(paymentRequestId);
			couponFromDb.setPaymentStatus(PaymentStatus.SUCCESS);
			couponService.saveOrUpdateCommonCoupon(couponFromDb);
			
			//Invoking payment details api from Instamojo and saving details to our DB
			Transaction transactionDetails = PaymentUtil.getTransactionDetails(paymentRequestId, paymentId);
			if(transactionDetails == null) {
				return "error/errorPage";
			} 
			paymentService.saveTransactionDetails(transactionDetails);
			return "success/transactionSuccess"; //TODO: CREATE THIS PAGE
		}catch(Exception e) {
			logger.error("Exception occured while saving transaction details reason: ", e);
		}
		return null;
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
		if(commonCoupon.getAmount() <= 0 || commonCoupon.getAmount() > 5000) {
			result.rejectValue("amount","","Enter vaild amount !!");
		}
		return (result.hasFieldErrors() || result.hasErrors());
	}
}

