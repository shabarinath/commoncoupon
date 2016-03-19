package com.commoncoupon.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.commoncoupon.domain.Recipient;
import com.commoncoupon.domain.Sender;
import com.commoncoupon.domain.User;


public class UserDaoImpl implements UserDao {

	private HibernateTemplate hibernateTemplate;
	
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Object get(Class clazz, long id) throws Exception {
		return hibernateTemplate.get(clazz, id);
	}

	public User findByUsername(String username) {
		@SuppressWarnings("unchecked")
		List<User> users = hibernateTemplate.find("from User user where user.username=?",new Object[]{username});
		if(users.size()>0)
			return users.get(0);
		return null;
	}

	@Override
	public User getUserByEmail(String email) {
		String queryString = "from User user where user.email=?";
		List<User> users =  hibernateTemplate.find(queryString, email);
		return users != null && users.iterator().hasNext() ? users.iterator().next() : null;
	}

	@Override
	public void saveSender(Sender sender) throws Exception {
		hibernateTemplate.saveOrUpdate(sender);
	}

	@Override
	public void saveRecipient(Recipient recipient) throws Exception {
		hibernateTemplate.saveOrUpdate(recipient);
	}

	@Override
	public void saveUser(User user) throws Exception {
		hibernateTemplate.saveOrUpdate(user);
	}

}
