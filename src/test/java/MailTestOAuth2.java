/*package commoncoupon;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

*//**
 * @author SHABARINATH
 * 24-Jan-2016 1:12:07 pm 2016 
 *//*

public class MailTestOAuth2 {
	public static void main(String argv[]) throws Exception {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		 Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("search2let@gmail.com", "Tol3t@dm!n321");
			}
		  });

		String msgBody = "...";

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("search2let@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("volamshabarinath@gmail.com"));
			message.setSubject("Testing Subject");
			message.setText("Dear Mail Crawler," +
					"\n\n No spam to my email, please!");

			Transport.send(message);

			System.out.println("Done");

		} catch (AddressException e) {
		   System.out.println(e);
		} catch (MessagingException e) {
			  System.out.println(e);
		}

	}
}

*/