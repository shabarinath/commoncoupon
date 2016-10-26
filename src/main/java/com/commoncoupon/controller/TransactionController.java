package com.commoncoupon.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.commoncoupon.domain.CommonCoupon;
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
 * 25-Jan-2016 9:42:06 pm 2016 
 */

@Controller
public class TransactionController {
	
	private static final Logger logger = LoggerFactory.getLogger(TransactionController.class);
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private UserService userDetailsService;
	
	/**
	 * After successfull payment user will be redirected to this method
	 * and here transaction details will be saved
	 *
	 */
	@RequestMapping(value="/saveTransactionDetails", method = RequestMethod.GET)
	private String saveTransactionDetails(Model model, @RequestParam  String payment_request_id, @RequestParam String payment_id) throws Exception {
		try {
			if(payment_request_id == null || payment_request_id.length() == 0 || payment_id == null || payment_id.length() == 0) {
				return "error/error";
			}
			CommonCoupon couponFromDb = couponService.getUnPaidCommonCouponByPaymentRequestId(payment_request_id);
			if(couponFromDb == null) {
				return "error/error";
			}
			couponFromDb.setPaymentStatus(PaymentStatus.SUCCESS);
			couponService.saveOrUpdateCommonCoupon(couponFromDb);
			
			//Getting logged in user details and setting to transaction
			User buyer = userDetailsService.getCurrentLoggedInUser();
			
			if(buyer == null) {
				return "error/error";
			}
			
			//Invoking payment details api from Instamojo and saving details to our DB
			Transaction transactionDetails = PaymentUtil.getTransactionDetails(payment_request_id, payment_id,couponFromDb
					,buyer);
			if(transactionDetails == null) {
				return "error/error";
			} 
			paymentService.saveTransactionDetails(transactionDetails);
			
			//Sending purchase mail to sender
			Map<String, Object> senderData = new HashMap<String, Object>();
			senderData.put("Amount", couponFromDb.getAmount());
			senderData.put("RecipientEmail", couponFromDb.getRecipient().getEmail());
			senderData.put("SenderName", couponFromDb.getSender().getFirstName());
			Utils.sendMail(senderData, "PurchaseSuccessMailToSender.ftl", couponFromDb.getSender().getEmail(), "Coupon Purchase Success");
			
			//Sending gift coupon mail to recipient
			Map<String, Object> recipientData = new HashMap<String, Object>();
			recipientData.put("Amount", couponFromDb.getAmount());
			recipientData.put("RecipientEmail", couponFromDb.getRecipient().getEmail());
			recipientData.put("SenderName", couponFromDb.getSender().getFirstName());
			recipientData.put("CouponId", couponFromDb.getCouponId());
			recipientData.put("CouponPassword", couponFromDb.getPassword());
			Utils.sendMail(recipientData, "GiftCouponToRecipient.ftl", couponFromDb.getRecipient().getEmail(), "E-Gift for you !!!!");
			
		}catch(Exception e) {
			logger.error("Exception occured while saving transaction details reason: "+e);
		}
		return "coupon/couponPurchaseSuccess";
	}
}

