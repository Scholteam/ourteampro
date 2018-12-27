package com.niit.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.IStudentClassDao;
import com.niit.dao.IStudentDao;
import com.niit.entity.Student;
import com.niit.entity.StudentClass;

@Repository
public class StudentClassDao implements IStudentClassDao {

	@Autowired
	private HibernateTemplate ht;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}
	@Override
	public void save(StudentClass u) {
		ht.save(u);
	}
	@Override
	public void update(StudentClass u) {
		ht.update(u);
	}
	@Override
	public List<StudentClass> findAll() {
		return ht.loadAll(StudentClass.class);
	}
	@Override
	public List<StudentClass> findByDesc() {
		String hql = "from StudentClass order by CId desc ";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public StudentClass findById(Integer id) {
		return ht.get(StudentClass.class, id);
	}
	
}
