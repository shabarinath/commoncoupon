package com.commoncoupon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller to load html mockups
 */
@Controller
public class MockupController {

private static final Logger log = LoggerFactory.getLogger(MockupController.class);
	
	@RequestMapping(value = "/mockup/voucherpage", method = RequestMethod.GET)
	public String showVoucherPageMockup(Model model) throws Exception{
		try {
			return "mockup/mockvoucher";
		} catch(Exception e) {
			log.error("Unable to load Get Vouchers Page.", e);
			throw e;
		}
	}
	
}

