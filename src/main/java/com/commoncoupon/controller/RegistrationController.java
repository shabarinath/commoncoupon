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

import com.commoncoupon.constants.Constants;
import com.commoncoupon.domain.User;
import com.commoncoupon.service.UserService;
import com.commoncoupon.utils.Utils;

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
	public String getRegistrationForm(Model model) throws Exception{
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
				Utils util = new Utils();
				boolean isValidEmailAddress = util.isValidEmail(user.getEmail());
				if(!isValidEmailAddress) {
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
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String getForgotPasswordForm(Model model) throws Exception{
		try {
			User user = new User();
			model.addAttribute("user", user);
			return "security/forgotPassword";
		} catch(Exception e) {
			logger.error("Exception occured in forgotPassword reason: ", e);
			throw e;
		}
	}
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public String forgotPassword(@ModelAttribute User user, BindingResult result, Model model) throws Exception{
		try {
			if(validatePasswordResetForm(user, result)) {
				return "security/forgotPassword";
			}
			User userFromEmail = userDetailsService.getUserByEmail(user.getEmail());
			int otp = Utils.generateOTP();
			userFromEmail.setOtp(otp);
			userFromEmail.setOtpExpiry(Utils.getOTPExpiryTimestamp());
			//Sending OTP details to mail
			Utils.sendOTPDetailsMail(userFromEmail.getFullName(), otp, user.getEmail());
			userDetailsService.saveUser(userFromEmail);
			model.addAttribute("user", new User());
			model.addAttribute("userEmail", user.getEmail());
			return "security/resetPasswordWithOTP";
		} catch(Exception e) {
			logger.error("Exception occured in forgotPassword reason: ", e);
			throw e;
		}
	}
	
	/*
	 * This method is called from
	 * resetPassword with OTP form
	 */
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String resetPassword(@ModelAttribute User user, BindingResult result, Model model) throws Exception{
		try {
			if(validatePasswordResetWithOTPForm(user, result)) {
				return "security/resetPasswordWithOTP";
			}
			User userFromEmail = userDetailsService.getUserByEmail(user.getEmail());
			//Resetting
			userFromEmail.setOtp(null);
			userFromEmail.setOtpExpiry(null);
			PasswordEncoder passEn = new PasswordEncoder();
			userFromEmail.setPassword(passEn.encodePassword(user.getPassword(), null));
			userDetailsService.saveUser(userFromEmail);
			model.addAttribute(Constants.SUCCESS_PAGE_MSG, "Password Change Sucessfully, Plz login with new Password");
			return "home/success";
		} catch(Exception e) {
			logger.error("Exception occured in forgotPassword reason: ", e);
			throw e;
		}
	}

	private boolean validatePasswordResetWithOTPForm(User user,
			BindingResult result) throws Exception {
		try {
			if (Utils.isEmpty(user.getEmail())) {
				result.rejectValue("email","","Unable to process your request !!");
			}
			if(user.getOtp() == null || user.getOtp() <=0) {
				result.rejectValue("otp","","OTP Required");
			} else if(!Utils.isEmpty(user.getEmail())) {
				User userByEmail = userDetailsService.getUserByEmail(user.getEmail());
				if(userByEmail != null) {
					if(!user.getOtp().equals(userByEmail.getOtp())) {
						result.rejectValue("otp","","Invalid OTP");
					} else if(user.getOtp().equals(userByEmail.getOtp())) {
						if(Utils.getCurrentTimestamp().after(userByEmail.getOtpExpiry())) {
							result.rejectValue("otp","","OTP Expired");
						}
					}
				}
			}
			if(Utils.isEmpty(user.getPassword())) {
				result.rejectValue("password","","Required");
			}
			if(Utils.isEmpty(user.getConfirmPassword())) {
				result.rejectValue("confirmPassword","","Required");
			}
			return (result.hasFieldErrors() || result.hasErrors());
		}catch(Exception e) {
			logger.error("Exception occured while validating validatePasswordResetWithOTPForm");
			throw e;
		}
	}

	private boolean validatePasswordResetForm(User user, BindingResult result) throws Exception {
		try {
			if (Utils.isEmpty(user.getEmail())) {
				result.rejectValue("email","","Email is mandatory");
			} else if(!Utils.isEmpty(user.getEmail())) {
				User userByEmail = userDetailsService.getUserByEmail(user.getEmail());
				if(userByEmail == null) {
					result.rejectValue("email","","Invalid Email !!");
				}
				if(userByEmail !=null && !userByEmail.getActive()) {
					result.rejectValue("email","","Account is not active !!");
				}
			}
			return (result.hasFieldErrors() || result.hasErrors());
		}catch(Exception e) {
			logger.error("Exception occured while validating password rest form");
			throw e;
		}
	}

}

