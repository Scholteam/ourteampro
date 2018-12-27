package com.niit.dao;

import java.util.List;

import com.niit.entity.Student;
import com.niit.entity.Teacher;

public interface ITeacherDao {
	void save(Teacher u);
	void update(Teacher u) ;
	List<Teacher> findAll();
	List<Teacher> findByDesc();
	Teacher findById(Integer id);
}
