package com.commoncoupon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VoucherController {
	
	private static final Logger log = LoggerFactory.getLogger(VoucherController.class);
	
	@RequestMapping(value = "/voucher", method = RequestMethod.GET)
	public String showVoucherPageMockup(Model model) throws Exception{
		try {
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
	public void saveVoucher(Object asJsonResponse) throws Exception {
		
	}
	
	
}
