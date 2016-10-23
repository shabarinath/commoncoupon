package com.commoncoupon.dao;

import com.commoncoupon.domain.HomePage;

public interface DefaultDao {

	public Object get(@SuppressWarnings("rawtypes") Class clazz, long id) throws Exception;

	public HomePage getHomePageConfig() throws Exception;

}
