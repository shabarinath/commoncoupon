package com.commoncoupon.utils;

import com.commoncoupon.domain.User;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class PaymentGatewayClient {
	
	private static WebResource webResource;
	
	@SuppressWarnings("static-access")
	private PaymentGatewayClient() {
		Client client = Client.create();
		WebResource webResource = client.resource(Configuration.getProperty("payment.webservice.uri"));
		this.webResource = webResource;
	}
	
	public static PaymentGatewayClient getInstance() {
		PaymentGatewayClient pgClient = null;
		try{
			if(webResource == null) {
				pgClient = new PaymentGatewayClient();
				return pgClient;
			}
		}catch(Exception e){
			
		}
		return pgClient;
	}
	
	public String postDetailsForPayment(User user) {
		String response ="";
		try {
			String input = "{\"amount\":10,\"purpose\":\"Test purpose\",\"buyer_name\": \"Shabarinath Volam\",\"email\":\"volamshabarinath@gmail.com\",\"phone\":\"9573072270\",\"redirect_url\":\"http://www.google.com\", \"send_sms\":\"True\" }";
			
			ClientResponse Clientresponse = webResource.header("X-Api-Key", Configuration.getProperty("payment.key"))
					.header("X-Auth-Token", Configuration.getProperty("payment.token")).type("application/json")
			   .post(ClientResponse.class, input);
			response=  Clientresponse.getEntity(String.class);
		}catch(Exception e) {
			
		}
		return response;
	}
}
