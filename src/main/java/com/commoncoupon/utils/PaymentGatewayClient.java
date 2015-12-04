package com.commoncoupon.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.commoncoupon.bean.PaymentRequestResponseBean;
import com.commoncoupon.bean.PaymentSuccessResponseBean;
import com.commoncoupon.domain.CommonCoupon;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * @author SHABARINATH
 * 14-Nov-2015 1:02:15 am 2015 
 */
public class PaymentGatewayClient {
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentGatewayClient.class);
	
	private static final String TRANSACTION_DETAILS_API_LINK = "https://www.instamojo.com/api/1.1/payments/";
	private static final String PAYMENT_REQUEST_WEBSERVICE_URI= "https://www.instamojo.com/api/1.1/payment-requests/";
	
	private static Client client;
	private static PaymentGatewayClient pgClient;
	
	private PaymentGatewayClient() {
		client = Client.create();
	}
	
	public static PaymentGatewayClient getInstance() {
		try{
			if(client == null) {
				pgClient = new PaymentGatewayClient();
			}
		}catch(Exception e){
			logger.error("Exception occured while getting paymentgateway instance reason: ", e);
		}
		return pgClient;
	}
	
	public PaymentRequestResponseBean createPaymentLink(CommonCoupon commonCoupon) {
		PaymentRequestResponseBean resp = null;
		String response = "";
		try {
			//TODO: GENERATE PAYMENT REQUEST USING OBJECT INSTEAD OF HARDCODING
			//Enable commented finally
			WebResource webResource = client.resource(PAYMENT_REQUEST_WEBSERVICE_URI);
			String input = "{\"amount\":9.0,\"purpose\":\"Test purpose\",\"buyer_name\": \"Shabarinath Volam\",\"email\":\"volamshabarinath@gmail.com\",\"phone\":\"9573072270\",\"redirect_url\":\"https://www.google.com\", \"send_sms\":\"False\", \"allow_repeated_payments\": \"False\"  }";
			//response = "{     \"payment_request\": {         \"id\": \"97313625e5ef40b0883678d8b014adb0\",         \"phone\": \"+919573072270\",         \"email\": \"volamshabarinath@gmail.com\",         \"buyer_name\": \"Shabarinath Volam\",         \"amount\": \"10\",         \"purpose\": \"Test purpose\",         \"status\": \"Pending\",         \"send_sms\": true,         \"send_email\": false,         \"sms_status\": \"Pending\",         \"email_status\": null,         \"shorturl\": null,         \"longurl\": \"https://www.instamojo.com/@shabarinath/97313625e5ef40b0883678d8b014adb0\",         \"redirect_url\": \"http://www.google.com\",         \"webhook\": null,         \"created_at\": \"2015-11-14T17:51:09.111Z\",         \"modified_at\": \"2015-11-14T17:51:09.111Z\",         \"allow_repeated_payments\": False     },     \"success\": true }   ";
			ClientResponse Clientresponse = webResource.header("X-Api-Key", Configuration.getProperty("payment.key"))
					.header("X-Auth-Token", Configuration.getProperty("payment.token")).type("application/json")
			   .post(ClientResponse.class, input);
			if (!(Clientresponse.getStatus() == 201 || Clientresponse.getStatus() == 200)) {
				throw new RuntimeException("Failed : HTTP error code : " + Clientresponse.getStatus());
			}
			response=  Clientresponse.getEntity(String.class);
			System.out.println("Response:---------"+response);
			resp = (PaymentRequestResponseBean)Utils.convertJsonToObject(response, PaymentRequestResponseBean.class);
			
			//Comment below code after testings
			/*resp = new PaymentRequestResponseBean();
			resp.setPaymentRequest(new PaymentRequestBean());
			resp.getPaymentRequest().setLongUrl("https://www.instamojo.com/@shabarinath/7fff6feca81449c289c33f4a66561751");
			resp.getPaymentRequest().setId(String.valueOf((Math.random() * 5)));
			resp.setIsSuccess("true");*/
		}catch(Exception e) {
			logger.error("Exception occured while posting paymentdetails reason: ", e);
		}
		return resp;
	}

	public PaymentSuccessResponseBean getPaymentDetails(String paymentId) {
		try{
			WebResource webResource = client.resource(TRANSACTION_DETAILS_API_LINK.concat(paymentId).concat("/"));
			ClientResponse clientresponse = webResource.header("X-Api-Key", Configuration.getProperty("payment.key"))
			.header("X-Auth-Token", Configuration.getProperty("payment.token")).type("application/json") .get(ClientResponse.class);
			if (!(clientresponse.getStatus() == 201 || clientresponse.getStatus() == 200)) {
				throw new RuntimeException("Failed : HTTP error code : " + clientresponse.getStatus());
			}
			String response=  clientresponse.getEntity(String.class);
			System.out.println("Response:---------"+response);
			System.out.println("Output from Server .... \n");
			PaymentSuccessResponseBean respBean = (PaymentSuccessResponseBean)Utils.convertJsonToObject(response, PaymentSuccessResponseBean.class);
			return respBean;
		}catch(Exception e) {
			logger.error("Exception occured while getting payment details reason: ", e);
		}
		return null;
	}

}
