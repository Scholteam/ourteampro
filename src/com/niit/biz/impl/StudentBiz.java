package com.niit.biz.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.biz.IStudentBiz;
import com.niit.dao.IStudentDao;
import com.niit.entity.Student;


@Repository
public class StudentBiz implements IStudentBiz{

	@Autowired
	private IStudentDao studentDao;
	
	@Override
	public void save(Student u) {
		studentDao.save(u);
	}
	@Override
	public void update(Student u) {
		studentDao.update(u);
	}
	@Override
	public List<Student> findAll() {
		return studentDao.findAll();
	}
	@Override
	public List<Student> findByDesc() {
		return studentDao.findByDesc();
	}
	@Override
	public Student findById(Integer id) {
		return studentDao.findById(id);
	}
	
}
