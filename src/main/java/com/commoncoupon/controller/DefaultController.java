/*package com.commoncoupon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.commoncoupon.dao.DefaultDao;
import com.commoncoupon.domain.HomePage;


@Controller
public class DefaultController {
	
	@Autowired
	private DefaultDao defaultDao;

	private static final Logger logger = LoggerFactory.getLogger(DefaultController.class);
	
	@RequestMapping(value = "/aboutCollege", method = RequestMethod.GET)
	public String getAboutcollege(Model model) throws Exception {
		try {
			HomePage homePage = defaultDao.getHomePageConfig();
			model.addAttribute("homePage", homePage);
			return "home/aboutCollege";
		} catch(Exception e) {
			logger.error("Error in retreiving description", e);
			throw e;
		}
	}
	
	@RequestMapping(value = "/customStyles")
	public String loadCustomStyles(Model model) throws Exception {
		try {
			HomePage homePage = defaultDao.getHomePageConfig();
			model.addAttribute("homePage", homePage);
			return "includes/customStyles";
		} catch(Exception e) {
			logger.error("Error in retreiving custom styles", e);
			throw e;
		}
	}

}
*/