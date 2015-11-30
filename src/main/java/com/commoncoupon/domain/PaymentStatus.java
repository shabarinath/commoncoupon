package com.commoncoupon.domain;


/**
 * @author SHABARINATH
 * 29-Nov-2015 11:46:19 pm 2015 
 */

public enum PaymentStatus {
	
	SUCCESS("SUCCESS"),
	FAILED("FAILED"),
	NOT_INITIATED("NOT_INITIATED");
	
	
	private String name;
	
	/**Get KeyboardType ENUM
	 * @param name
	 * @return
	 */
	public static PaymentStatus parse(String name) {
		if(name != null)
			return PaymentStatus.valueOf(name.toUpperCase());
		return null;
	}
	
	PaymentStatus(String name) {
		this.name = name;
	}	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}

