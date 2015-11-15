package com.commoncoupon.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.commoncoupon.domain.PaymentResponse;
import com.commoncoupon.domain.User;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class PaymentGatewayClient {
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentGatewayClient.class);
	
	private static WebResource webResource;
	private static PaymentGatewayClient pgClient;
	
	@SuppressWarnings("static-access")
	private PaymentGatewayClient() {
		Client client = Client.create();
		WebResource webResource = client.resource(Configuration.getProperty("payment.webservice.uri"));
		this.webResource = webResource;
	}
	
	public static PaymentGatewayClient getInstance() {
		try{
			if(webResource == null) {
				pgClient = new PaymentGatewayClient();
			}
		}catch(Exception e){
			logger.error("Exception occured while getting paymentgateway instance reason: ", e);
		}
		return pgClient;
	}
	
	public PaymentResponse postDetailsForPayment(User user) {
		PaymentResponse resp = null;
		String response = "";
		try {
			String input = "{\"amount\":10,\"purpose\":\"Test purpose\",\"buyer_name\": \"Shabarinath Volam\",\"email\":\"volamshabarinath@gmail.com\",\"phone\":\"9573072270\",\"redirect_url\":\"http://www.google.com\", \"send_sms\":\"True\" }";
			/*response = "{     \"payment_request\": {         \"id\": \"97313625e5ef40b0883678d8b014adb0\",         \"phone\": \"+919573072270\",         \"email\": \"volamshabarinath@gmail.com\",         \"buyer_name\": \"Shabarinath Volam\",         \"amount\": \"10\",         \"purpose\": \"Test purpose\",         \"status\": \"Pending\",         \"send_sms\": true,         \"send_email\": false,         \"sms_status\": \"Pending\",         \"email_status\": null,         \"shorturl\": null,         \"longurl\": \"https://www.instamojo.com/@shabarinath/97313625e5ef40b0883678d8b014adb0\",         \"redirect_url\": \"http://www.google.com\",         \"webhook\": null,         \"created_at\": \"2015-11-14T17:51:09.111Z\",         \"modified_at\": \"2015-11-14T17:51:09.111Z\",         \"allow_repeated_payments\": true     },     \"success\": true }   ";*/
			ClientResponse Clientresponse = webResource.header("X-Api-Key", Configuration.getProperty("payment.key"))
					.header("X-Auth-Token", Configuration.getProperty("payment.token")).type("application/json")
			   .post(ClientResponse.class, input);
			response=  Clientresponse.getEntity(String.class);
			resp = (PaymentResponse)Utils.convertJsonToObject(response, PaymentResponse.class);
		}catch(Exception e) {
			logger.error("Exception occured while posting paymentdetails reason: ", e);
		}
		return resp;
	}
}
