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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.commoncoupon.domain.User;
import com.commoncoupon.service.UserService;

/**
 * @author SHABARINATH
 * 01-Apr-2016 8:53:13 am
 */

@Controller
@SessionAttributes("user")
public class RegistrationController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegistrationController.class);
	
	@Autowired
	private UserService userDetailsService;
	
	@RequestMapping(value = "/getRegisterForm", method = RequestMethod.GET)
	public String dashboard(Model model) throws Exception{
		try {
			User user = new User();
			model.addAttribute("user", user);
			return "security/register";
		} catch(Exception e) {
			logger.error("Unable to load Home page.", e);
			throw e;
		}
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute User user, BindingResult result, Model model) throws Exception {
		try {
			if (validateFormData(user, result)) {
				model.addAttribute("errors", result.getAllErrors());
				return "security/register";
			}
			User dbUser = userDetailsService.getUserByEmail(user.getEmail());
			if(dbUser != null) {
				model.addAttribute("error","Already registered with email id");
				return "security/register";
			}
			userDetailsService.registerUser(user);
			model.addAttribute("message", "Registration success please login to continue....");
		}catch(Exception e) {
			logger.error("Exception occured in registerUser method reason: ", e);
		}
		return "misc/message";
	}
	
	//TODO: NEED TO ADD MOBILE NUMBER VALIDATION
	private boolean validateFormData(User user, BindingResult result) {
		try {
			if(user.getEmail().isEmpty()) {
				result.rejectValue("email","","Cannot be Empty !!");
			} else {
				String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
				Boolean isValid = user.getEmail().matches(EMAIL_REGEX);
				if(!isValid) {
					result.rejectValue("email","","Not a valid Email !!");
				}
			}
			if(user.getPassword().isEmpty()) {
				result.rejectValue("password","","Cannot be Empty !!");
			}
			if(user.getFirstName().isEmpty()) {
				result.rejectValue("firstName","","Cannot be Empty !!");
			}
			if(user.getLastName().isEmpty()) {
				result.rejectValue("lastName","","Cannot be Empty !!");
			}
			if(user.getMobileNumber().isEmpty()) {
				result.rejectValue("mobileNumber","","Cannot be Empty !!");
			}
		}catch(Exception e) {
			logger.error("Exception occured in validateFormData() reason: ", e);
		}
		return (result.hasFieldErrors() || result.hasErrors());
	}

}

