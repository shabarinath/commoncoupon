import com.commoncoupon.bean.PaymentSuccessResponseBean;
import com.commoncoupon.utils.Utils;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * @author SHABARINATH
 * 01-Dec-2015 10:37:18 pm 2015 
 */

public class GetPaymentDetailsCallTest {
	public static void main(String[] args) {
		try {
	
			Client client = Client.create();
	
			String response ="";
			WebResource webResource = client
			   .resource("https://www.instamojo.com/api/1.1/payments/MOJO5b14000J93750133");
	
			ClientResponse clientresponse = webResource.header("X-Api-Key","986857b06df70bd2a66b816d337fa163" )
					.header("X-Auth-Token", "3cfde5ea935b92cc0793d5c156857f7e").type("application/json") .get(ClientResponse.class);
	
	
			if (!(clientresponse.getStatus() == 201 || clientresponse.getStatus() == 200)) {
				throw new RuntimeException("Failed : HTTP error code : " + clientresponse.getStatus());
			}
			response=  clientresponse.getEntity(String.class);
			System.out.println("Response:---------"+response);
			System.out.println("Output from Server .... \n");
			PaymentSuccessResponseBean resp = (PaymentSuccessResponseBean)Utils.convertJsonToObject(response, PaymentSuccessResponseBean.class);
			System.out.println(resp.getPaymentSuccessBean().getPaymentId());
			
		  } catch (Exception e) {
	
			System.out.println("Exception "+ e);
	
		  }
	}
}

