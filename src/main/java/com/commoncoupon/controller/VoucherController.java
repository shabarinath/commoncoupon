package com.commoncoupon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.commoncoupon.auth.AuthenticationContext;
import com.commoncoupon.domain.CouponsCatalogue;
import com.commoncoupon.domain.CouponsCatalogueWrapper;
import com.commoncoupon.domain.OtherCoupon;
import com.commoncoupon.domain.User;
import com.commoncoupon.service.CouponService;
import com.commoncoupon.service.UserService;

@Controller
public class VoucherController {
	
	private static final Logger log = LoggerFactory.getLogger(VoucherController.class);
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private UserService userDetailsService;
	
	@RequestMapping(value = "/voucher", method = RequestMethod.GET)
	public String showVoucherPageMockup(Model model) throws Exception{
		try {
			List<CouponsCatalogue> supportedCouponsList = couponService.getSupportedCouponsList();
			CouponsCatalogueWrapper catalogueWrapper = new CouponsCatalogueWrapper();
			catalogueWrapper.setCouponsList(supportedCouponsList);
			model.addAttribute("couponsListWrapper", catalogueWrapper);
			User currentLoggedInUser =  userDetailsService.getUserByEmail(AuthenticationContext.getLoggedInUserEmail());
			long amount = currentLoggedInUser != null ? currentLoggedInUser.getAmount() : 0;
			model.addAttribute("walletAmount", amount);
			return "voucher/voucher";
		} catch(Exception e) {
			log.error("Unable to load Get Vouchers Page.", e);
			throw e;
		}
	}
	
	/**
	 * Method that perform following operations:
	 * 1. Receives the list of voucher information
	 * 		as json data
	 * 2. Validate received info with predefined enums
	 * 3. Check if user has sufficient balance
	 * 4. Create vouchers against the user
	 * @return Object with status message
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveVoucher", method = RequestMethod.POST)
	public String saveVoucher(@ModelAttribute("couponsListWrapper")CouponsCatalogueWrapper couponsListWrapper, Model model) throws Exception {
		try {
			int checkedOutAmount = 0;
			for(CouponsCatalogue coupon: couponsListWrapper.getCouponsList()) {
				if(coupon.getAmount() <=0) {
					model.addAttribute("Error", "Checkedout coupon amount should be > 0");
					return "voucher/voucher";
				}
				checkedOutAmount += coupon.getAmount();
			}
			User currentLoggedInUser =  userDetailsService.getUserByEmail(AuthenticationContext.getLoggedInUserEmail());
			if(currentLoggedInUser == null) {
				model.addAttribute("Error", "Session Expired plz login again !!");
				return "voucher/voucher"; 
			}
			long walletAmount = currentLoggedInUser != null ? currentLoggedInUser.getAmount() : 0;
			if(checkedOutAmount > walletAmount) {
				model.addAttribute("Error", "Cannot checkout more than wallet amount");
				return "voucher/voucher";
			}
			
			for(CouponsCatalogue coupon: couponsListWrapper.getCouponsList()) {
				if(coupon.getAmount() > 0) {
					OtherCoupon otherCoupon = new OtherCoupon();
					otherCoupon.setCompanyName(coupon.getName());
					otherCoupon.setSender(currentLoggedInUser);
					otherCoupon.setRecipient(currentLoggedInUser);
					otherCoupon.setAmount(coupon.getAmount());
					couponService.saveCoupon(otherCoupon);
				}
			}
			walletAmount = walletAmount - checkedOutAmount;
			currentLoggedInUser.setAmount(walletAmount);
			userDetailsService.saveUser(currentLoggedInUser);
		}catch(Exception e) {
			log.error("Exception occured in purchaseCoupons reason:", e);
		}
		return "voucher/index"; //TODO: Need Success Page here
	}
	
	
}
