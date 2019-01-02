package com.niit.dao;

import java.util.List;

import com.niit.entity.StudentGrade;

public interface IStudentGradeDao {
	void save(StudentGrade u);
	void update(StudentGrade u);
	List<StudentGrade> findAll();
	List<StudentGrade> findByDesc();
	StudentGrade findById(Integer id);
}
