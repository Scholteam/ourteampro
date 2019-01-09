package com.niit.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.IReviewDao;
import com.niit.dao.IStudentDao;
import com.niit.entity.Review;
import com.niit.entity.Student;

@Repository
public class ReviewDao implements IReviewDao {

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
	public void save(Review u) {
		ht.save(u);
	}
	@Override
	public void update(Review u) {
		ht.update(u);
	}
	@Override
	public List<Review> findAll() {
		return ht.loadAll(Review.class);
	}
	@Override
	public List<Review> findByDesc() {
		String hql = "from Review order by RId desc ";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public Review findById(Integer id) {
		return ht.get(Review.class, id);
	}
	
}
