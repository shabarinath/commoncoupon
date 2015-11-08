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

	/*@SuppressWarnings("unchecked")
	@Override
	public List<Resource> getResourcesByTab(Tab tab) {
		return hibernateTemplate.find("from Resource resource where resource.tab = ? order by resource.id desc", new Object[] { tab });
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OtherRelatedLink> getOtherRelatedLinks() throws Exception {
		return hibernateTemplate.find("FROM OtherRelatedLink orl order by id desc");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<NoticeBoardLink> getNoticeBoardLinks() throws Exception {
		return hibernateTemplate.find("FROM NoticeBoardLink nrl order by id desc");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Description getDescription(Tab tab) throws Exception {
		List<Description> desc =  hibernateTemplate.find("from Description description where description.tab = ? ", new Object[] { tab });
		if(desc.size() > 0) {
			return desc.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CustomStyle> getCustomStyles() throws Exception {
		return hibernateTemplate.find("FROM CustomStyle");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<StaffDetail> getStaffDetails() throws Exception {
		return hibernateTemplate.find("FROM StaffDetail");
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getDepartments() throws Exception {
		return hibernateTemplate.find("FROM Department order by displayOrder");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<StaffDetail> getStaffDetailsByDepartment(Department dept) throws Exception {
		return hibernateTemplate.find("FROM StaffDetail WHERE department.id = ?", dept.getId());
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Course> getCourses() throws Exception {
		return hibernateTemplate.find("FROM Course order by displayOrder");
	}*/
}
