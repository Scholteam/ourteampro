package com.niit.biz.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.biz.IStudentGradeBiz;
import com.niit.dao.IStudentGradeDao;
import com.niit.entity.StudentGrade;


@Repository
public class StudentGradeBiz implements IStudentGradeBiz{

	@Autowired
	private IStudentGradeDao studentGradeDao;
	
	@Override
	public void save(StudentGrade u) {
		studentGradeDao.save(u);
	}
	@Override
	public void update(StudentGrade u) {
		studentGradeDao.update(u);
	}
	@Override
	public List<StudentGrade> findAll() {
		return studentGradeDao.findAll();
	}
	@Override
	public List<StudentGrade> findByDesc() {
		return studentGradeDao.findByDesc();
	}
	@Override
	public StudentGrade findById(Integer id) {
		return studentGradeDao.findById(id);
	}
	
}
