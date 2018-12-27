package com.niit.dao;

import java.util.List;

import com.niit.entity.Student;

public interface IStudentDao {
	void save(Student u);
	public void update(Student u) ;
	List<Student> findAll() ;
	Student findById(Integer id);
	List<Student> findByDesc();
}
