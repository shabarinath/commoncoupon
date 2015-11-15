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

import com.commoncoupon.auth.AuthenticationContext;
import com.commoncoupon.domain.User;
import com.commoncoupon.service.AdminService;

@Controller
public class ChangePasswordController {

	private static final Logger logger = LoggerFactory.getLogger(ChangePasswordController.class);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String changePassword(Model model) throws Exception {
		try {
			User user = new User();
			model.addAttribute("user", user);
		} catch(Exception e) {
			logger.error("Failed to Change Password Reason:.", e);
			throw e;
		}
		return "security/changePassword";
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(@ModelAttribute User user, BindingResult result, Model model) throws Exception {
		if (validateFormData(user, result)) {
			return "security/changePassword";
		}
		System.out.println("old password"+user.getCurrentPassword());
		System.out.println("new password"+user.getPassword());
		System.out.println("confirm password"+user.getConfirmPassword());
		System.out.println(AuthenticationContext.getCurrentUserId());
		adminService.saveOrUpdateUser(user);
		return "security/passwordChangedSuccessfully";
	}

	private boolean validateFormData(User user, BindingResult result) {
		if(user.getPassword() == null || user.getPassword() == "") {
			result.reject("password", "Please Enter Password");
		}
		if(user.getConfirmPassword() == null || user.getConfirmPassword() == "") {
			result.reject("confirmPassword", "Please confirm Password");
		}
		if(user.getCurrentPassword() == null || user.getCurrentPassword() == "") {
			result.reject("currentPassword", "Please Enter current Password");
		} else if(!user.getPassword().equals(user.getConfirmPassword())) {
			result.reject("password", "Password and confirm Password dosent match");
			result.reject("confirmPassword", "Password and confirm Password dosent match");
		} else {
			PasswordEncoder passEn = new PasswordEncoder();
			if(!(passEn.isPasswordValid(passEn.encodePassword(user.getPassword(), null), user.getPassword(), null))) {
				result.reject("currentPassword", "Incorrect Password !!");
			}
		}
		return (result.hasFieldErrors() || result.hasErrors());
	}
}
