package com.niit.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.biz.IStudentExchangeBiz;
import com.niit.dao.IStudentExchangeDao;
import com.niit.entity.StudentExchange;


@Repository
public class StudentExchangeBiz implements IStudentExchangeBiz{

	@Autowired
	private IStudentExchangeDao studentExchangeDao;
	
	@Override
	public void save(StudentExchange u) {
		studentExchangeDao.save(u);
	}
	@Override
	public void update(StudentExchange u) {
		studentExchangeDao.update(u);
	}
	@Override
	public List<StudentExchange> findAll() {
		return studentExchangeDao.findAll();
	}
	@Override
	public List<StudentExchange> findByDesc() {
		return studentExchangeDao.findByDesc();
	}
	@Override
	public StudentExchange findById(Integer id) {
		return studentExchangeDao.findById(id);
	}
	
}
