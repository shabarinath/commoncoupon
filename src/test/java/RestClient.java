import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * @author SHABARINATH
 * 18-Nov-2015 1:02:15 am 2015 
 */
public class RestClient {
	
	private static final String X_Api_Key="986857b06df70bd2a66b816d337fa163";
	private static final String X_Auth_Token="3cfde5ea935b92cc0793d5c156857f7e";
	/*private static final String WEB_SERVICE_URI = "https://www.instamojo.com/api/1.1/links/";*/
	private static final String WEB_SERVICE_URI = "https://www.instamojo.com/api/1.1/payment-requests/";
	
	public static void main(String argv[]) throws Exception {
			Client client = Client.create();

			WebResource webResource = client.resource(WEB_SERVICE_URI);
		
			String input = "{\"amount\":10,\"purpose\":\"Test purpose\",\"buyer_name\": \"Shabarinath Volam\",\"email\":\"volamshabarinath@gmail.com\",\"phone\":\"9573072270\",\"redirect_url\":\"http://www.google.com\", \"send_sms\":\"True\" }";
			//String input = "{\"title\":\"test title\",\"description\":\"test desc\",\"currency\":\"INR\",\"base_price\":10}";
		
			ClientResponse response = webResource.header("X-Api-Key", X_Api_Key)
					.header("X-Auth-Token", X_Auth_Token).type("application/json")
			   .post(ClientResponse.class, input);
			String output = response.getEntity(String.class);
			if (response.getStatus() != 201) {
				throw new RuntimeException("Failed : HTTP error code : "
				     + response.getStatus());
			}
		
			System.out.println("Output from Server .... \n");
			System.out.println(output);
	}
}
