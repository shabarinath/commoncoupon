package com.commoncoupon.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.commoncoupon.domain.HomePage;

public class DefaultDaoImpl implements DefaultDao {

	private HibernateTemplate hibernateTemplate;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Object get(Class clazz, long id) throws Exception {
		return hibernateTemplate.get(clazz, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public HomePage getHomePageConfig() {
		List<HomePage> homePages = hibernateTemplate.find("from HomePage homePage where homePage.id = ?", new Object[] { 1L });
		if (homePages.size() > 0) {
			return homePages.get(0);
		}
		return null;
	}

}
