package com.commoncoupon.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

import com.commoncoupon.dao.DefaultDao;
import com.commoncoupon.domain.HomePage;
import com.commoncoupon.domain.PaymentResponse;
import com.commoncoupon.domain.User;
import com.commoncoupon.service.AdminService;
import com.commoncoupon.utils.PaymentGatewayClient;
import com.commoncoupon.utils.SecurityUtils;
import com.commoncoupon.utils.Utils;

@Controller
@SessionAttributes("homePage")
public class HomePageController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomePageController.class);
	
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private DefaultDao defaultDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model) throws Exception{
		try {
			//TODO: For testing
			/*PaymentGatewayClient pgClient = PaymentGatewayClient.getInstance();
			PaymentResponse response = pgClient.postDetailsForPayment(new User());
			System.out.println("Resonse: "+response.getPaymentRequest().getLongUrl());*/
			return "home/home";
		} catch(Exception e) {
			logger.error("Unable to load Home page.", e);
			throw e;
		}
	}
	
	@RequestMapping(value = "/editHomePage", method = RequestMethod.GET)
	public String getHomePage(Model model) throws Exception {
		try {
			if(!SecurityUtils.isAdminUser()) {
				throw new Exception("Only admin can update home page");
			}
			HomePage homePage =  defaultDao.getHomePageConfig();
			model.addAttribute("data", referenceData());
			model.addAttribute("homePage", homePage);
			return "admin/homePageForm";
		} catch(Exception e) {
			logger.error("Home page cannot be updated.", e);
			throw e;
		}
		
	}
	
	@RequestMapping(value = "/editHomePage", method = RequestMethod.POST)
	public String saveHomePage(@ModelAttribute HomePage homePage, BindingResult result, Model model) throws Exception {
		try {
			if(!SecurityUtils.isAdminUser()) {
				throw new Exception("Only admin can update home page");
			}
			
		/*	if (homePage.getCollegeLogo() != null) {
				File responseFile = Utils.saveMultipartFileInTemp(homePage.getCollegeLogo(), homePage.getCollegeLogo().getOriginalFilename());
				homePage.setCollegeLogo((MultipartFile)responseFile);
			}
			
			if (homePage.getPrincipalPhoto() != null) {
				File responseFile = Utils.saveMultipartFileInTemp(homePage.getPrincipalPhoto(), homePage.getPrincipalPhoto().getOriginalFilename());
				homePage.setPrincipalPhoto((MultipartFile)responseFile);
			}*/
			
			if (validateFormData(homePage, result)) {
				model.addAttribute("data", referenceData());
				return "admin/homePageForm";
			}
			
			/*if(homePage.getCustomStyle() != null && homePage.getCustomStyle().getId() > 0) {
				homePage.setCustomStyle((CustomStyle)defaultDao.get(CustomStyle.class, homePage.getCustomStyle().getId()));
			}*/
			
			/*if(homePage.getCollegeLogo() != null && !Utils.isEmpty(homePage.getCollegeLogo().getOriginalFilename())) {
				String collegeLogoName = Utils.saveFileToFilesDir(homePage.getCollegeLogo(), Header_Logo_Dir_Path);
				homePage.setCollegeLogoName(collegeLogoName);
			}
			if(homePage.getPrincipalPhoto() != null && !Utils.isEmpty(homePage.getPrincipalPhoto().getOriginalFilename())) {
				String principalPhotoName = Utils.saveFileToFilesDir(homePage.getPrincipalPhoto(), Principal_Photo_Dir_Path);
				homePage.setPrincipalPhotoName(principalPhotoName);
			}*/
			adminService.saveHomePageConfig(homePage);
			return "redirect:/";
		} catch (IOException e) {
			logger.error("Unable to update college-logo/principal-photo.", e);
			throw e;
		} catch (Exception e) {
			logger.error("Home page cannot be updated.", e);
			throw e;
		}
	}
	
	private boolean validateFormData(HomePage homePage, BindingResult result) {
		if (Utils.isEmpty(homePage.getHeaderText())) {
			result.rejectValue("headerText","","College name is mandatory");
		} else if (homePage.getHeaderText().length() > 40) {
			result.rejectValue("headerText","","Maximum 40 characters is allowed in college name");
		} else {
			homePage.setHeaderText(homePage.getHeaderText().trim());
		}
		
		if (Utils.isEmpty(homePage.getHeaderCity())) {
			result.rejectValue("headerCity","","City is mandatory");
		} else if (homePage.getHeaderCity().length() > 40) {
			result.rejectValue("headerCity","","Maximum 40 characters is allowed in city name");
		} else {
			homePage.setHeaderCity(homePage.getHeaderCity().trim());
		}
		
		if(homePage.getCollegeLogo() != null && homePage.getCollegeLogo().getSize() > 3145728) {
			result.rejectValue("collegeLogo","","College logo size cannot exceed 3 MB");
		}
		
		if(homePage.getPrincipalPhoto() != null && homePage.getPrincipalPhoto().getSize() > 3145728) {
			result.rejectValue("principalPhoto","","Principal photo size cannot exceed 3 MB");
		}
		
		if (Utils.isEmpty(homePage.getPrincipalName())) {
			result.rejectValue("principalName","","Principal name is mandatory");
		} else if (homePage.getPrincipalName().length() > 40) {
			result.rejectValue("principalName","","Maximum 40 characters is allowed in principal name");
		} else {
			homePage.setPrincipalName(homePage.getPrincipalName().trim());
		}
		
		if (Utils.isEmpty(homePage.getPrincipalQualification())) {
			result.rejectValue("principalQualification","","Principal qualification is mandatory");
		} else if (homePage.getPrincipalQualification().length() > 40) {
			result.rejectValue("principalQualification","","Maximum 40 characters is allowed in principal qualification");
		} else {
			homePage.setPrincipalQualification(homePage.getPrincipalQualification().trim());
		}
		
		/*if(homePage.getCustomStyle() == null && homePage.getCustomStyle().getId() <= 0) {
			result.rejectValue("customStyle","","Theme is mandatory");
		}*/
		
		return (result.hasFieldErrors() || result.hasErrors());
	}
	
	private Map<String, Object> referenceData() throws Exception {
		  Map<String, Object> model = new HashMap<String, Object>();
		  try {
			  /*List<CustomStyle> cs = defaultDao.getCustomStyles();*/
			  model.put("customStyles", "");
		  } catch (Exception e) {
		   logger.error("Exception at retrieving Fee or Credit reasons: " + e);
		  }
		  return model;
		 }
}
