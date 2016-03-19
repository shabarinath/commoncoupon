package com.commoncoupon.dao;

import com.commoncoupon.domain.HomePage;

public interface DefaultDao {

	public Object get(@SuppressWarnings("rawtypes") Class clazz, long id) throws Exception;

	public HomePage getHomePageConfig() throws Exception;

	/*public List<Resource> getResourcesByTab(Tab tab) throws Exception;

	public List<OtherRelatedLink> getOtherRelatedLinks() throws Exception;
	
	public List<NoticeBoardLink> getNoticeBoardLinks() throws Exception;
	
	public Description getDescription(Tab tab) throws Exception;

	public List<CustomStyle> getCustomStyles() throws Exception;
	
	public List<StaffDetail> getStaffDetails() throws Exception;
	
	public List<Department> getDepartments() throws Exception;
	
	public List<StaffDetail> getStaffDetailsByDepartment(Department dept) throws Exception;
	
	public List<Course> getCourses() throws Exception;*/
}
