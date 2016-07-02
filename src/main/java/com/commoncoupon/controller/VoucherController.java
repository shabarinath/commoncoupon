package com.commoncoupon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VoucherController {
	
	
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
