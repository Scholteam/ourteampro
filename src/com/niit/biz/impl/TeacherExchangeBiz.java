package com.niit.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.biz.ITeacherExchangeBiz;
import com.niit.dao.ITeacherExchangeDao;
import com.niit.entity.TeacherExchange;


@Repository
public class TeacherExchangeBiz implements ITeacherExchangeBiz{

	@Autowired
	private ITeacherExchangeDao teacherExchangeDao;
	
	@Override
	public void save(TeacherExchange u) {
		teacherExchangeDao.save(u);
	}
	@Override
	public void update(TeacherExchange u) {
		teacherExchangeDao.update(u);
	}
	@Override
	public List<TeacherExchange> findAll() {
		return teacherExchangeDao.findAll();
	}
	@Override
	public List<TeacherExchange> findByDesc() {
		return teacherExchangeDao.findByDesc();
	}
	@Override
	public TeacherExchange findById(Integer id) {
		return teacherExchangeDao.findById(id);
	}
	
}
