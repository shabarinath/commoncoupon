package com.commoncoupon.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Configuration {

	private static final Logger logger = LoggerFactory.getLogger(Configuration.class);

	public static final String PAYMENT_GATEWAY_KEY = "payment.key";
	public static final String PAYMENT_GATEWAY_TOKEN = "payment.token";
	public static final String WEB_SERVICE_URI = "payment.webservice.uri";

	public final static String PROPSFILE = "commoncoupon.properties";

	private static Properties props;
	
	static {
		try {
			if (props == null) {
				props = new Properties();
				File configDir = new File(System.getProperty("catalina.base"), "conf");
				File configFile = new File(configDir, "commoncoupon.properties");
				InputStream stream = new FileInputStream(configFile);
				props.load(stream);
				System.out.println("----------------------Properties loaded--------------------------");
			}
		} catch (Exception e) {
			logger.error("Exception occured while loading properties from file reason: ", e);
		}
	}

	public static String getProperty(String key) {
		String property = "";
		try{
			property = props.getProperty(key);
			if (property != null) {
				property = property.trim();
			}
		} catch(Exception e){
			logger.error("Exception occured while getting property reason: ", e);
		}
		return property;
	}

	public static String getPaymentKey() {
		String key = "";
		try {
			key = getProperty(PAYMENT_GATEWAY_KEY);
		} catch (Exception e) {
			logger.error("Exception occured while getting property reason: ", e);
		}
		return key;
	}

	public static String getPaymentToken() {
		String token = "";
		try {
			token = getProperty(PAYMENT_GATEWAY_TOKEN);
		} catch (Exception e) {
			logger.error("Exception occured while getting property reason: ", e);
		}
		return token;
	}

	public static String getPaymentURI() {
		String uri = "";
		try {
			uri = getProperty(WEB_SERVICE_URI);
		} catch (Exception e) {
			logger.error("Exception occured while getting property reason: ", e);
		}
		return uri;
	}

}
