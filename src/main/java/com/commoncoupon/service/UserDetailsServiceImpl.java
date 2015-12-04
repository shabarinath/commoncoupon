package com.commoncoupon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.commoncoupon.dao.UserDao;
import com.commoncoupon.domain.Recipient;
import com.commoncoupon.domain.Sender;
import com.commoncoupon.domain.User;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserService {

	private UserDao userDao;
	private Assembler assembler;

	/*
	 * (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 * Modifiy this method to change login whether user needs to login using username or email
	 */
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String email)
			throws UsernameNotFoundException, DataAccessException {
		User userEntity = null;
		try {
			
			userEntity	= userDao.getUserByEmail(email);
		} catch(Exception e) {
			e.printStackTrace();
		}
		if (userEntity == null)
			throw new UsernameNotFoundException("user not found");

		return assembler.buildUserFromUserEntity(userEntity);
	}
	
	@Transactional(readOnly = true)
	public User loadUserObjectByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {

		User userEntity = userDao.findByUsername(username);
		if (userEntity == null)
			throw new UsernameNotFoundException("user not found");

		return userEntity;
	}


	@Autowired
	@Required
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Autowired
	@Required
	public void setAssembler(Assembler assembler) {
		this.assembler = assembler;
	}

	@Override
	public void saveSender(Sender sender) throws Exception {
		userDao.saveSender(sender);
	}

	@Override
	public void saveRecipient(Recipient recipient) throws Exception {
		userDao.saveRecipient(recipient);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Object get(@SuppressWarnings("rawtypes") Class clazz, long id) throws Exception {
		return userDao.get(clazz, id);
	}

	@Override
	public User getUserByEmail(String email) throws Exception {
		return userDao.getUserByEmail(email);
	}

	@Override
	public void saveUser(User userFromDb) throws Exception {
		userDao.saveUser(userFromDb);
	}
}