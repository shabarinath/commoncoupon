package com.commoncoupon.dao;

import com.commoncoupon.domain.Recipient;
import com.commoncoupon.domain.Sender;
import com.commoncoupon.domain.User;

public interface UserDao {
		
	public User findByUsername(String username);

	public User getUserByEmail(String email);

	public void saveSender(Sender sender) throws Exception;

	public void saveRecipient(Recipient recipient) throws Exception;

	public Object get(Class clazz, long id)  throws Exception;

	public void saveUser(User userFromDb)  throws Exception;

}
