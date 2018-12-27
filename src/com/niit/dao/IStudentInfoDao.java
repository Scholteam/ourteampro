package com.niit.dao;

import java.util.List;

import com.niit.entity.StudentInfo;

public interface IStudentInfoDao {
	void save(StudentInfo u);
	void update(StudentInfo u) ;
	List<StudentInfo> findAll() ;
	List<StudentInfo> findByDesc();
	StudentInfo findBySInum(int sid);
	StudentInfo findById(Integer id);
}
