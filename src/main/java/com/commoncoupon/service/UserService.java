package com.commoncoupon.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.commoncoupon.domain.Recipient;
import com.commoncoupon.domain.Sender;
import com.commoncoupon.domain.User;

/**
 * @author SHABARINATH
 * 24-Nov-2015 12:00:48 am 2015 
 */

public interface UserService extends UserDetailsService {

	void saveSender(Sender sender) throws Exception;

	void saveRecipient(Recipient recipient) throws Exception;

	Object get(@SuppressWarnings("rawtypes") Class clazz, long id) throws Exception;

	User getUserByEmail(String email) throws Exception;

	void saveUser(User userFromDb)  throws Exception;

	User getUserById(long userId)  throws Exception;

}

