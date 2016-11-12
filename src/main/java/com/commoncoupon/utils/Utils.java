package com.commoncoupon.utils;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TimeZone;

import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.commoncoupon.bean.PaymentRequestBean;
import com.commoncoupon.bean.PaymentRequestResponseBean;
import com.commoncoupon.bean.PaymentSuccessBean;
import com.commoncoupon.bean.PaymentSuccessResponseBean;
import com.commoncoupon.constants.Constants;
import com.commoncoupon.domain.CommonCoupon;
import com.commoncoupon.domain.CouponsCatalogue;
import com.commoncoupon.domain.PaymentRequestResponse;
import com.commoncoupon.domain.Transaction;
import com.commoncoupon.domain.User;
import com.commoncoupon.mail.MailServiceLocator;
import com.commoncoupon.mail.TemplateProcessor;

public class Utils {
	
	private static final Logger logger = LoggerFactory.getLogger(Utils.class);
	
	public static boolean isEmpty(String param) {
		if(param == null)
			return true;
		else if("".equals(param.trim()))
			return true;
		return false;
	}
	
	public static void createDirectoryIfNotExists(File file) throws IOException {
		if(!file.exists()) {
			if(!file.mkdirs()) {
				throw new IOException("Failed to create directory");
			}
		}
	}
	
	public static void createDirectoryIfNotExists(String file) throws IOException {
		createDirectoryIfNotExists(new File(file));
	}
	
/*	public static File saveMultipartFileInTemp(MultipartFile file,String fileName) throws IllegalStateException, IOException {
		String tempPath = Configuration.Temp_Dir_Path+ "/" + RandomString.getNext() + "/";
		Utils.createDirectoryIfNotExists(tempPath);
		File tempFile = new File(tempPath, fileName);
		String path = tempFile.getPath();
		file.transferTo(tempFile);
		File tfile = new File(path);
		return tfile;		
	}*/
	
	public static String saveFileToFilesDir(MultipartFile file, String destDir) throws IOException {
		if(file == null || isEmpty(file.getName())) {
			return null;
		}
		String fileNameWithExt = file.getOriginalFilename();
		String[] fileNameArray = fileNameWithExt.split("\\.",2);
		String fileName = null;
		String ext = null;
		if(fileNameArray == null || fileNameArray.length <= 0) {
			return null;
		} else if(fileNameArray.length == 1) {
			fileName = fileNameArray[0];
			ext = ".file";
		} else {
			fileName = fileNameArray[0];
			ext = fileNameArray[1];
		}
		Utils.createDirectoryIfNotExists(destDir);
		// Do no overwrite existing file
		File tempFile = new File(destDir + File.separator +fileNameWithExt);
		for (int i = 0; tempFile.exists(); i++) {
			tempFile = new File(destDir + File.separator + fileName + i + "." + ext);
		}
		file.transferTo(tempFile);

		return tempFile.getName();
	}
	
	public static Date getSystemTimeInGMT() {
		return convertDateToGMT(new Date(), TimeZone.getDefault());
	}
	
	public static final Date convertDateToGMT(Date date, TimeZone tz) {
		if (date == null || tz == null)
			return date;
		long time = date.getTime();
		GregorianCalendar cal = toGregorianCalendar(date, tz);
		long offset = cal.get(Calendar.ZONE_OFFSET)
				+ cal.get(Calendar.DST_OFFSET);
		long gmtTime = time - offset;
		return new Date(gmtTime);
	}
	
	private static GregorianCalendar toGregorianCalendar(Date date, TimeZone tz) {
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.setTimeZone(tz);
		return cal;
	}

	@SuppressWarnings("unchecked")
	public static <T> T convertJsonToObject(String responseString,
			Class<?> clazz) {
		try{
			 ObjectMapper mapper = new ObjectMapper();
			 mapper.configure(DeserializationConfig.Feature.AUTO_DETECT_FIELDS, true);
		     mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		     return (T) mapper.readValue(responseString, clazz);
		}catch(Exception e){
			logger.error("Exception occured while converting json to object reason: ", e);
		}
		return null;
	}
	
	public static String convertObjectToJson(PaymentRequestBean requestBean) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(SerializationConfig.Feature.INDENT_OUTPUT, true);
			String jsonString = mapper.writeValueAsString(requestBean);
			return jsonString;
		} catch(Exception e) {
			logger.error("Exception occured while converting object to Json reason: ", e);
		}
		return null;
	}
	
	public static PaymentRequestResponse setPaymentRequestResponseToObj(PaymentRequestResponseBean paymentRequestResponseBean) {
		try{
			if(paymentRequestResponseBean != null) {
				PaymentRequestResponse paymentResponse = new PaymentRequestResponse();
				PaymentRequestBean paymentRequest = paymentRequestResponseBean.getPaymentRequest();
				paymentResponse.setPaymentRequestId(paymentRequest.getId());
				paymentResponse.setPhone(paymentRequest.getPhone());
				paymentResponse.setSenderEmail(paymentRequest.getEmail());
				paymentResponse.setSenderName(paymentRequest.getBuyerName());
				paymentResponse.setAmount(paymentRequest.getAmount());
				paymentResponse.setPurpose(paymentRequest.getPurpose());
				paymentResponse.setStatus(paymentRequest.getStatus());
				paymentResponse.setSendSms(paymentRequest.getSendSms());
				paymentResponse.setSendEmail(paymentRequest.getSendEmail());
				paymentResponse.setSmsStatus(paymentRequest.getSmsStatus());
				paymentResponse.setEmailStatus(paymentRequest.getEmailStatus());
				paymentResponse.setShortUrl(paymentRequest.getShortUrl());
				paymentResponse.setLongUrl(paymentRequest.getLongUrl());
				paymentResponse.setRedirectUrl(paymentRequest.getRedirectUrl());
				paymentResponse.setCreatedAt(paymentRequest.getCreatedAt());
				paymentResponse.setModifiedAt(paymentRequest.getModifiedAt());
				paymentResponse.setAllowRepeatedPayments(Boolean.parseBoolean(paymentRequest.getAllowRepeatedPayments()));
				paymentResponse.setIsSuccess(paymentRequestResponseBean.getIsSuccess());
				return paymentResponse;
			}
		}catch(Exception e) {
			logger.error("Exception occured while setting properties to POJO reason: ", e);
		}
		return null;
	}

	public static String generateCouponCode() {
		try{
			final long MAX_NUMBER_YOU_WANT_TO_HAVE = 9999999999999999L;
			final long MIN_NUMBER_YOU_WANT_TO_HAVE = 1000000000000000L;
			Long actual = Long.valueOf(Math.abs(Float.valueOf(new Random().nextFloat() * (MAX_NUMBER_YOU_WANT_TO_HAVE - MIN_NUMBER_YOU_WANT_TO_HAVE)).longValue()));
			return String.valueOf(actual);
		}catch(Exception e){
			logger.error("Exception occured while generating coupon code reason: ", e);
		}
		return null;
	}
	
	public static String generateCouponPassword() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}

	public static Transaction setBeanPropsToTransactionDetailsToObj(
			PaymentSuccessResponseBean paymentCompletionResponseBean, String paymentRequestId, CommonCoupon coupon, User buyer) {
		try {
			if(paymentCompletionResponseBean != null) {
				Transaction transactionObj = new Transaction();
				PaymentSuccessBean  paymentSuccessBean = paymentCompletionResponseBean.getPaymentSuccessBean();
				transactionObj.setAmount(paymentSuccessBean.getAmount());
				transactionObj.setBuyer(buyer);
				transactionObj.setCoupon(coupon);
				/*transactionObj.setBuyerEmail(paymentSuccessBean.getBuyerEmail());
				transactionObj.setBuyerName(paymentSuccessBean.getBuyerName());*/
				transactionObj.setBuyerPhone(paymentSuccessBean.getBuyerPhone());
				transactionObj.setTransactionCreateTime(paymentSuccessBean.getCreatedAt());
				transactionObj.setCurrency(paymentSuccessBean.getCurrency());
				transactionObj.setFees(paymentSuccessBean.getPaymentGateWayFees());
				transactionObj.setPaymentId(paymentSuccessBean.getPaymentId());
				transactionObj.setStatus(paymentSuccessBean.getStatus()); //Credit
				transactionObj.setSuccess(Boolean.parseBoolean(paymentCompletionResponseBean.getIsSuccess()));
				transactionObj.setPaymentRequestId(paymentRequestId);
				return transactionObj;
			}
		}catch(Exception e) {
			logger.error("Exception occured while setting bean properties to obj reason: ", e);
		}
		return null;
	}

	public static void sendMail(Map<String, Object> data, String... args) {
		try {
			if(args.length < 2) {
				throw new Exception("Minimum info required to send mail");
			}
			String ftlFile  = args[0];
			String recipientEmail = args[1];
			String subject = args[2];
			String url = "www.test.com";/*ServletUtil.getFullServerURL(request) + new StringBuffer().append("https://localhost/web/nonsecure/activateUser/").append(URLEncoder.encode(activationCode, "UTF-8"));*/
			TemplateProcessor tmplProcess = new TemplateProcessor();	
			String content = tmplProcess.process(ftlFile, data);
			Object[] to = new Object[] { recipientEmail };
			MailServiceLocator.getService("default").sendMessage(to, null, subject, content, "html");
		}catch(Exception e) {
			logger.error("Exception occured while sending mail reason: ", e);
		}
	}

	public boolean isValidEmail(String email) {
		Boolean isValid = false;
		try {
			if(!email.isEmpty()) {
				String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
				isValid = email.matches(EMAIL_REGEX);
			}
		}catch(Exception e) {
			logger.error("Exception occured while validating email reason:", e);
		}
		return isValid;
	}
	
	/*
	 * This method generates 
	 * 5 digit random number
	 */
	public static int generateOTP() {
		ArrayList<Integer> numbers = new ArrayList<Integer>();
	    for(int i = 0; i < 10; i++){
	        numbers.add(i);
	    }

	    Collections.shuffle(numbers);

	    String otp = "";
	    for(int i = 0; i < 5; i++){
	        otp += numbers.get(i).toString();
	    }
	    return Integer.parseInt(otp);
	}
	
	public static void main(String argv[]) throws Exception {
		Utils.generateOTP();
		System.out.println(getOTPExpiryTimestamp());
	}
	
	public static Date getOTPExpiryTimestamp() {
		Calendar cal  = Calendar.getInstance();
		cal.add(Calendar.MINUTE, Constants.OTP_EXPIRY_MINUTES);
		return cal.getTime();
	}
	
	public static Date getCurrentTimestamp() {
		Calendar cal  = Calendar.getInstance();
		return cal.getTime();
	}

	public static void sendOTPDetailsMail(String fullName, int otp, String email) {
		try {
			Map<String, Object> resetPasswordData = new HashMap<String, Object>();
			resetPasswordData.put("OTP", String.valueOf(otp));
			resetPasswordData.put("ExpiryMinutes", Constants.OTP_EXPIRY_MINUTES);
			resetPasswordData.put("UserName", fullName);
			sendMail(resetPasswordData, "PasswordReset.ftl", email, otp+" - Verification code for password reset");
		}catch(Exception e) {
			logger.error("Exception occured in sendOTPDetailsMail method reason: ", e);
		}
	}

	public static void sendVoucherPurchaseNotificationMailToAdmins(String adminEmails,
			String fullName, List<CouponsCatalogue> pickedVouchers) {
		try {
			List<String> adminEmailsList =  Arrays.asList(adminEmails.split(","));
			for(String adminEmail : adminEmailsList) {
				Map<String, Object> voucherPurchaseData = new HashMap<String, Object>();
				voucherPurchaseData.put("purchasedCouponsList", pickedVouchers);
				voucherPurchaseData.put("UserName", fullName);
				sendMail(voucherPurchaseData, "VoucherPurchaseNotificationToAdmins.ftl", adminEmail,  "Alert New Voucher Purchase Notification !!!");
			}
		}catch(Exception e) {
			logger.error("Exception occured while sending notification mails to admin reason: ", e);
		}
	}
}
