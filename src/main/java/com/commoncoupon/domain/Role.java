package com.commoncoupon.domain;

public enum Role {
	
	ROLE_ADMIN("ROLE_ADMIN", "Admin"),
	ROLE_USER("ROLE_USER", "User");
    
    private final String code;
	private final String text;
	
	Role(String code,String text)
	{
		this.code = code;
		this.text = text;
	}

	public String getCode() {
		return code;
	}

	public String getText() {
		return text;
	}
}
