package com.niit.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.ITeacherExchangeDao;
import com.niit.entity.TeacherExchange;

@Repository
public class TeacherExchangeDao implements ITeacherExchangeDao {

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
	public void save(TeacherExchange u) {
		ht.save(u);
	}
	@Override
	public void update(TeacherExchange u) {
		ht.update(u);
	}
	@Override
	public List<TeacherExchange> findAll() {
		return ht.loadAll(TeacherExchange.class);
	}
	@Override
	public List<TeacherExchange> findByDesc() {
		String hql = "from Teacher order by TId desc ";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public TeacherExchange findById(Integer id) {
		return ht.get(TeacherExchange.class, id);
	}
	
}
