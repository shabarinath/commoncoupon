package com.commoncoupon.utils;

import java.math.BigInteger;
import java.security.SecureRandom;

abstract public class RandomString {
	/** Minimum length for a decent string */
	public static final int MIN_LENGTH = 15;

	/** The random number generator. */
	protected static java.util.Random r = new java.util.Random();

	protected static char[] goodChar = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '2', '3', '4', '5', '6', '7', '8', '9'};

	/* Generate a Password object with a random password. */
	public static String getNext() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < MIN_LENGTH; i++) {
			sb.append(goodChar[r.nextInt(goodChar.length)]);
		}
		return sb.toString();
	}
	
	/* Generate a Password object with a random password. */
	public static String getNext(int len) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < len; i++) {
			sb.append(goodChar[r.nextInt(goodChar.length)]);
		}
		return sb.toString();
	}
	
	public static String generateCouponPassword() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32).substring(0, 16);
	}
}
