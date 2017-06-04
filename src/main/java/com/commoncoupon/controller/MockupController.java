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
	
	@RequestMapping(value = "/mockup/orderMock", method = RequestMethod.GET)
	public String showOrdersPageMockup(Model model) throws Exception{
		try {
			return "mockup/orderMock";
		} catch(Exception e) {
			log.error("Unable to load Get Vouchers Page.", e);
			throw e;
		}
	}
	
	@RequestMapping(value = "/mockup/profileMock", method = RequestMethod.GET)
	public String showProfilePageMockup(Model model) throws Exception{
		try {
			return "mockup/mockprofile";
		} catch(Exception e) {
			log.error("Unable to load Get Vouchers Page.", e);
			throw e;
		}
	}
	
	@RequestMapping(value = "/mockup/redeemMock", method = RequestMethod.GET)
	public String showRedeemPageMockup(Model model) throws Exception{
		try {
			return "mockup/redeemMock";
		} catch(Exception e) {
			log.error("Unable to load Get Vouchers Page.", e);
			throw e;
		}
	}
	
}

