import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.Socket;
import java.net.URL;

/**
 * @author SHABARINATH
 * 13-Nov-2015 1:02:15 am 2015 
 */
public class WebHookServiceTest {

	// http://localhost:8080/RESTfulExample/json/product/post
	public static void main(String[] args) {

	  try {
		URL url = new URL("http://localhost:8080/json/product/post");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json");
		Socket s = new Socket("localhost", 8080);
		
		s.setKeepAlive( true );
		conn.getOutputStream().close();

		String input = "{\"qty\":100,\"name\":\"iPad 4\"}";

		OutputStream os = conn.getOutputStream();
		os.write(input.getBytes());
		os.flush();

		if (conn.getResponseCode() != HttpURLConnection.HTTP_CREATED) {
			throw new RuntimeException("Failed : HTTP error code : "
				+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
				(conn.getInputStream())));

		String output;
		System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) {
			System.out.println(output);
		}

		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {

		e.printStackTrace();

	 }

	}

}
