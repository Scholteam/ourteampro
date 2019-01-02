package com.niit.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.IStudentGradeDao;
import com.niit.entity.StudentGrade;

@Repository
public class StudentGradeDao implements IStudentGradeDao {

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
	public void save(StudentGrade u) {
		ht.save(u);
	}
	@Override
	public void update(StudentGrade u) {
		ht.update(u);
	}
	@Override
	public List<StudentGrade> findAll() {
		return ht.loadAll(StudentGrade.class);
	}
	@Override
	public List<StudentGrade> findByDesc() {
		String hql = "from StudentGrade order by GId desc ";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public StudentGrade findById(Integer id) {
		return ht.get(StudentGrade.class, id);
	}
	
}
