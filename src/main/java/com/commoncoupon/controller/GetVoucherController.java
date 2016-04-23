package com.commoncoupon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Hold resources related to get voucher tab
 * - 
 */

@Controller
public class GetVoucherController {
	
	private static final Logger log = LoggerFactory.getLogger(GetVoucherController.class);
	
	@RequestMapping(value = "/getvoucher", method = RequestMethod.GET)
	public String getVouchers(Model model) throws Exception{
		try {
			return "voucher/index";
		} catch(Exception e) {
			log.error("Unable to load Get Vouchers Page.", e);
			throw e;
		}
	}

}
