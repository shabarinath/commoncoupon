package com.commoncoupon.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.commoncoupon.dao.DefaultDao;
import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.service.CouponService;

@Controller
@SessionAttributes("commonCoupon")
public class HomePageController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomePageController.class);
	
	@Autowired
	private DefaultDao defaultDao;
	
	@Autowired 
	private CouponService couponService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model) throws Exception{
		try {
			CommonCoupon commonCoupon = new CommonCoupon();
			model.addAttribute("commonCoupon", commonCoupon);
			return "home/home";
		} catch(Exception e) {
			logger.error("Unable to load Home page.", e);
			throw e;
		}
	}
	
	@RequestMapping(value = "/redirect", method = RequestMethod.GET)
	public String redirect(Model model, @RequestParam("redirectUrl") String redirectUrl) throws Exception{
		try {
			if(!redirectUrl.isEmpty()) {
				model.addAttribute("redirectUrl", redirectUrl);
			}
			return "misc/redirect";
		} catch(Exception e) {
			logger.error("Unable to load Home page.", e);
			throw e;
		}
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model) throws Exception{
		try {
			List<String> supportedCoupons = new ArrayList<String>();
			supportedCoupons.add("AMAZON");
			supportedCoupons.add("FLIPKART");
			supportedCoupons.add("MYNTRA");
			supportedCoupons.add("SHOPCLUES");
			model.addAttribute("commonCoupon", new CommonCoupon());
			return "home/dashboard";
		} catch(Exception e) {
			logger.error("Unable to load Home page.", e);
			throw e;
		}
	}
}
