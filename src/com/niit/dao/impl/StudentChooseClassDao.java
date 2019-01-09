package com.niit.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.IStudentChooseClassDao;
import com.niit.entity.StudentChooseClass;

@Repository
public class StudentChooseClassDao implements IStudentChooseClassDao {

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
	public void save(StudentChooseClass u) {
		ht.save(u);
	}
	@Override
	public void update(StudentChooseClass u) {
		ht.update(u);
	}
	@Override
	public List<StudentChooseClass> findAll() {
		return ht.loadAll(StudentChooseClass.class);
	}
	@Override
	public List<StudentChooseClass> findByDesc() {
		String hql = "from StudentChooseClass order by CCId desc ";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public StudentChooseClass findById(Integer id) {
		return ht.get(StudentChooseClass.class, id);
	}
	
}
