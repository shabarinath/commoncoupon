package com.commoncoupon.dao;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.commoncoupon.domain.PaymentRequestResponse;

/**
 * @author SHABARINATH
 * 30-Nov-2015 12:57:05 am 2015 
 */

public class PaymentDaoImpl implements PaymentDao {
	
	private HibernateTemplate hibernateTemplate;

	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void savePaymentRequest(PaymentRequestResponse paymentRequestDetails)
			throws Exception {
		hibernateTemplate.saveOrUpdate(paymentRequestDetails);
	}

}

