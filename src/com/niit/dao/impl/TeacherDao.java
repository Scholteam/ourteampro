package com.niit.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.IStudentDao;
import com.niit.dao.ITeacherDao;
import com.niit.entity.Student;
import com.niit.entity.Teacher;

@Repository
public class TeacherDao implements ITeacherDao {

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
	public void save(Teacher u) {
		ht.save(u);
	}
	@Override
	public void update(Teacher u) {
		ht.update(u);
	}
	@Override
	public List<Teacher> findAll() {
		return ht.loadAll(Teacher.class);
	}
	@Override
	public List<Teacher> findByDesc() {
		String hql = "from Teacher order by TId desc ";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public Teacher findById(Integer id) {
		return ht.get(Teacher.class, id);
	}
	
}
