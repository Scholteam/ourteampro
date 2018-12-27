package com.niit.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.IStudentDao;
import com.niit.entity.Student;

@Repository
public class StudentDao implements IStudentDao {

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
	public void save(Student u) {
		ht.save(u);
	}
	@Override
	public void update(Student u) {
		ht.update(u);
	}
	@Override
	public List<Student> findAll() {
		return ht.loadAll(Student.class);
	}
	@Override
	public List<Student> findByDesc() {
		String hql = "from Student order by SId desc ";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public Student findById(Integer id) {
		return ht.get(Student.class, id);
	}
	
}
