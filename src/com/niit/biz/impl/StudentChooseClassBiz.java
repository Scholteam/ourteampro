package com.niit.biz.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.biz.IStudentChooseClassBiz;
import com.niit.dao.IStudentChooseClassDao;
import com.niit.entity.StudentChooseClass;


@Repository
public class StudentChooseClassBiz implements IStudentChooseClassBiz{

	@Autowired
	private IStudentChooseClassDao studentChooseClassDao;
	
	@Override
	public void save(StudentChooseClass u) {
		studentChooseClassDao.save(u);
	}
	@Override
	public void update(StudentChooseClass u) {
		studentChooseClassDao.update(u);
	}
	@Override
	public List<StudentChooseClass> findAll() {
		return studentChooseClassDao.findAll();
	}
	@Override
	public List<StudentChooseClass> findByDesc() {
		return studentChooseClassDao.findByDesc();
	}
	@Override
	public StudentChooseClass findById(Integer id) {
		return studentChooseClassDao.findById(id);
	}
	
}
