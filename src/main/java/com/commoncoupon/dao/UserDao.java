package com.commoncoupon.dao;

import com.commoncoupon.domain.User;

public interface UserDao {
		
	public User findByUsername(String username);
	
}
