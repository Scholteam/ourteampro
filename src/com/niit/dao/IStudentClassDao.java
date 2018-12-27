package com.niit.dao;

import java.util.List;

import com.niit.entity.StudentClass;

public interface IStudentClassDao {
	void save(StudentClass u);
	void update(StudentClass u);
	List<StudentClass> findAll();
	List<StudentClass> findByDesc();
	StudentClass findById(Integer id);
}
