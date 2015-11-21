package com.commoncoupon.controller;

import javax.ws.rs.Consumes;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.commoncoupon.bean.PaymentSuccessResponseBean;

@Controller
@RequestMapping(value = "/webHookService")
public class WebHookService {
	
	@RequestMapping(value = "/receivePaymentResponse", method = RequestMethod.POST)
	@Consumes("application/x-www-form-urlencoded")
	public @ResponseBody void receiveJson(@ModelAttribute PaymentSuccessResponseBean paymentSuccessResponse) throws Exception {
		//Request would be like amount=10&buyerEmail="volamshabarinath@gmail.com"
		System.out.println("Entered..........."+paymentSuccessResponse.getAmount());
	}
}



    
