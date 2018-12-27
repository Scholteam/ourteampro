package com.niit.biz.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.biz.IStudentClassBiz;
import com.niit.dao.IStudentClassDao;
import com.niit.entity.StudentClass;


@Repository
public class StudentClassBiz implements IStudentClassBiz{

	@Autowired
	private IStudentClassDao studentClassDao;
	
	@Override
	public void save(StudentClass u) {
		studentClassDao.save(u);
	}
	@Override
	public void update(StudentClass u) {
		studentClassDao.update(u);
	}
	@Override
	public List<StudentClass> findAll() {
		return studentClassDao.findAll();
	}
	@Override
	public List<StudentClass> findByDesc() {
		return studentClassDao.findByDesc();
	}
	@Override
	public StudentClass findById(Integer id) {
		return studentClassDao.findById(id);
	}
	
}
