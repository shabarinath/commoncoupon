package com.commoncoupon.dao;

import com.commoncoupon.domain.User;

public interface AdminDao {
	
	public Object get(@SuppressWarnings("rawtypes") Class clazz, long id) throws Exception;
	
	public void saveOrUpdate(Object entity) throws Exception;

	public void delete(Object entity) throws Exception;
	
	/*public OtherRelatedLink getOtherRelatedLinkByName(String displayName) throws Exception;
	
	public OtherRelatedLink getOtherRelatedLinkByHyperLink(String hyperlink) throws Exception;
	
	public NoticeBoardLink getNoticeBoardLinkByName(String displayName) throws Exception;
	
	public NoticeBoardLink getNoticeBoardLinkByHyperLink(String hyperlink) throws Exception;*/

	public User getUser(long id) throws Exception;

	public void saveOrUpdateUser(User user) throws Exception;
	
}
