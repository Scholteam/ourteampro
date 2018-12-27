package com.niit.biz.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.biz.ITeacherBiz;
import com.niit.dao.ITeacherDao;
import com.niit.entity.Teacher;


@Repository
public class TeacherBiz implements ITeacherBiz{

	@Autowired
	private ITeacherDao teacherDao;
	
	@Override
	public void save(Teacher u) {
		teacherDao.save(u);
	}
	@Override
	public void update(Teacher u) {
		teacherDao.update(u);
	}
	@Override
	public List<Teacher> findAll() {
		return teacherDao.findAll();
	}
	@Override
	public List<Teacher> findByDesc() {
		return teacherDao.findByDesc();
	}
	@Override
	public Teacher findById(Integer id) {
		return teacherDao.findById(id);
	}
	
}
