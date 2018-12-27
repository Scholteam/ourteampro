package com.niit.biz;

import java.util.List;

import com.niit.entity.Student;

public interface IStudentBiz {
	void save(Student u);
	void update(Student u);
	List<Student> findAll();
	Student findById(Integer id);
	List<Student> findByDesc();
}
