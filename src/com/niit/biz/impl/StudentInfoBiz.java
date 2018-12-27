package com.niit.biz.impl;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.biz.IStudentInfoBiz;
import com.niit.dao.IStudentInfoDao;
import com.niit.entity.StudentInfo;


@Repository
public class StudentInfoBiz implements IStudentInfoBiz{

	@Autowired
	private IStudentInfoDao studentInfoDao;
	
	@Override
	public void save(StudentInfo u) {
		studentInfoDao.save(u);
	}
	@Override
	public void update(StudentInfo u) {
		studentInfoDao.update(u);
	}
	@Override
	public List<StudentInfo> findAll() {
		return studentInfoDao.findAll();
	}
	@Override
	public List<StudentInfo> findByDesc() {
		return studentInfoDao.findByDesc();
	}
	@Override
	public StudentInfo findBySInum(int sid) {
		return studentInfoDao.findBySInum(sid);
	}
	@Override
	public StudentInfo findById(Integer id) {
		return studentInfoDao.findById(id);
	}
	
}
