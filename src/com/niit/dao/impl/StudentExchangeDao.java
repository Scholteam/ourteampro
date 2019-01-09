package com.niit.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.IStudentExchangeDao;
import com.niit.entity.StudentExchange;

@Repository
public class StudentExchangeDao implements IStudentExchangeDao {

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
	public void save(StudentExchange u) {
		ht.save(u);
	}
	@Override
	public void update(StudentExchange u) {
		ht.update(u);
	}
	@Override
	public List<StudentExchange> findAll() {
		return ht.loadAll(StudentExchange.class);
	}
	@Override
	public List<StudentExchange> findByDesc() {
		String hql = "from Student order by SId desc ";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public StudentExchange findById(Integer id) {
		return ht.get(StudentExchange.class, id);
	}
	
}
