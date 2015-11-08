package com.commoncoupon.dao;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.commoncoupon.domain.User;

public class AdminDaoImpl implements AdminDao {
	
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
	
	@Override
	public void saveOrUpdate(Object entity) throws Exception {
		hibernateTemplate.saveOrUpdate(entity);
	}

	@Override
	public void delete(Object entity) throws Exception {
		 hibernateTemplate.delete(entity);
	}
	
	/*@SuppressWarnings("unchecked")
	@Override
	public OtherRelatedLink getOtherRelatedLinkByName(String displayName) throws Exception {
		List<OtherRelatedLink> links = hibernateTemplate.find("from OtherRelatedLink orl where orl.displayName = ?", new Object[] { displayName });
		if (links.size() > 0) {
			return links.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public OtherRelatedLink getOtherRelatedLinkByHyperLink(String hyperlink) throws Exception {
		List<OtherRelatedLink> links = hibernateTemplate.find("from OtherRelatedLink orl where orl.hyperlink = ?", new Object[] { hyperlink });
		if (links.size() > 0) {
			return links.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public NoticeBoardLink getNoticeBoardLinkByName(String displayName) throws Exception {
		List<NoticeBoardLink> links = hibernateTemplate.find("from NoticeBoardLink nrl where nrl.displayName = ?", new Object[] { displayName });
		if (links.size() > 0) {
			return links.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public NoticeBoardLink getNoticeBoardLinkByHyperLink(String hyperlink) throws Exception {
		List<NoticeBoardLink> links = hibernateTemplate.find("from NoticeBoardLink nrl where nrl.hyperlink = ?", new Object[] { hyperlink });
		if (links.size() > 0) {
			return links.get(0);
		}
		return null;
	}*/

	@Override
	public User getUser(long id) throws Exception {
		return hibernateTemplate.get(User.class, id);
	}

	@Override
	public void saveOrUpdateUser(User user) throws Exception {
		hibernateTemplate.saveOrUpdate(user);
	}
}
