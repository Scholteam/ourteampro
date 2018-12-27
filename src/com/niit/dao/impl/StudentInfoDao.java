package com.niit.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.IStudentInfoDao;
import com.niit.entity.StudentInfo;

@Repository
public class StudentInfoDao implements IStudentInfoDao {

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
	public void save(StudentInfo u) {
		ht.save(u);
	}
	@Override
	public void update(StudentInfo u) {
		ht.update(u);
	}
	@Override
	public List<StudentInfo> findAll() {
		return ht.loadAll(StudentInfo.class);
	}
	@Override
	public List<StudentInfo> findByDesc() {
		String hql = "from StudentInfo order by SIid desc ";
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public StudentInfo findBySInum(int sid) {
		String hql = "from StudentInfo where SInum = "+sid;
		Query query = (Query) sessionFactory.getCurrentSession().createQuery(hql);
		return (StudentInfo) query.uniqueResult();
	}
	@Override
	public StudentInfo findById(Integer id) {
		return ht.get(StudentInfo.class, id);
	}
	
}
