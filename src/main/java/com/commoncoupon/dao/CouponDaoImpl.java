package com.commoncoupon.dao;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * @author SHABARINATH
 * 21-Nov-2015 11:55:51 pm 2015 
 */

public class CouponDaoImpl implements CouponDao {
	
	private HibernateTemplate hibernateTemplate;
	
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
}

