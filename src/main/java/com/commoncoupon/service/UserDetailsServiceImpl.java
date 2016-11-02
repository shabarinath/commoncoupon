package com.commoncoupon.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.commoncoupon.auth.AuthenticationContext;
import com.commoncoupon.controller.PasswordEncoder;
import com.commoncoupon.dao.UserDao;
import com.commoncoupon.domain.User;
import com.commoncoupon.domain.UserRole;

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

	/*@Override
	public void saveSender(Sender sender) throws Exception {
		userDao.saveSender(sender);
	}

	@Override
	public void saveRecipient(Recipient recipient) throws Exception {
		userDao.saveRecipient(recipient);
	}*/

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

	@Override
	public User getUserById(long userId) throws Exception {
		return (User) userDao.get(User.class, userId);
	}

	@Override
	public void registerUser(User user) throws Exception {
		PasswordEncoder passwordEncoder = new PasswordEncoder();
		String encodedPassword = passwordEncoder.encodePassword(user.getPassword(), null);
		user.setPassword(encodedPassword);
		user.setActive(Boolean.TRUE);
		UserRole userRole = new UserRole();
		userRole.setAuthority("ROLE_USER");
		userRole.setUser(user);
		List<UserRole> userRoles = new ArrayList<UserRole>();
		userRoles.add(userRole);
		user.setUserRoles(userRoles);
		userDao.saveUser(user);
	}

	@Override
	public User getCurrentLoggedInUser() throws Exception {
		User loggedInUser = userDao.getUserByEmail(AuthenticationContext.getLoggedInUserEmail());
		return loggedInUser;
	}
}