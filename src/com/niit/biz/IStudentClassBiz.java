package com.niit.biz;

import java.util.List;

import com.niit.entity.Student;
import com.niit.entity.StudentClass;

public interface IStudentClassBiz {
	void save(StudentClass u);
	void update(StudentClass u);
	List<StudentClass> findAll();
	List<StudentClass> findByDesc();
	StudentClass findById(Integer id);
}
