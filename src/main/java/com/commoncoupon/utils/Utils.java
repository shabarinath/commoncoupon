package com.commoncoupon.utils;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.commoncoupon.bean.PaymentRequestBean;
import com.commoncoupon.bean.PaymentRequestResponseBean;
import com.commoncoupon.domain.PaymentRequestResponse;

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
		     mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, true);
		     return (T) mapper.readValue(responseString, clazz);
		}catch(Exception e){
			logger.error("Exception occured while converting json to object reason: ", e);
		}
		return null;
	}

	public static PaymentRequestResponse setPaymentRequestResponseToObj(PaymentRequestResponseBean paymentRequestResponseBean) {
		try{
			if(paymentRequestResponseBean != null) {
				PaymentRequestResponse paymentResponse = new PaymentRequestResponse();
				PaymentRequestBean paymentRequest = paymentRequestResponseBean.getPaymentRequest();
				paymentResponse.setPaymentId(paymentRequest.getId());
				paymentResponse.setPhone(paymentRequest.getPhone());
				paymentResponse.setEmail(paymentRequest.getEmail());
				paymentResponse.setBuyerName(paymentRequest.getBuyerName());
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

}
